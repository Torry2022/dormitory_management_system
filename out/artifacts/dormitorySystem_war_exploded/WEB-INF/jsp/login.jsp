<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/usersLogin.css">
    <link rel="icon" href="/images/favicon.ico" sizes="32x32"/>
    <script src="/js/jquery-1.3.2.min.js"></script>
    <script src="js/login.js"></script>

    <title>前台首页</title>
</head>
<body>

    <div class="header">

    </div>

    <div class="body">
        <div class="panel">
            <div class="top">
                <p>账户登录</p>
            </div>

            <div class="middle">
                <form action="/login" method="post">
                    <span class="erro">${msg}</span>
                    <span class="s1"></span>
                    <span class="s2"></span>
                    <input type="text" name="a_username" value="" class="iputs"/>
                    <input type="password" name="a_password" value="" class="iputs"/>
                    <input type="submit" value="登录"/>
                </form>
            </div>
        </div>
    </div>

    <div class="footer">
        <span>@Copyright © 2021-2023 版权所有</span>
    </div>
</body>
</html>
