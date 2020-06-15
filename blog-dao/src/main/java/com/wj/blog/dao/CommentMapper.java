package com.wj.blog.dao;

import com.wj.blog.common.domain.Comment;

import java.util.List;

public interface CommentMapper {
    int deleteByPrimaryKey(String id);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKeyWithBLOBs(Comment record);

    int updateByPrimaryKey(Comment record);

    //查询评论总数
    int selectTotal();

    //查询文章的评论
    List<Comment> selectCommentsByBlogId(String blogId);
}