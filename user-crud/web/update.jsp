<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <base href="<%=basePath%>"/>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改用户</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: lightskyblue;
        }
        input[type="text"]{
            color: darkviolet;
        }
    </style>
</head>
<body>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">修改联系人</h3>
    <form action="${pageContext.request.contextPath}/edit?id=${user.id}" method="post" onsubmit="return x()">
        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" name="NAME" value="${user.NAME}" placeholder="请输入姓名"/>
        </div>

        <div class="form-group">
            <label>性别：</label>
            <input type="radio" name="sex" value="男" ${user.sex=="男"?"checked":""} />男
            <input type="radio" name="sex" value="女" ${user.sex=="女"?"checked":""} />女
        </div>

        <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text" class="form-control" id="age" name="age" value="${user.age}" placeholder="请输入年龄"/>
        </div>

        <div class="form-group">
            <label for="address">籍贯：</label>
            <select name="address" class="form-control">
                <option value="广东"${user.address=="广东"?"selected":""}>广东</option>
                <option value="广西"${user.address=="广西"?"selected":""}>广西</option>
                <option value="湖南"${user.address=="湖南"?"selected":""}>湖南</option>
                <option value="甘肃"${user.address=="甘肃"?"selected":""}>甘肃</option>
                <option value="陕西"${user.address=="陕西"?"selected":""}>陕西</option>
                <option value="辽宁"${user.address=="辽宁"?"selected":""}>辽宁</option>
                <option value="新疆"${user.address=="新疆"?"selected":""}>新疆</option>
                <option value="四川"${user.address=="四川"?"selected":""}>四川</option>
                <option value="河南"${user.address=="河南"?"selected":""}>河南</option>
                <option value="河北"${user.address=="河北"?"selected":""}>河北</option>
                <option value="内蒙古"${user.address=="内蒙古"?"selected":""}>内蒙古</option>
                <option value="云南"${user.address=="云南"?"selected":""}>云南</option>
                <option value="福建"${user.address=="福建"?"selected":""}>福建</option>
                <option value="山西"${user.address=="山西"?"selected":""}>山西</option>
                <option value="西藏"${user.address=="西藏"?"selected":""}>西藏</option>
            </select>
        </div>

        <div class="form-group">
            <label for="qq">QQ：</label>
            <input type="text" class="form-control" name="qq" value="${user.qq}" placeholder="请输入QQ号码"/>
        </div>

        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" class="form-control" name="email" value="${user.email}" placeholder="请输入邮箱地址"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" onclick="clk()"/>
            <input class="btn btn-default" type="reset" value="重置"/>
            <input class="btn btn-default" type="button" value="返回" onclick="back1()"/>
        </div>
    </form>
</div>
<script type="text/javascript">
    function back1() {
        history.back();
    }
    var x=function osb() {
        var text=document.getElementById("name").value;
        if (text===""){
            alert("姓名不能为空");
            return false;
        }
        var text1=document.getElementById("age").value;
        if (text1===""){
            alert("年龄不能为空");
            return false;
        }
        var text2=document.getElementById("qq").value;
        if (text2===""){
            alert("qq不能为空");
            return false;
        }else if (text2.length>10&&text2.length<15){
            alert("qq号应该在10-15位之间！");
            return false;
        }
        var text3=document.getElementById("email").value;
        var reg = /^([a-z0-9_\.-]{5,14})@([\da-z\.-]{2,5})\.([a-z\.]{2,6})$/;
        if (text3===""){
            alert("邮箱不能为空");
            return false;
        }else if (!reg.test(text3)){
            alert("邮箱格式不正确！");
            return false;
        }
        if (<%=pageContext.getServletContext().getAttribute("success")%>){
            alert("修改成功！");
        }else {
            alert("修改成功！")
        }
        return true;
    };
</script>
</body>
</html>