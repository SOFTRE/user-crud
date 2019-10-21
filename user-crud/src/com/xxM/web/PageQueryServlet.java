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

@WebServlet(urlPatterns = "/pageQuery", name = "PageQueryServlet")
/**
 * @Author Mr Liu
 */
public class PageQueryServlet extends HttpServlet {
    private UserService userService=new UserService();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageNumberStr=request.getParameter("pageNumber");
        int pageNumber=Integer.parseInt(pageNumberStr);
        int pageSize=5;
        PageBean<User> userPageBean = userService.pageQuery(pageNumber, pageSize);
        request.setAttribute("pageBean",userPageBean);
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
