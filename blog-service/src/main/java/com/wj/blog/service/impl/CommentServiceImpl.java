package com.wj.blog.service.impl;

import com.wj.blog.common.domain.Comment;
import com.wj.blog.common.domain.Visitor;
import com.wj.blog.common.utils.IdGenerator;
import com.wj.blog.dao.CommentMapper;
import com.wj.blog.dao.VisitorMapper;
import com.wj.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional(rollbackFor = Exception.class,readOnly = false,propagation = Propagation.REQUIRED)
public class CommentServiceImpl implements CommentService {

    @Autowired
    private  CommentMapper commentMapper;

    @Autowired
    private VisitorMapper visitorMapper;

    @Override
    @Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
    public List<Comment> findCommentByBlogId(String blogId) throws Exception {
        List<Comment> comments =commentMapper.selectCommentsByBlogId(blogId);
//        for (Comment comment:
//             comments) {
//            String fatherId = comment.getFatherId();
//            if(fatherId==null){
//                break;
//            }
//            for (Comment comment1:
//                comments ) {
//                if(comment1.getId() == fatherId){
//                    comment1.getSons().add(comment);
//                    break;
//                }
//            }
//        }
        return comments;
    }

    @Override
    public void commentByVisitor(Comment comment, Visitor visitor) {
        try {
            String vId= IdGenerator.getID();
            visitor.setvId(vId);
            comment.setvId(vId);
            comment.setId(IdGenerator.getID());
            commentMapper.insert(comment);
            visitorMapper.insert(visitor);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
