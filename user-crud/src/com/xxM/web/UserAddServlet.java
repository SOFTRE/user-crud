package com.xxM.web;

import com.xxM.dao.UserDao;
import com.xxM.domain.PageBean;
import com.xxM.domain.User;
import com.xxM.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet(urlPatterns = "/add", name = "UserAddServlet")
public class UserAddServlet extends HttpServlet {
    private PageBean<User> userPageBean=new PageBean<>();
    private UserService userService=new UserService();
    private UserDao userDao=new UserDao();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("utf-8");
            Map<String,String[]> map=request.getParameterMap();
            User user=new User();
            BeanUtils.populate(user,map);
            Boolean success=userService.add(user);
            if (success){
                this.getServletContext().setAttribute("success","true");
                response.sendRedirect(request.getContextPath()+"/pageQuery?pageNumber="+((int)Math.ceil(userDao.totalCount()/5+1)));
            }else {
                this.getServletContext().setAttribute("success","false");
                response.sendRedirect(request.getContextPath()+"/add?id="+user.getId());
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
