<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8"/>

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
            <form class="layui-form layui-col-md12 x-so" action="/findClassStudent">
                <input class="layui-input" placeholder="请输入班级编号" name="c_classid" id="c_classid">
                <input class="layui-input" placeholder="请输入班级名" name="c_classname" id="c_classname">

                <button class="layui-btn" lay-submit lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                <a class="layui-btn layui-btn-small" style="float:right" href="/findClassStudent" title="刷新">
                    <i class="layui-icon">&#x21bb;</i></a>
            </form>
        </div>

        <%--表格数据--%>
        <table class="layui-table" id="tb">
            <thead>
            <tr>
                <th>班级编号</th>
                <th>班级名</th>
                <th>辅导员</th>
                <th>学生学号</th>
                <th>学生姓名</th>
                <th>电话</th>
                <th>宿舍楼</th>
                <th>宿舍编号</th>
            </thead>
            <tbody>
            <!--将返回的Model数据的students集合分步提取出来，循环遍历-->
            <!--前一段为Class数据，后面多段为Student数据-->
            <!--返回数据不受刷新影响，原本就包含在页面中-->
            <c:forEach items="${cs}" var="c">
                <c:set value="${c.students}" var="cc"/>
                <c:forEach items="${cc}" var="sc">
                    <tr>
                        <td>${c.c_classid}</td>
                        <td>${c.c_classname}</td>
                        <td>${c.c_counsellor}</td>
                        <td>${sc.s_studentid}</td>
                        <td>${sc.s_name}</td>
                        <td>${sc.s_phone}</td>
                        <td>${sc.s_dormbuilding}</td>
                        <td>${sc.s_dormitoryid}</td>
                    </tr>
                </c:forEach>
            </c:forEach>
            </tbody>
        </table>

    </div>

    <script>
    </script>
</body>
</html>
