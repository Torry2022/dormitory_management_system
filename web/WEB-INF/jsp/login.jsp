<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <link rel="stylesheet" href="/css/users_login.css">
    <link rel="icon" href="/images/favicon.ico" sizes="32x32"/>
    <script src="/js/jquery-1.3.2.min.js"></script>
    <script src="/js/login.js"></script>

    <title>前台首页</title>
</head>
<body>
    <div class="header">
    </div>

    <div class="body">
        <div class="panel">
            <div class="top">
                <p>登&nbsp;&nbsp;录</p>
            </div>

            <div class="middle">
                <form action="/login" method="post">
                    <span class="erro">${msg}</span><br>
                    <span class="s1"></span>
                    <span class="s2"></span>
                    <span class="s3"></span>
                    <input type="text" name="username" class="inputs" placeholder="请输入用户名/学号"/>
                    <input type="password" name="password" class="inputs" placeholder="请输入密码"/>
                    <div class="select">

                        <select name="role">
                            <option value="身份">请选择登录身份</option>
                            <option value="管理员">管理员</option>
                            <option value="学生">学生</option>
                        </select>
                    </div>
                    <input type="submit" value="登  录"/>
                </form>
            </div>
        </div>
    </div>

    <div class="footer">
        <span>@Copyright © 2021-2023 版权所有</span>
    </div>
</body>
</html>
