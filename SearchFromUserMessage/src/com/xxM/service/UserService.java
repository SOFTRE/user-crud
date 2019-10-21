package com.xxM.service;

import com.xxM.dao.UserDao;
import com.xxM.domain.User;

import java.util.List;

public class UserService {
    private UserDao userDao=new UserDao();
    public Boolean isExist(String name) {
        User user =userDao.findByName(name);
        return user!=null;
    }

    public List<User> query(String name) {
        return userDao.query(name);
    }
}
