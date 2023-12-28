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
            <form class="layui-form layui-col-md12 x-so" action="/findDormRepair">
                <input class="layui-input" placeholder="请输入宿舍编号" name="d_dormitoryid" id="d_dormitoryid">
                <input class="layui-input" placeholder="请输入宿舍楼" name="d_dormbuilding" id="d_dormbuilding">

                <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                <a class="layui-btn layui-btn-small" style="float:right" href="/findDormRepair" title="刷新">
                    <i class="layui-icon">&#x21bb;</i></a>
            </form>
        </div>
        <xblock>
            <button id="addDormRepairBtn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe654;</i>添加
            </button>
            <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出
            </button>
            <span class="x-right" style="line-height:40px">共有数据：${di.totalCount} 条</span>
        </xblock>

        <%--添加模态框--%>
        <div class="layui-row" id="addDormRepair" style="display: none;">
            <div class="layui-col-md10">
                <form class="layui-form" id="addDormRepairForm">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>宿舍编号：</label>
                        <div class="layui-input-block">
                            <input type="text" name="d_dormitoryid" class="layui-input" lay-verify="required|number"
                                   lay-reqtext="宿舍编号不能为空" autocomplete="off" placeholder="请输入宿舍编号">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>宿舍楼：</label>
                        <div class="layui-input-block">
                            <input type="text" name="d_dormbuilding" class="layui-input" lay-verify="required"
                                   lay-reqtext="宿舍楼不能为空" autocomplete="off" placeholder="请输入宿舍楼">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">维修人员：</label>
                        <div class="layui-input-block">
                            <input type="text" name="r_name" class="layui-input" autocomplete="off"
                                   placeholder="请输入维修人员">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>报修事由：</label>
                        <div class="layui-input-block">
                            <textarea name="reason" class="layui-input" autocomplete="off"
                                   lay-verify="required" lay-reqtext="报修事由不能为空" placeholder="请输入报修事由"></textarea>
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
                <th>宿舍编号</th>
                <th>宿舍楼</th>
                <th>维修人员</th>
                <th>报修事由</th>
                <th>报修时间</th>
                <th>更新时间</th>
                <th>操作</th>
            </thead>
            <tbody>
            <c:forEach items="${di.list}" var="di">
                <tr>
                    <td>${di.r_id}</td>
                    <td>${di.d_dormitoryid}</td>
                    <td>${di.d_dormbuilding}</td>
                    <td>${di.r_name}</td>
                    <td>${di.reason}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${di.create_time}"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${di.update_time}"/></td>
                    <td>
                        <a title="编辑" id="updateEdit" href="/findDormRepairById?r_id=${di.r_id}">
                            <i class="layui-icon">&#xe642;</i>
                        </a>
                        <a title="删除" onclick="member_del(this,'${di.r_id}')" href="javascript:;">
                            <i class="layui-icon">&#xe640;</i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div>
            <c:import url="page_btn.jsp">
                <c:param name="totalCount" value="${di.totalCount}"/>
                <c:param name="currentPageNo" value="${di.pageIndex}"/>
                <c:param name="totalPageCount" value="${di.pageTotalCount}"/>
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
                        url: '/exportDormRepairList',
                        type: 'post',
                        dataType: 'json',
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log(data);

                            // 1. 如果需要调整顺序，请自行梳理函数
                            var dt = excel.filterExportData(data, [
                                'r_id',
                                'd_dormitoryid',
                                'd_dormbuilding',
                                'r_name',
                                'reason',
                                'create_time',
                                'update_time'
                            ]);

                            // 2. 数组头部新增表头
                            dt.unshift({
                                r_id: 'ID',
                                d_dormitoryid: '宿舍编号',
                                d_dormbuilding: '宿舍楼',
                                r_name: '维修人员',
                                reason: '报修事由',
                                create_time: '报修时间',
                                update_time: '更新时间'
                            });

                            // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                            var colConf = excel.makeColConfig({
                                'F': 160,
                                'G': 160
                            }, 60);

                            var timeStart = Date.now();

                            // 3. 执行导出函数，系统会弹出弹框
                            excel.exportExcel({
                                sheet1: dt
                            }, '维修登记数据.xlsx', 'xlsx', {
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
                                window.location.href = '/findDormRepair';
                            }, 2000);
                        }
                    });
                });

                /*添加弹出框*/
                $("#addDormRepairBtn").click(function () {
                    layer.open({
                        type: 1,
                        title: "添加维修登记",
                        area: ["55%"],
                        shadeClose: true,
                        shade: 0.4,
                        anim: 2,
                        content: $("#addDormRepair").html()
                    });
                    $("#addDormRepairForm")[0].reset();
                    form.on('submit(addForm)', function (data) {
                        var param = data.field;
                        $.ajax({
                            url: '/addDormRepair',
                            type: "post",
                            data: JSON.stringify(param),
                            contentType: "application/json; charset=utf-8",
                            success: function () {
                                layer.msg('添加成功', {icon: 1, time: 2000});
                                setTimeout(function () {
                                    window.location.href = '/findDormRepair';
                                }, 2000);
                            },
                            error: function () {
                                layer.msg('添加失败', {icon: 0, time: 2000});
                                setTimeout(function () {
                                    window.location.href = '/findDormRepair';
                                }, 2000);
                            }
                        });
                    });
                });
            });

            /*删除*/
            function member_del(obj, r_id) {
                layer.confirm('确认要删除吗？', function () {
                    $.ajax({
                        url: '/deleteDormRepair',
                        type: "get",
                        data: {"r_id": r_id},
                        contentType: "application/json; charset=utf-8",
                        success: function () {
                            layer.msg('删除成功', {icon: 1, time: 1000});
                            setTimeout(function () {
                                window.location.href = '/findDormRepair';
                            }, 2000);
                        },
                        error: function () {
                            layer.msg('删除失败', {icon: 0, time: 1000});
                            setTimeout(function () {
                                window.location.href = '/findDormRepair';
                            }, 2000);
                        }
                    })
                });
            }

            /*批量删除*/
            function delAll(obj, s_id) {
                var data = tableCheck.getData();
                layer.confirm('确认要删除吗？' + data, function (s_id) {
                    //捉到所有被选中的，发异步进行删除
                    layer.msg('删除成功', {icon: 1});
                    $(".layui-form-checked").not('.header').parents('tr').remove();
                });
            }
        </script>
</body>
</html>
