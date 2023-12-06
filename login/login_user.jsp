<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*, mvc.database.Db_connection" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </head>
<body>
    <%@ include file="../top_menu.jsp" %> <!-- 상단 메뉴 include -->

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">일반 사용자 모드 접근 - 로그인이 필요합니다.</h1>
        </div>
    </div>

    <div class="container" align="center">
        <div class="col-md-4 col-md-offset-4">
            <h3 class="form-signin-heading">Please sign in</h3>
            <% 
                String error = request.getParameter("error");
                if (error != null) {
            %>
            <div class="alert alert-danger">
                아이디와 비밀번호를 확인해 주세요
            </div>
            <% } %>

            <form class="form-signin" id="loginForm" method="post" action="LoginServlet">
                <div class="form-group">
                    <label for="inputUserName" class="sr-only">User Name</label>
                    <input type="text" class="form-control" id="inputUserName" placeholder="ID" name='j_username' required autofocus>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" class="form-control" id="inputPassword" placeholder="Password" name='j_password' required>
                </div>
                <button class="btn btn-lg btn-success btn-block" type="submit">Sign in</button>
            </form>
            
            <div class="mt-3">
                <a href="/login/find_id.jsp">아이디 찾기</a> | <a href="/login/find_pw.jsp">비밀번호 찾기</a>
            </div>
        </div>
    </div>
</body>
</html>