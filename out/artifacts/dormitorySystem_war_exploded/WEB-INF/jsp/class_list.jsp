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
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>

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
            <form class="layui-form layui-col-md12 x-so" action="/findClass">
                <input class="layui-input" placeholder="请输入班级编号" name="c_classid" id="c_classid">
                <input class="layui-input" placeholder="请输入班级名" name="c_classname" id="c_classname">
                <input class="layui-input" placeholder="请输入辅导员姓名" name="c_counsellor" id="c_counsellor">

                <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                <a class="layui-btn layui-btn-small" style="float:right" href="/findClass" title="刷新">
                    <i class="layui-icon">&#x21bb;</i></a>
            </form>
        </div>
        <xblock>
            <button id="addClassBtn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe654;</i>添加
            </button>
            <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出
            </button>
            <span class="x-right" style="line-height:40px">共有数据：${ci.totalCount} 条</span>
        </xblock>

        <%--添加模态框--%>
        <div class="layui-row" id="addClass" style="display: none;">
            <div class="layui-col-md10">
                <form class="layui-form" id="addClassForm">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>班级编号：</label>
                        <div class="layui-input-block">
                            <input type="text" name="c_classid" class="layui-input" lay-verify="required|number"
                                   autocomplete="off" lay-reqtext="班级编号不能为空" placeholder="请输入班级编号">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">班级名：</label>
                        <div class="layui-input-block">
                            <input type="text" name="c_classname" class="layui-input"
                                   autocomplete="off" placeholder="请输入班级名">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">辅导员：</label>
                        <div class="layui-input-block">
                            <input type="text" name="c_counsellor" class="layui-input" autocomplete="off"
                                   placeholder="请输入辅导员姓名">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="addForm">
                                提交
                            </button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <%--表格数据--%>
        <table class="layui-table">
            <thead>
            <th>ID</th>
            <th>班级编号</th>
            <th>班级名</th>
            <th>辅导员</th>
            <th>操作</th>
            </thead>
            <tbody>
            <c:forEach items="${ci.list}" var="ci">
                <tr>
                    <td>${ci.c_id}</td>
                    <td>${ci.c_classid}</td>
                    <td>${ci.c_classname}</td>
                    <td>${ci.c_counsellor}</td>
                    <td>
                        <a title="编辑" id="updateEdit" href="/findClassById?c_id=${ci.c_id}">
                            <i class="layui-icon">&#xe642;</i>
                        </a>
                        <a title="删除" onclick="member_del(this,'${ci.c_id}')" href="javascript:;">
                            <i class="layui-icon">&#xe640;</i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div>
            <input type="hidden" id="totalPageCount" value="${ci.pageTotalCount}"/>
            <c:import url="page_btn.jsp">
                <c:param name="totalCount" value="${ci.totalCount}"/>
                <c:param name="currentPageNo" value="${ci.pageIndex}"/>
                <c:param name="totalPageCount" value="${ci.pageTotalCount}"/>
            </c:import>
        </div>
        <script>
            layui.config({
                base: 'layui_exts/',
            }).extend({
                excel: 'excel',
            });

            layui.use(['jquery', 'excel', 'form', 'layer', 'laydate'], function () {
                var form = layui.form,
                    $ = layui.jquery,
                    laydate = layui.laydate;
                var excel = parent.layui.excel;

                //执行一个laydate实例
                laydate.render({
                    elem: '#start' //指定元素
                });

                form.on('submit(toolbarDemo)', function () {
                    $.ajax({
                        url: '/exportClassList',
                        type: 'post',
                        dataType: 'json',
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log(data);

                            // 1. 如果需要调整顺序，请自行梳理函数
                            var dt = excel.filterExportData(data, [
                                'c_id',
                                'c_classid',
                                'c_classname',
                                'c_counsellor'
                            ]);

                            // 2. 数组头部新增表头
                            dt.unshift({
                                c_id: 'ID',
                                c_classid: '班级编号',
                                c_classname: '班级名',
                                c_counsellor: '辅导员'
                            });

                            // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                            var colConf = excel.makeColConfig({
                                'C': 90,
                                'D': 80
                            }, 60);

                            var timeStart = Date.now();
                            
                            // 3. 执行导出函数，系统会弹出弹框
                            excel.exportExcel({
                                sheet1: dt
                            }, '班级数据.xlsx', 'xlsx', {
                                extend: {
                                    '!cols': colConf
                                }
                            });
                            var timeEnd = Date.now();

                            var spent = (timeEnd - timeStart) / 1000;
                            layer.alert('导出耗时 ' + spent + ' s');
                        },

                        error: function () {
                            setTimeout(function () {
                                window.location.href = '/findClass';
                            }, 2000);
                        }
                    });
                });

                /*添加弹出框*/
                $("#addClassBtn").click(function () {
                    layer.open({
                        type: 1,
                        title: "添加班级",
                        shadeClose: true,
                        shade: 0.4,
                        area: ["30%"],
                        anim: 2,
                        content: $("#addClass").html()
                    });
                    $("#addClassForm")[0].reset();
                    form.on('submit(addForm)', function (data) {
                        var param = data.field;
                        $.ajax({
                            url: '/addClass',
                            type: "post",
                            data: JSON.stringify(param),
                            contentType: "application/json; charset=utf-8",
                            success: function () {
                                layer.msg('添加成功', {icon: 1, time: 2000});
                                setTimeout(function () {
                                    window.location.href = '/findClass';
                                }, 2000);
                            },
                            error: function () {
                                layer.msg('添加失败', {icon: 0, time: 2000});
                                setTimeout(function () {
                                    window.location.href = '/findClass';
                                }, 2000);
                            }
                        });
                    });
                });
            });

            /*删除*/
            function member_del(obj, c_id) {
                layer.confirm('确认要删除吗？', function () {
                    $.ajax({
                        url: '/deleteClass',
                        type: "get",
                        data: {"c_id": c_id},
                        contentType: "application/json; charset=utf-8",
                        success: function () {
                            layer.msg('删除成功', {icon: 1, time: 1000});
                            setTimeout(function () {
                                window.location.href = '/findClass';
                            }, 2000);
                        },
                        error: function () {
                            layer.msg('删除失败', {icon: 0, time: 1000});
                            setTimeout(function () {
                                window.location.href = '/findClass';
                            }, 2000);
                        }
                    })
                });
            }
        </script>
</body>
</html>
