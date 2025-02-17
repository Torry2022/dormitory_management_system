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
        <form class="layui-form" id="f_auto" action="/updateClass" method="post">
            <input type="hidden" value="${sessionScope.c.c_id}" name="c_id" id="c_id"/>
            <div class="layui-form-item">
                <label for="c_classid" class="layui-form-label">
                    <span><i class="necessary">* </i>班级编号</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="c_classid" name="c_classid" lay-verify="required|number"
                           lay-reqtext="班级编号不能为空" autocomplete="off" value="${sessionScope.c.c_classid}"
                           class="layui-input" placeholder="请输入班级编号">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="c_classname" class="layui-form-label">
                    <span>班级名</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="c_classname" name="c_classname" autocomplete="off"
                           value="${sessionScope.c.c_classname}" class="layui-input" placeholder="请输入班级名">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="c_counsellor" class="layui-form-label">
                    <span>辅导员姓名</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="c_counsellor" name="c_counsellor" autocomplete="off"
                           value="${sessionScope.c.c_counsellor}" class="layui-input" placeholder="请输入辅导员姓名">
                </div>
            </div>

            <div class="layui-form-item" id="btn_xg">
                <button class="layui-btn" id="btn_on" lay-submit>
                    修改
                </button>
            </div>
        </form>
    </div>

    <script>
    </script>
</body>
</html>
