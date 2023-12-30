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
            <form class="layui-form layui-col-md12 x-so" action="/findStudent">
                <input class="layui-input" placeholder="请输入姓名" name="s_name" id="s_name">
                <input class="layui-input" placeholder="请输入学号" name="s_studentid" id="s_studentid">
                <input class="layui-input" placeholder="请输入班级编号" name="s_classid" id="s_classid">
                <input class="layui-input" placeholder="请输入班级名" name="s_classname" id="s_classname">

                <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                <a class="layui-btn layui-btn-small" style="float:right" href="/findStudent" title="刷新">
                    <i class="layui-icon">&#x21bb;</i></a>
            </form>
        </div>
        <xblock>
            <button id="addStudentBtn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe654;</i>添加
            </button>
            <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出
            </button>
            <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
        </xblock>

        <%--添加模态框--%>
        <div class="layui-row" id="addStudent" style="display: none;">
            <div class="layui-col-md10">
                <form class="layui-form" id="addStudentForm">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>学号：</label>
                        <div class="layui-input-block">
                            <input type="text" name="s_studentid" lay-verify="required|number"
                                   lay-reqtext="学号不能为空" class="layui-input"
                                   autocomplete="off" placeholder="请输入学号">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>姓名：</label>
                        <div class="layui-input-block">
                            <input type="text" name="s_name" lay-verify="required" lay-reqtext="姓名不能为空"
                                   class="layui-input"
                                   autocomplete="off" placeholder="请输入姓名">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">性别：</label>
                        <div class="layui-input-block">
                            <input type="radio" name="s_sex" value="男" title="男">
                            <input type="radio" name="s_sex" value="女" title="女">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">电话：</label>
                        <div class="layui-input-block">
                            <input type="text" name="s_phone" class="layui-input" lay-verify="phone"
                                   autocomplete="new-pwd" placeholder="请输入电话">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>班级编号：</label>
                        <div class="layui-input-block">
                            <input type="text" name="s_classid" lay-verify="required|number"
                                   lay-reqtext="班级编号不能为空" class="layui-input"
                                   autocomplete="off" placeholder="请输入班级编号">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>班级名：</label>
                        <div class="layui-input-block">
                            <input type="text" name="s_classname" lay-verify="required" lay-reqtext="班级名不能为空"
                                   class="layui-input"
                                   autocomplete="off" placeholder="请输入班级名">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>宿舍楼：</label>
                        <div class="layui-input-block">
                            <input type="text" name="s_dormbuilding" lay-verify="required"
                                   lay-reqtext="宿舍楼不能为空" class="layui-input"
                                   autocomplete="off" placeholder="请输入宿舍楼">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="necessary">* </i>宿舍编号：</label>
                        <div class="layui-input-block">
                            <input type="text" name="s_dormitoryid" lay-verify="required|number"
                                   lay-reqtext="宿舍编号不能为空" class="layui-input"
                                   autocomplete="off" placeholder="请输入宿舍编号">
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
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>电话</th>
                <th>班级编号</th>
                <th>班级名</th>
                <th>宿舍楼</th>
                <th>宿舍编号</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pi.list}" var="student">
                <tr>
                    <td>${student.s_id}</td>
                    <td>${student.s_studentid}</td>
                    <td>${student.s_name}</td>
                    <td>${student.s_sex}</td>
                    <td>${student.s_phone}</td>
                    <td>${student.s_classid}</td>
                    <td>${student.s_classname}</td>
                    <td>${student.s_dormbuilding}</td>
                    <td>${student.s_dormitoryid}</td>
                    <td>
                        <a title="编辑" onclick="member_edit(this,'${student.s_id}')" href="javascript:;">
                            <i class="layui-icon">&#xe642;</i>
                        </a>
                        <a title="删除" onclick="member_del(this,'${student.s_id}')" href="javascript:;">
                            <i class="layui-icon">&#xe640;</i>
                        </a>
                    </td>
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
                    url: '/exportStudentList',
                    type: 'post',
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        console.log(data);

                        // 1. 如果需要调整顺序，请自行梳理函数
                        var dt = excel.filterExportData(data, [
                            's_id',
                            's_studentid',
                            's_name',
                            's_sex',
                            's_phone',
                            's_classid',
                            's_classname',
                            's_dormbuilding',
                            's_dormitoryid'
                        ]);

                        // 2. 数组头部新增表头
                        dt.unshift({
                            s_id: 'ID',
                            s_studentid: '学号',
                            s_name: '姓名',
                            s_sex: '性别',
                            s_phone: '电话',
                            s_classid: '班级编号',
                            s_classname: '班级名',
                            s_dormbuilding: '宿舍楼',
                            s_dormitoryid: '宿舍编号'
                        });

                        var colConf = excel.makeColConfig({
                            'B': 90,
                            'C': 80,
                            'F': 90
                        }, 60);

                        var timeStart = Date.now();

                        // 3. 执行导出函数，系统会弹出弹框
                        excel.exportExcel({
                            sheet1: dt
                        }, '学生数据.xlsx', 'xlsx', {
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
                            window.location.href = '/findStudent';
                        }, 2000);
                    }
                });
            });

            /*点击添加按钮*/
            $("#addStudentBtn").click(function () {
                if (!${empty sessionScope.s.s_id}) {
                    layer.alert("对不起，您没有权限:(");
                } else {
                    layer.open({
                        type: 1,
                        title: "添加学生",
                        area: ["55%"],
                        shadeClose: true,
                        shade: 0.4,
                        anim: 2,
                        content: $("#addStudent").html()
                    });
                    $("#addStudentForm")[0].reset();
                    form.on('submit(addForm)', function (data) {
                        var param = data.field;
                        $.ajax({
                            url: '/addStudent',
                            type: "post",
                            data: JSON.stringify(param),
                            contentType: "application/json; charset=utf-8",
                            success: function () {
                                layer.msg('添加成功', {icon: 1, time: 2000});
                                setTimeout(function () {
                                    window.location.href = '/findStudent';
                                }, 2000);
                            },
                            error: function () {
                                layer.msg('添加失败', {icon: 0, time: 2000});
                                setTimeout(function () {
                                    window.location.href = '/findStudent';
                                }, 2000);
                            }
                        });
                    });
                }
            });
        });

        /*编辑*/
        function member_edit(obj, s_id) {
            if (!${empty sessionScope.s.s_id}) {
                layer.alert("对不起，您没有权限:(");
            } else {
                window.location.href = '/findStudentById?s_id=' + s_id;
            }
        }
        
        /*删除*/
        function member_del(obj, s_id) {
            if (!${empty sessionScope.s.s_id}) {
                layer.alert("对不起，您没有权限:(");
            } else {
                layer.confirm('确认要删除吗？', function () {
                    $.ajax({
                        url: '/deleteStudent',
                        type: "get",
                        data: {"s_id": s_id},
                        contentType: "application/json; charset=utf-8",
                        success: function () {
                            layer.msg('删除成功', {icon: 1, time: 1000});
                            setTimeout(function () {
                                window.location.href = '/findStudent';
                            }, 2000);
                        },
                        error: function () {
                            layer.msg('删除失败', {icon: 0, time: 1000});
                            setTimeout(function () {
                                window.location.href = '/findStudent';
                            }, 2000);
                        }
                    })
                });
            }
        }
    </script>
</body>
</html>
