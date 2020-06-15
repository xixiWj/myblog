package com.wj.blog.service;

import com.wj.blog.common.domain.User;
import com.wj.blog.common.domain.UserException;

import java.util.List;

/**
 * 用户服务层接口
 */
public interface UserService {
    User checkName(String user_name);
    List<User> findAllUser();
    void  register(User user);
    User login(User user) throws Exception;

    User findByName(String username);

    void update(User user, boolean b, String userId);
}
