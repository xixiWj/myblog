package com.wj.blog.service.impl;

import com.wj.blog.common.domain.Acticle;
import com.wj.blog.common.domain.RightInfo;
import com.wj.blog.dao.BlogMapper;
import com.wj.blog.dao.CommentMapper;
import com.wj.blog.service.ArticleService;
import com.wj.blog.service.BlogService;
import com.wj.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Random;

@Service
@Transactional(rollbackFor = Exception.class,readOnly = false,propagation = Propagation.REQUIRED)
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private BlogService blogService;

    @Autowired
    private CommentService commentService;


    /**
     * 查询文章
     * @param blogId
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
    public Acticle findActicleByBlogId(String blogId){
        Acticle acticle = new Acticle();
        try {
            acticle.setBlog(blogService.findBlogByBlogId(blogId));
            acticle.setComments(commentService.findCommentByBlogId(blogId));
            acticle.setPreBlog(blogService.findPreBlogByBlogId(blogId));
            acticle.setNextBlog(blogService.findNextBlogByBlogId(blogId));
            acticle.setReComActicle(blogService.findReComBlog(blogId));
            acticle.setRightInfo(blogService.getRightInfo(blogId));
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            return  acticle;
        }
    }




    /**
     * 热门文章
     */
    @Override
    @Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
    public Acticle findActicleByHot(){
        Acticle acticle = new Acticle();
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            return  acticle;
        }
    }


    /**
     * 点赞
     * @param blogId
     */
    @Override
    public void favorite(String blogId) {
        try {
            blogService.addBlogLikeCountByBlogId(blogId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
