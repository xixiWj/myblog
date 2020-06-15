package com.wj.blog.service.impl;

import com.wj.blog.common.domain.*;
import com.wj.blog.dao.*;
import com.wj.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
@Transactional(rollbackFor = Exception.class,readOnly = false,propagation = Propagation.REQUIRED)
public class BlogServiceImpl implements BlogService {

	@Autowired
	private BlogMapper blogMapper;

	@Autowired
	private BlogcategoryMapper blogcategoryMapper;

	@Autowired
	private CategoryMapper categoryMapper;

	@Autowired
	private LeaveMsgMapper leaveMsgMapper;

	@Autowired
	private CommentMapper commentMapper;

	@Autowired
	private ConfigMapper configMapper;


	@Override
	@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
	public List<Blog> findAllByCategoryIdAndUid(BlogCriteria blogCriteria, Integer pc, Integer ps) {
		return null;
	}

	@Override
	public List<Blog> findHot() {
		return blogMapper.findFiveByVisit();
	}


	/**
	 * 分页查询
	 * @param blogCriteria
	 * @param pc
	 * @param ps
	 * @return
	 */

	@Override
	@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
	public PageBean<Blog> findByDate(BlogCriteria blogCriteria,Integer pc, Integer ps) {
		PageBean<Blog> pageBean = new PageBean<>();
		pageBean.setPc(pc);
		pageBean.setPs(ps);
		int total = blogMapper.selectTotalBlog(blogCriteria);
		int start = (pc-1)*ps;
		pageBean.setTr(total);
		List<Blog> blogs = blogMapper.selectByDate(blogCriteria,start,ps);
		pageBean.setListBean(blogs);
		return pageBean;
	}



	/**
	 * 查询右侧信息
	 * @param blogId
	 * @return
	 */
	@Override
	@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
	public RightInfo getRightInfo(String blogId){
		RightInfo rightInfo = new RightInfo();
		try {
			//热门文章
			rightInfo.setHots(findHot());
			//热门评论
			rightInfo.setHotComments(findByComments());
			//相关
			rightInfo.setRelate(findByRelate(blogId));
			//随机文章
			rightInfo.setRandom(findByRandom());
			//猜你喜欢
			rightInfo.setLike(findByRandom());

			//得到分类集合
			rightInfo.setCategorys(categoryMapper.findAll());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			return  rightInfo;
		}
	}



	@Override
	public PageBean<Blog> findAllByUserId(BlogCriteria blogCriteria) {
		return null;
	}

	@Override
	@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
	public PageBean<Blog> findByCategoryId(BlogCriteria blogCriteria, Integer pc, Integer ps) {
		PageBean<Blog> pageBean = new PageBean<>();
		pageBean.setPc(pc);
		pageBean.setPs(ps);
		int total = blogMapper.selectTotalBlog(blogCriteria);
		int start = (pc-1)*ps;
		pageBean.setTr(total);
		List<Blog> blogs = blogMapper.selectByDate(blogCriteria,start,ps);
		pageBean.setListBean(blogs);
		return pageBean;
	}

	@Override
	public PageBean<Blog> findByUserid(BlogCriteria blogCriteria, Integer pc, Integer ps) {
		return null;
	}

	@Override
	public PageBean<Blog> findByUserIdAndCategoryId(BlogCriteria blogCriteria, String cacategoryId, Integer pc, Integer ps) {
		return null;
	}

	/**
	 * 通过ID 查询博客信息
	 * @param blogId
	 * @return
	 */
	@Override
	@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
	public Blog findBlogByBlogId(String blogId) {
		return blogMapper.selectByPrimaryKey(blogId);
	}

	@Override
	@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
	public Blog findPreBlogByBlogId(String blogId) throws Exception {
		return blogMapper.selectPreBlogByBlogId(blogId);
	}

	@Override
	@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
	public Blog findNextBlogByBlogId(String blogId) throws Exception {
		return blogMapper.selectNextBlogByBlogId(blogId);
	}

