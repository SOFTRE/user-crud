package com.xxM.dao;

import com.xxM.domain.User;
import com.xxM.util.JdbcUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class UserDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JdbcUtils.getDataSource());

    public List<User> queryAll() {
        String sql = "select * from tab_user";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
    }

    public int add(User user) {
        String sql = "INSERT INTO tab_user(id,NAME,sex,age,address,qq,email)VALUES(?,?,?,?,?,?,?)";
        return jdbcTemplate.update(sql, user.getId(), user.getNAME(), user.getSex(), user.getAge(), user.getAddress(), user.getQq(), user.getEmail());
    }

    public User findById(String id) {
        String sql = "select * from tab_user where id=? ";
        List<User> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class), id);
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    public int edit(User user) {
        String sql = "update tab_user set NAME=?,sex=?,age=?,address=?,qq=?,email=? where id=?";
        return jdbcTemplate.update(sql, user.getNAME(), user.getSex(), user.getAge(), user.getAddress(), user.getQq(), user.getEmail(), user.getId());
    }

    public List<User> pageQuery(int index, int pageSize) {
        String sql = "select * from tab_user limit ?,?";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(User.class),index,pageSize);
    }

    public int totalCount() {
        String sql="select count(*) from tab_user";
        return jdbcTemplate.queryForObject(sql,Integer.class);
    }

    public int delete(String id) {
        String sql="delete from tab_user where id=?";
        return jdbcTemplate.update(sql,id);
    }
}
