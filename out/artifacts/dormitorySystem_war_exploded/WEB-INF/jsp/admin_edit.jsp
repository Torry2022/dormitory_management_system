<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>修改信息</title>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/pg_btn.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>

<body>
    <div class="x-body">
        <%--把表单封装成一个Admin对象传给服务端--%>
        <form class="layui-form" id="f_auto" action="/updateAdmin" method="post">
            <input type="hidden" value="${sessionScope.a.a_id}" name="a_id" id="a_id" class="layui-input"/>
            <div class="layui-form-item">
                <label for="a_username" class="layui-form-label">
                    <span><i class="necessary">* </i>用户名</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" lay-verify="required" lay-reqtext="用户名不能为空" id="a_username"
                           name="a_username" autocomplete="off" value="${sessionScope.a.a_username}" class="layui-input"
                           placeholder="请输入用户名">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="a_password" class="layui-form-label">
                    <span><i class="necessary">* </i>密码</span>
                </label>
                <div class="layui-input-inline">
                    <input type="password" lay-verify="required" lay-reqtext="密码不能为空" id="a_password"
                           name="a_password" autocomplete="off" value="${sessionScope.a.a_password}" class="layui-input"
                           placeholder="请输入密码">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="a_name" class="layui-form-label">
                    <span><i class="necessary">* </i>姓名</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" lay-verify="required" lay-reqtext="姓名不能为空" id="a_name" name="a_name"
                           autocomplete="off" value="${sessionScope.a.a_name}" class="layui-input"
                           placeholder="请输入姓名">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="a_phone" class="layui-form-label">
                    <span><i class="necessary">* </i>电话</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" lay-verify="required|phone" lay-reqtext="电话不能为空" id="a_phone"
                           name="a_phone" autocomplete="off" value="${sessionScope.a.a_phone}" class="layui-input"
                           placeholder="请输入电话">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="a_power" class="layui-form-label">
                    <span><i class="necessary">* </i>级别</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="a_power" lay-verify="required|number" lay-reqtext="级别不能为空"
                           name="a_power" autocomplete="off" value="${sessionScope.a.a_power}" class="layui-input"
                           placeholder="请输入级别">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="a_describe" class="layui-form-label">
                    <span>级别描述</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="a_describe" name="a_describe" autocomplete="off"
                           value="${sessionScope.a.a_describe}" class="layui-input" placeholder="请输入级别描述">
                </div>
            </div>


            <div class="layui-form-item" id="btn_xg">
                <button class="layui-btn" id="btn_on" lay-submit="" lay-filter="updateAdmin">
                    修改
                </button>
            </div>
        </form>
    </div>

    <script>
    </script>
</body>
</html>
