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
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
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
            <form class="layui-form layui-col-md12 x-so" action="/findAdmin">
                <input type="hidden" class="layui-input" placeholder="请输入用户名" name="a_id" id="a_id">
                <input class="layui-input" placeholder="请输入用户名" name="a_username" id="a_username">
                <input class="layui-input" placeholder="请输入级别描述" name="a_describe" id="a_describe">

                <input class="layui-input" type="hidden" name="pageIndex" value="1">
                <input class="layui-input" type="hidden" name="pageSize" value="3">
                <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                <a class="layui-btn layui-btn-small" style="float:right" href="/findAdmin" title="刷新">
                    <i class="layui-icon">&#x21bb;</i></a>
            </form>
        </div>

        <xblock>
            <button id="addAdminBtn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe654;</i>添加
            </button>
            <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出
            </button>
            <span class="x-right" style="line-height:40px">共有数据：${ai.totalCount} 条</span>
        </xblock>

        <%--表格数据--%>
        <table class="layui-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>用户名</th>
                <th>姓名</th>
                <th>电话</th>
                <th>级别描述</th>
                <th>操作</th>
            </thead>
            <tbody>
            <c:forEach items="${ai.list}" var="ai">
                <tr>
                    <td class="myid">${ai.a_id}</td>
                    <td>${ai.a_username}</td>
                    <td>${ai.a_name}</td>
                    <td>${ai.a_phone}</td>
                    <td>${ai.a_describe}</td>
                    <td class="td-manage">
                        <a title="编辑" class="updateEdit" href="#">
                            <i class="layui-icon">&#xe642;</i>
                        </a>
                        <a title="删除" onclick="member_del(this,'${ai.a_id}')" href="javascript:;">
                            <i class="layui-icon">&#xe640;</i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%--添加模态框--%>
        <div class="layui-row" id="addAdmin" style="display: none;">
            <div class="layui-col-md10">
                <form class="layui-form" id="addAdminForm">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>用户名：</label>
                        <div class="layui-input-block">
                            <input type="text" lay-verify="required" lay-reqtext="用户名不能为空" name="a_username"
                                   class="layui-input" autocomplete="off" placeholder="请输入用户名">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>密码：</label>
                        <div class="layui-input-block">
                            <input type="password" lay-verify="required" lay-reqtext="密码不能为空" name="a_password"
                                   autocomplete="off" class="layui-input" placeholder="请输入密码">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>姓名：</label>
                        <div class="layui-input-block">
                            <input type="text" lay-verify="required" lay-reqtext="姓名不能为空" name="a_name"
                                   class="layui-input" autocomplete="off" placeholder="请输入姓名">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>电话：</label>
                        <div class="layui-input-block">
                            <input type="text" lay-verify="required|phone" lay-reqtext="电话不能为空" name="a_phone"
                                   class="layui-input" autocomplete="new-pwd" placeholder="请输入电话">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>级别：</label>
                        <div class="layui-input-block">
                            <input type="text" lay-verify="required|number" lay-reqtext="级别不能为空" name="a_power"
                                   autocomplete="off" class="layui-input" placeholder="请输入级别1-2">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">级别描述：</label>
                        <div class="layui-input-block">
                            <input type="text" name="a_describe" class="layui-input" autocomplete="off"
                                   placeholder="请输入级别描述">
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

        <div>
            <input type="hidden" id="totalPageCount" value="${ai.pageTotalCount}"/>
            <c:import url="page_btn.jsp">
                <c:param name="totalCount" value="${ai.totalCount}"/>
                <c:param name="currentPageNo" value="${ai.pageIndex}"/>
                <c:param name="totalPageCount" value="${ai.pageTotalCount}"/>
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
            form.render();

            form.on('submit(toolbarDemo)', function () {
                $.ajax({
                    url: '/exportAdminList',
                    type: 'post',
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        console.log(data);

                        // 1. 如果需要调整顺序，请自行梳理函数
                        var dt = excel.filterExportData(data, [
                            'a_id',
                            'a_username',
                            'a_name',
                            'a_phone',
                            'a_describe'
                        ]);

                        // 2. 数组头部新增表头
                        dt.unshift({
                            a_id: 'ID',
                            a_username: '用户名',
                            a_name: '姓名',
                            a_phone: '电话',
                            a_describe: '级别描述'
                        });

                        // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                        var colConf = excel.makeColConfig({
                            'A': 40,
                            'D': 90
                        }, 60);

                        var timeStart = Date.now();
                        // 3. 执行导出函数，系统会弹出弹框
                        excel.exportExcel({
                            sheet1: dt
                        }, '管理员数据.xlsx', 'xlsx', {
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
                            window.location.href = '/findAdmin';
                        }, 2000);
                    }
                });
            });

            /*添加弹出框*/
            $("#addAdminBtn").click(function () {
                var power = ${sessionScope.ad.a_power};
                if (power != 1) {
                    layer.alert("对不起，您没有权限:(");
                } else {
                    layer.open({
                        type: 1,
                        title: "添加管理员",
                        area: ["30%"],
                        shadeClose: true,
                        shade: 0.4,
                        anim: 2,
                        content: $("#addAdmin").html()
                    });
                    $("#addAdminForm")[0].reset();
                    form.on('submit(addForm)', function (data) {
                        var param = data.field;
                        $.ajax({
                            url: '/addAdmin',
                            type: "post",
                            data: JSON.stringify(param),
                            contentType: "application/json; charset=utf-8",
                            success: function (da) {
                                console.log(da);
                                layer.msg('添加成功', {icon: 1, time: 2000});
                                setTimeout(function () {
                                    window.location.href = '/findAdmin';
                                }, 2000);
                            },
                            error: function () {
                                layer.msg('添加失败', {icon: 0, time: 2000});
                                setTimeout(function () {
                                    window.location.href = '/findAdmin';
                                }, 2000);
                            }
                        });
                    });
                }
            });
        });

        /*编辑*/
        $(".updateEdit").click(function () {
            var myid = $(this).parent("td").parent("tr").children(".myid").html();
            var power = ${sessionScope.ad.a_power};
            //判断
            if (power != 1) {
                layer.alert("对不起，您没有权限:(");
            } else {
                window.location.href = "/findAdminById?a_id=" + myid;
            }
        });

        /*删除*/
        function member_del(obj, a_id) {
            var power = ${sessionScope.ad.a_power}
            var id = ${sessionScope.ad.a_id};
            if (power != 1) {
                layer.alert("对不起，您没有权限:(");
            } else if (id == a_id) {
                layer.alert("不能删除自己:(");
            } else {
                layer.confirm('确认要删除吗？', function () {
                    $.ajax({
                        url: '/deleteAdmin',
                        type: "get",
                        data: {"a_id": a_id},
                        contentType: "application/json; charset=utf-8",
                        success: function () {
                            layer.msg('删除成功', {icon: 1, time: 1000});
                            setTimeout(function () {
                                window.location.href = '/findAdmin';
                            }, 2000);
                        },
                        error: function () {
                            layer.msg('删除失败', {icon: 0, time: 1000});
                            setTimeout(function () {
                                window.location.href = '/findAdmin';
                            }, 2000);
                        }
                    });
                });
            }
        }
    </script>
</body>
</html>
