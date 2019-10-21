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
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/user", name = "UserServlet")
public class UserServlet extends HttpServlet {
    private UserService userService=new UserService();
    private PageBean<User> userPageBean=new PageBean<>();
    private UserDao userDao=new UserDao();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("utf-8");
            String action=request.getParameter("action");
            Class<?> clazz=this.getClass();
            Method method=clazz.getMethod(action,HttpServletRequest.class,HttpServletResponse.class);
            method.invoke(this,request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    protected void pageQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageNumberStr=request.getParameter("pageNumber");
        int pageNumber=Integer.parseInt(pageNumberStr);
        int pageSize=5;
        PageBean<User> userPageBean = userService.pageQuery(pageNumber, pageSize);
        request.setAttribute("pageBean",userPageBean);
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }
    protected void queryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService=new UserService();
        List<User> list=userService.queryAll();
        request.setAttribute("userList",list);
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
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

    protected void editPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        User user=userService.findById(id);
        request.setAttribute("user",user);
        request.getRequestDispatcher("/update.jsp").forward(request,response);
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("utf-8");
            Map<String,String[]> map=request.getParameterMap();
            User user=new User();
            BeanUtils.populate(user,map);
            boolean success=userService.edit(user);
            if (success){
                this.getServletContext().setAttribute("success","true");
                response.sendRedirect(request.getContextPath()+"/pageQuery?pageNumber="+userPageBean.getPageNumber()+1);
            }else {
                this.getServletContext().setAttribute("success","false");
                response.sendRedirect(request.getContextPath()+"/editPage?id="+user.getId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        boolean success=userService.delete(id);
        if (success){
            this.getServletContext().setAttribute("success","true");
            response.sendRedirect(request.getContextPath()+"/pageQuery?pageNumber="+userPageBean.getPageNumber()+1);
        }else {
            this.getServletContext().setAttribute("success","false");
            response.sendRedirect(request.getContextPath()+"/pageQuery?pageNumber="+userPageBean.getPageNumber()+1);
        }
    }

}
