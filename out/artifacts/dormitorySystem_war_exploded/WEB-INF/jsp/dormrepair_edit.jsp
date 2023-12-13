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
        <form class="layui-form" id="f_auto" action="/updateDormRepair" method="post">
            <input type="hidden" value="${sessionScope.d.r_id}" name="r_id" id="r_id"/>
            <div class="layui-form-item">
                <label for="d_dormitoryid" class="layui-form-label">
                    <span><i class="necessary">* </i>宿舍编号</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="d_dormitoryid" name="d_dormitoryid" lay-verify="required|number"
                           lay-reqtext="宿舍编号不能为空" autocomplete="off" value="${sessionScope.d.d_dormitoryid}"
                           class="layui-input" placeholder="请输入宿舍编号">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="d_dormbuilding" class="layui-form-label">
                    <span><i class="necessary">* </i>宿舍楼</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="d_dormbuilding" name="d_dormbuilding" autocomplete="off"
                           lay-verify="required" lay-reqtext="宿舍楼不能为空" value="${sessionScope.d.d_dormbuilding}"
                           class="layui-input" placeholder="请输入宿舍楼">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="r_name" class="layui-form-label">
                    <span>维修人员</span>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="r_name" name="r_name" autocomplete="off" value="${sessionScope.d.r_name}"
                           class="layui-input" placeholder="请输入维修人员">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="reason" class="layui-form-label">
                    <span><i class="necessary">* </i>报修事由</span>
                </label>
                <div class="layui-input-inline">
                    <textarea id="reason" name="reason" class="layui-input" lay-verify="required"
                              lay-reqtext="报修事由不能为空"
                              placeholder="请输入报修事由">${sessionScope.d.reason}</textarea>
                </div>
            </div>

            <input type="hidden" value="${sessionScope.d.update_time}" name="update_time" id="update_time"/>

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

