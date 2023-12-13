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
        <form class="layui-form" id="f_auto" action="/updateStudentClean" method="post">

            <input type="hidden" value="${sessionScope.d.g_id}" name="g_id" id="g_id"/>
            <div class="layui-form-item">
                <label for="s_studentid" class="layui-form-label">
                    <span class=""><i class="necessary">* </i>学号</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="s_studentid" name="s_studentid" lay-verify="required|number"
                           lay-reqtext="学号不能为空" autocomplete="off" value="${sessionScope.d.s_studentid}"
                           class="layui-input" placeholder="请输入学号">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="s_name" class="layui-form-label">
                    <span><i class="necessary">* </i>姓名</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="s_name" name="s_name" autocomplete="off" value="${sessionScope.d.s_name}"
                           lay-verify="required" lay-reqtext="姓名不能为空" class="layui-input"
                           placeholder="请输入姓名">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="s_grade" class="layui-form-label">
                    <span><i class="necessary">* </i>卫生评分</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="s_grade" name="s_grade" lay-verify="required|number"
                           lay-reqtext="卫生评分不能为空" autocomplete="off" value="${sessionScope.d.s_grade}"
                           class="layui-input" placeholder="请输入卫生评分">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="s_classid" class="layui-form-label">
                    <span><i class="necessary">* </i>班级编号</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="s_classid" name="s_classid" lay-verify="required|number"
                           lay-reqtext="班级编号不能为空" autocomplete="off" value="${sessionScope.d.s_classid}"
                           class="layui-input" placeholder="请输入班级编号">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="s_dormitoryid" class="layui-form-label">
                    <span><i class="necessary">* </i>宿舍编号</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="s_dormitoryid" name="s_dormitoryid" lay-verify="required|number"
                           lay-reqtext="宿舍编号不能为空" autocomplete="off" value="${sessionScope.d.s_dormitoryid}"
                           class="layui-input" placeholder="请输入宿舍编号">
                </div>
            </div>

            <input type="hidden" value="${sessionScope.d.update_time}" name="update_time" id="update_time"/>

            <div class="layui-form-item" id="btn_xg">
                <button class="layui-btn" id="btn_on" lay-submit="" lay-filter="updateClass">
                    修改
                </button>
            </div>
        </form>
    </div>

    <script>
    </script>
</body>
</html>


