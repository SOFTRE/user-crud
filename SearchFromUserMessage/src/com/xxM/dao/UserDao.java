package com.xxM.dao;

import com.xxM.domain.User;
import com.xxM.util.JdbcUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class UserDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JdbcUtils.getDataSource());

    public User findByName(String name) {
        String sql = " SELECT * FROM user WHERE name = ? ";
        List<User> list=jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(User.class),name);
        if (list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    public List<User> query(String name) {
        String sql=" SELECT * FROM user WHERE name LIKE ? ";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(User.class),"%"+name+"%");
    }
}
