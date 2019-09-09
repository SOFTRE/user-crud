<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html> 
<html lang="zh-CN">
  <head>
  	<base href="<%=basePath%>"/>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>首页</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    </script>
     <style>
         body{
             background-image: url("img/oldMan.jpg") ;
             width: 100%;
             height: 100%;
         }
         .hf{
             text-decoration:none;
             font-size:45px;
         }
     </style>
  </head>
  <body>
  <div align="center">
  	<a
	  href="${pageContext.request.contextPath}/pageQuery?pageNumber=1"  class="hf"><font face="楷体">查询所有用户信息<i class="glyphicon glyphicon-search"></i></font>
	</a>

  </div>
  </body>
</html>