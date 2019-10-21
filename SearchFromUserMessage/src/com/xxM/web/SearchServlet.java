package com.xxM.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.xxM.domain.User;
import com.xxM.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/search", name = "SearchServlet")
public class SearchServlet extends HttpServlet {
    private UserService userService=new UserService();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        List<User>userList=userService.query(name);
        ObjectMapper mapper=new ObjectMapper();
        String json=mapper.writeValueAsString(userList);
        response.getWriter().print(json);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}