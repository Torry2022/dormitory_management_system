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
        <form class="layui-form" action="/updateStudent" method="post" id="f_auto" accept-charset="UTF-8">
            <input type="hidden" value="${sessionScope.stu.s_id}" name="s_id" id="s_id"/>
            <div class="layui-form-item">
                <label for="s_studentid" class="layui-form-label">
                    <span><i class="necessary">* </i>学号：</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="s_studentid" name="s_studentid" lay-verify="required|number"
                           lay-reqtext="学号不能为空" autocomplete="off" value="${sessionScope.stu.s_studentid}"
                           class="layui-input" placeholder="请输入学号">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="s_name" class="layui-form-label">
                    <span><i class="necessary">* </i>姓名：</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="s_name" name="s_name" lay-verify="required" lay-reqtext="姓名不能为空"
                           autocomplete="off" value="${sessionScope.stu.s_name}" class="layui-input"
                           placeholder="请输入姓名">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span>性别：</span>
                </label>
                <div class="layui-input-inline">
                    <input type="radio" name="s_sex" value="男" title="男" <c:if test="${sessionScope.stu.s_sex == '男'}">checked="checked"</c:if>>
                    <input type="radio" name="s_sex" value="女" title="女" <c:if test="${sessionScope.stu.s_sex == '女'}">checked="checked"</c:if>>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="s_phone" class="layui-form-label">
                    <span>电话：</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="s_phone" name="s_phone" lay-verify="phone" autocomplete="new-pwd"
                           value="${sessionScope.stu.s_phone}" class="layui-input" placeholder="请输入电话">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="s_classid" class="layui-form-label">
                    <span><i class="necessary">* </i>班级编号：</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="s_classid" name="s_classid" lay-verify="required|number"
                           lay-reqtext="班级编号不能为空" autocomplete="off" value="${sessionScope.stu.s_classid}"
                           class="layui-input" placeholder="请输入班级编号">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="s_classname" class="layui-form-label">
                    <span><i class="necessary">* </i>班级名：</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="s_classname" name="s_classname" lay-verify="required"
                           lay-reqtext="班级名不能为空" autocomplete="off" value="${sessionScope.stu.s_classname}"
                           class="layui-input" placeholder="请输入班级名">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="s_dormitoryid" class="layui-form-label">
                    <span><i class="necessary">* </i>宿舍楼：</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="s_dormbuilding" name="s_dormbuilding" lay-verify="required"
                           lay-reqtext="宿舍楼不能为空" autocomplete="off" value="${sessionScope.stu.s_dormbuilding}"
                           class="layui-input" placeholder="请输入宿舍楼">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="s_dormitoryid" class="layui-form-label">
                    <span><i class="necessary">* </i>宿舍编号：</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="s_dormitoryid" name="s_dormitoryid" lay-verify="required|number"
                           lay-reqtext="宿舍编号不能为空" autocomplete="off" value="${sessionScope.stu.s_dormitoryid}"
                           class="layui-input" placeholder="请输入宿舍编号">
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
