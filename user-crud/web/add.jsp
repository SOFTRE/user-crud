<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- HTML5文档-->
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
    <title>添加用户</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style>
        body{
            background-color: lightcyan;
        }
        input[type="text"]{
            color: darkviolet;
        }
    </style>
</head>
<body>
<div class="container">
    <center><h3>添加联系人页面</h3></center>
    <form action="${pageContext.request.contextPath}/add" method="post" onsubmit=" return x()">
        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" name="NAME" placeholder="请输入姓名">
        </div>

        <div class="form-group">
            <label>性别：</label>
            <input type="radio" name="sex" value="男" checked="checked"/>男
            <input type="radio" name="sex" value="女"/>女
        </div>

        <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text" class="form-control" id="age" name="age" placeholder="请输入年龄">
        </div>

        <div class="form-group">
            <label for="address">籍贯：</label>
            <select name="address" class="form-control" id="jiguan">
                <option value="广东">广东</option>
                <option value="广西">广西</option>
                <option value="湖南">湖南</option>
                <option value="甘肃">甘肃</option>
                <option value="陕西">陕西</option>
                <option value="辽宁">辽宁</option>
                <option value="新疆">新疆</option>
                <option value="四川">四川</option>
                <option value="河南">河南</option>
                <option value="河北">河北</option>
                <option value="内蒙古">内蒙古</option>
                <option value="云南">云南</option>
                <option value="福建">福建</option>
                <option value="山西">山西</option>
                <option value="西藏">西藏</option>
            </select>
        </div>

        <div class="form-group">
            <label for="qq">QQ：</label>
            <input type="text" class="form-control" name="qq" id="qq" placeholder="请输入QQ号码"/>
        </div>

        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" class="form-control" name="email" id="email" placeholder="请输入邮箱地址"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" onclick="clk()"/>
            <input class="btn btn-default" type="reset" value="重置" />
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
                alert("添加成功！");
            }else {
                alert("添加成功！")
            }
        return true;
    };

</script>
</body>
</html>