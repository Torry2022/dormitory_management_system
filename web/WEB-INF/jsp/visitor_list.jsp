<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
            <form class="layui-form layui-col-md12 x-so" action="/findVisitor">
                <input class="layui-input" placeholder="请输入姓名" name="v_name" id="v_name">
                <input class="layui-input" placeholder="请输入电话" name="v_phone" id="v_phone">

                <input class="layui-input" type="hidden" name="pageIndex" value="1">
                <input class="layui-input" type="hidden" name="pageSize" value="3">
                <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                <a class="layui-btn layui-btn-small" style="float:right" href="/findVisitor" title="刷新">
                    <i class="layui-icon">&#x21bb;</i></a>
            </form>
        </div>
        <xblock>
            <button id="addVisitorBtn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe654;</i>添加
            </button>
            <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出
            </button>
            <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
        </xblock>

        <%--添加模态框--%>
        <div class="layui-row" id="addVisitor" style="display: none;">
            <div class="layui-col-md10">
                <form class="layui-form" id="addVisitorForm">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>访客姓名：</label>
                        <div class="layui-input-block">
                            <input type="text" lay-verify="required" lay-reqtext="访客姓名不能为空" name="v_name"
                                   autocomplete="off" class="layui-input" placeholder="请输入姓名">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>访客电话：</label>
                        <div class="layui-input-block">
                            <input type="text" lay-verify="required|phone" lay-reqtext="访客电话不能为空" name="v_phone"
                                   autocomplete="new-pwd" class="layui-input" placeholder="请输入电话">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>访问宿舍编号：</label>
                        <div class="layui-input-block">
                            <input type="text" lay-verify="required|number" lay-reqtext="访问宿舍编号不能为空"
                                   autocomplete="off" name="v_dormitoryid" class="layui-input"
                                   placeholder="请输入宿舍编号">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>访问宿舍楼：</label>
                        <div class="layui-input-block">
                            <input type="text" lay-verify="required" lay-reqtext="访问宿舍楼不能为空" autocomplete="off"
                                   name="v_dormbuilding" class="layui-input" placeholder="请输入宿舍楼">
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
            <tr>
                <th>ID</th>
                <th>访客姓名</th>
                <th>访客电话</th>
                <th>访问宿舍编号</th>
                <th>访问宿舍楼</th>
                <th>访问时间</th>
            </thead>
            <tbody>
            <c:forEach items="${pi.list}" var="visitor">
                <tr>
                    <td>${visitor.v_id}</td>
                    <td>${visitor.v_name}</td>
                    <td>${visitor.v_phone}</td>
                    <td>${visitor.v_dormitoryid}</td>
                    <td>${visitor.v_dormbuilding}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${visitor.create_time}"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div>
            <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>
            <c:import url="page_btn.jsp">
                <c:param name="totalCount" value="${pi.totalCount}"/>
                <c:param name="currentPageNo" value="${pi.pageIndex}"/>
                <c:param name="totalPageCount" value="${pi.pageTotalCount}"/>
            </c:import>
        </div>
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
                    url: '/exportVisitorList',
                    type: 'post',
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        console.log(data);

                        // 1. 如果需要调整顺序，请自行梳理函数
                        var dt = excel.filterExportData(data, [
                            'v_id',
                            'v_name',
                            'v_phone',
                            'v_dormitoryid',
                            'v_dormbuilding',
                            'create_time'
                        ]);

                        // 2. 数组头部新增表头
                        dt.unshift({
                            v_id: 'ID',
                            v_name: '访客姓名',
                            v_phone: '访客电话',
                            v_dormitoryid: '访问宿舍编号',
                            v_dormbuilding: '访问宿舍楼',
                            create_time: '访问时间'
                        });

                        var colConf = excel.makeColConfig({
                            'B': 80,
                            'C': 90,
                            'D': 100,
                            'E': 100,
                            'F': 160
                        }, 60);

                        var timeStart = Date.now();
                        // 3. 执行导出函数，系统会弹出弹框
                        excel.exportExcel({
                            sheet1: dt
                        }, '访客数据.xlsx', 'xlsx', {
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
                            window.location.href = '/findVisitor';
                        }, 2000);
                    }
                });
            });

            /*添加弹出框*/
            $("#addVisitorBtn").click(function () {
                if (!${empty sessionScope.s.s_id}) {
                    layer.alert("对不起，您没有权限:(");
                } else {
                    layer.open({
                        type: 1,
                        title: "添加访客",
                        shadeClose: true,
                        shade: 0.4,
                        area: ["55%"],
                        anim: 2,
                        content: $("#addVisitor").html()
                    });
                    $("#addVisitorForm")[0].reset();
                    form.on('submit(addForm)', function (data) {
                        var param = data.field;
                        $.ajax({
                            url: '/addVisitor',
                            type: "post",
                            data: JSON.stringify(param),
                            contentType: "application/json; charset=utf-8",
                            success: function () {
                                layer.msg('添加成功', {icon: 1, time: 2000});
                                setTimeout(function () {
                                    window.location.href = '/findVisitor';
                                }, 2000);
                            },
                            error: function () {
                                layer.msg('添加失败', {icon: 0, time: 2000});
                                setTimeout(function () {
                                    window.location.href = '/findVisitor';
                                }, 2000);
                            }
                        });
                    });
                }
            });
        });
    </script>
</body>
</html>
