<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/12 0012
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>搜寻</title>
    <style>
      .d1{
        margin-left: 550px;
        float: left;
        text-align: center;
      }
      #btn1{
        width: 100px;
        height: 50px;
        text-align: center;
      }
      #btn2{
        width: 100px;
        height: 50px;
        text-align: center;
      }
      body{
        background-image: url("img/2.jpg");
      }
    </style>
  </head>
  <body>
  <div class="d1">
    <input type="button" id="btn1" value="注册校验">&nbsp;&nbsp;&nbsp;
    <input type="button" id="btn2" value="搜寻功能">
    <script src="js/jquery-3.3.1.min.js"></script>
  </div>

  <script>
    $("#btn1").click(function () {
        location.href="register.html";
    });
    $("#btn2").click(function () {
        location.href="search.html";
    });
  </script>
  </body>
</html>
