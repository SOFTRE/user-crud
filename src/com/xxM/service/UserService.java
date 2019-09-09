package com.xxM.service;

import com.xxM.dao.UserDao;
import com.xxM.domain.PageBean;
import com.xxM.domain.User;

import java.util.List;

public class UserService {
    private UserDao userDao = new UserDao();
    private PageBean<User> pageBean=new PageBean<>();
    public List<User> queryAll() {
        return userDao.queryAll();
    }

    public Boolean add(User user) {
        int count=userDao.add(user);
        return count>0;
    }

    public User findById(String id) {
        return userDao.findById(id);
    }

    public boolean edit(User user) {
        int count=userDao.edit(user);
        return count>0;
    }

    /**
     * 提供结果页面中需要的数据
     * 结果页面需要什么数据就提供什么数据
     * @param pageNumber 页码
     * @param pageSize 页面数据量
     */
    public PageBean<User> pageQuery(int pageNumber, int pageSize) {
        //index=分页的起始索引，单单查询一页的话从哪里起始都可以limit 1,3就可以，
        //如果是多页查询，必须以size大小区分开来，并且指定规律性索引，此index就是规律索引。
        int index=(pageNumber-1)*pageSize;
        List<User> list=userDao.pageQuery(index,pageSize);
        pageBean.setUserList(list);
        //然后需要总页数，需要总页数，得先获取总数量
        int totalCount=userDao.totalCount();
        int pageCount=(int)Math.ceil(totalCount*1.0/pageSize);
        pageBean.setPageCount(pageCount);
        //此时需要返回list,pagaCont,pageNumber三项数据
        //1.放在list里面取数据需要索引，不方便
        //2.放在map里面key是不统一的，例如用户的key和商品的key都不同，需要一一区别。都不好维护
        //3.把三项数据封装在一个javaBean 里面.这样无论是用户还是商品都可以从里面取数据.方便维护
        pageBean.setPageNumber(pageNumber);
        return pageBean;
    }

    public Boolean delete(String id) {
        int count=userDao.delete(id);
        return count>0;
    }
}
