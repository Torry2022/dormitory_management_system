<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>

    <link rel="icon" href="/images/favicon.ico" sizes="32x32"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>

    <style type="text/css">
        .layui-table {
            text-align: center;
        }

        .layui-table th {
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="x-body">
        <div class="layui-row">
            <form class="layui-form layui-col-md12 x-so" action="/findDormitoryStudent">
                <input class="layui-input" placeholder="请输入宿舍楼" name="d_dormbuilding" id="d_dormbuilding">
                <input class="layui-input" placeholder="请输入宿舍编号" name="d_dormitoryid" id="d_dormitoryid">

                <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                <a class="layui-btn layui-btn-small" style="float:right" href="/findDormitoryStudent" title="刷新">
                    <i class="layui-icon">&#x21bb;</i></a>
            </form>
        </div>

        <%--表格数据--%>
        <table class="layui-table">
            <thead>
            <tr>
                <th>宿舍楼</th>
                <th>宿舍编号</th>
                <th>已用床位</th>
                <th>学生姓名</th>
                <th>电话</th>
                <th>班级编号</th>
                <th>班级名</th>
            </thead>
            <tbody>
            <c:forEach items="${ds}" var="d">
                <c:set value="${d.students}" var="dd"/>
                <c:forEach items="${dd}" var="sd">
                    <tr>
                        <td>${d.d_dormbuilding}</td>
                        <td>${d.d_dormitoryid}</td>
                        <td>${d.d_bed}</td>
                        <td>${sd.s_name}</td>
                        <td>${sd.s_phone}</td>
                        <td>${sd.s_classid}</td>
                        <td>${sd.s_classname}</td>
                    </tr>
                </c:forEach>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
