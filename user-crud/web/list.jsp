<%@ page import="com.xxM.domain.PageBean" %>
<%@ page import="com.xxM.domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
        .nav-group{
            float: inside;
            text-align: center;
        }
        .cc{
            background-image: url("img/star.jpg");
        }
        body{
            background-color: lightgoldenrodyellow;
        }
    </style>
</head>

<body class="cc">
<div class="container">
    <h3 style="text-align: center">用户信息列表</h3>
    <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th>编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>籍贯</th>
            <th>QQ</th>
            <th>邮箱</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pageBean.userList}" var="user" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${user.NAME}</td>
                <td>${user.sex}</td>
                <td>${user.age}</td>
                <td>${user.address}</td>
                <td>${user.qq}</td>
                <td>${user.email}</td>
                <td><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/editPage?id=${user.id}" onclick="modifyFunction()">修改</a>&nbsp;<a class="btn btn-default btn-sm" href="javascript:void(0)" onclick="deleteFunction(${user.id})">删除</a></td>
            </tr>
        </c:forEach>

        <tr>

            <td colspan="8" align="center"><a class="btn btn-primary" href="add.jsp">添加联系人</a></td>
        </tr>
    </table>
    <nav class="nav-group">
        <ul class="pagination">
            <c:if test="${pageBean.pageNumber>1}">
                <li>
                <a href="${pageContext.request.contextPath}/pageQuery?pageNumber=${pageBean.pageNumber-1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            </c:if><c:if test="${pageBean.pageNumber==1}">
                <li class="disabled">
                <a href="javascript:void(0)" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            </c:if>
            <c:forEach var="i" begin="1" end="${pageBean.pageCount}" step="1">
                <li class="${pageBean.pageNumber==i?"active":""}"><a href="${pageContext.request.contextPath}/pageQuery?pageNumber=${i}" >${i}</a></li>
            </c:forEach>

            <c:if test="${pageBean.pageNumber<pageBean.pageCount}">
                <li>
                    <a href="${pageContext.request.contextPath}/pageQuery?pageNumber=${pageBean.pageNumber+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
            <c:if test="${pageBean.pageNumber==pageBean.pageCount}">
                <li class="disabled">
                    <a href="javascript:void(0)" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>

        </ul>
    </nav>
</div>
<script>
    function modifyFunction() {
        confirm("确定要修改吗?");
    }
    function deleteFunction(id) {
        var isDelete=confirm("确定要删除吗?");
        if(isDelete){
            location.href="${pageContext.request.contextPath}/delete?id="+id;
            if (<%=pageContext.getServletContext().getAttribute("success")%>){
                alert("删除成功！");
            }else {
                alert("删除成功！")
            }
        }else {
            alert("删除失败！")
        }
    }

</script>
</body>
</html>
