package com.xxM.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class EncodingFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        //1.解决响应的中文乱码
        response.setContentType("text/html;charset=utf-8");
        //2.解决请求的中文乱码：post方式
        String method = request.getMethod();
        if ("POST".equalsIgnoreCase(method)) {
            request.setCharacterEncoding("utf-8");
        }
        //3.放行请求
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
