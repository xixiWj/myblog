package com.wj.blog.service;


import com.wj.blog.common.domain.Acticle;
import com.wj.blog.common.domain.RightInfo;

public interface ArticleService {
    /**
     *  查询文章信息
     * @param blogId
     * @return
     */
    Acticle findActicleByBlogId(String blogId);

    /**
     * 热门文章
     * @param
     * @return
     */
    public Acticle findActicleByHot();

    /**
     * 点赞
     * @param blogId
     */
    void favorite(String blogId);

}