	/**
	 * 得到网站信息
	 * @return
	 */
	@Override
	@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
	public WebInfo getWebInfo() {
		WebInfo webInfo = new WebInfo();
		//查询博客总数
		webInfo.setBlogTotal(blogMapper.selectTotalBlog(new BlogCriteria()));
		//查询留言评论总数
		webInfo.setLeaveMessageTotal(commentMapper.selectTotal()+leaveMsgMapper.selectTotal());
		//查询分类总数
		webInfo.setCategoryTotal(categoryMapper.selectTotal());
		//查询标签总数
		webInfo.setNoteTotal(88);
		//查询链接总数
		webInfo.setLinkTotal(3);
		//查询网站最后更新时间
		try {
			webInfo.setLastUpdateTime(configMapper.selectFirst().getLastUpdateTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return webInfo;
	}

	/**
	 * 查询推荐文章
	 * @param blogId
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
	public List<Blog> findReComBlog(String blogId) throws Exception {
		Blog blog = blogMapper.selectByPrimaryKey(blogId);
		String categoryId =  blog.getBlogCate();
		BlogCriteria blogCriteria = new BlogCriteria();
		blogCriteria.setCategoryId(categoryId);
		int blogTotal = blogMapper.selectTotalBlog(blogCriteria);
		List<Blog> reComBlogs = null;
		if(blogTotal<4){
			 reComBlogs = blogMapper.selectByDate(blogCriteria,0,blogTotal);
		}else{
			Random r = new Random();
			int  m = blogTotal - 3;
			int start  = r.nextInt(m);
			reComBlogs = blogMapper.selectByDate(blogCriteria,start,4);
		}
		return reComBlogs;
	}

	/**
	 * 点赞 增加喜欢数
	 * @param blogId
	 * @throws Exception
	 */
	@Override
	public void addBlogLikeCountByBlogId(String blogId) throws Exception{
		try {
			Blog blog = blogMapper.selectByPrimaryKey(blogId);
			if (blog==null){
				throw new Exception();
			}
			if(blog.getBlogLikeCount()==null){
				blog.setBlogLikeCount(0);
			}
			blog.setBlogLikeCount(blog.getBlogLikeCount()+1);
			blogMapper.updateByPrimaryKey(blog);
		}catch (Exception e){
			e.printStackTrace();
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
	public List<Blog> findByComments() {
		List<Blog> blogs = new ArrayList<>();
		try {
			blogs = blogMapper.selectByComments();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			return blogs;
		}
	}


	/**
	 * 查询相关文章
	 * @param blogId
	 * @return
	 */
	@Override
	@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
	public List<Blog> findByRelate(String blogId) {
		List<Blog> blogs = new ArrayList<>();
		try {
			if(blogId==null){
				blogs = findByRandom();
			}else {
				Blog blog = blogMapper.selectByPrimaryKey(blogId);
				String categoryId =  blog.getBlogCate();
				BlogCriteria blogCriteria = new BlogCriteria();
				blogCriteria.setCategoryId(categoryId);
				int blogTotal = blogMapper.selectTotalBlog(blogCriteria);
				if(blogTotal<5){
					blogs = blogMapper.selectByDate(blogCriteria,0,blogTotal);
				}else{
					Random r = new Random();
					int  m = blogTotal - 4;
					int start  = r.nextInt(m);
					blogs = blogMapper.selectByDate(blogCriteria,start,5);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return blogs;
		}
	}


	/**
	 * 查询随机文章
	 * @param
	 * @return
	 */
	@Override
	@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
	public List<Blog> findByRandom() {
		List<Blog> blogs = new ArrayList<>();
		Random r = new Random();
		try {
			BlogCriteria blogCriteria = new BlogCriteria();
			//查询文章总数
			int blogTotal = blogMapper.selectTotalBlog(blogCriteria);
			if(blogTotal<5) {
				int end =r.nextInt(blogTotal)+1;
				blogs = blogMapper.selectByDate(blogCriteria,0, end);
			}
			else{
				int start = r.nextInt(blogTotal-2);
				blogs = blogMapper.selectByDate(blogCriteria,start,5);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return blogs;
		}
	}


}
