package com.xxM.web;

import com.xxM.domain.PageBean;
import com.xxM.domain.User;
import com.xxM.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/delete", name = "UserDeleteServlet")
/**
 * @Author Mr Liu
 */
public class UserDeleteServlet extends HttpServlet {
    private UserService userService=new UserService();
    private PageBean<User> userPageBean=new PageBean<>();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
