<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import="java.sql.*, java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, mvc.database.Db_connection" %>

<html>
<head>
    <meta charset="UTF-8">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
    <%@ include file="../top_menu.jsp" %> <!-- 상단 메뉴 include -->

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">일반 사용자 모드 접근 - 회원가입이 필요합니다.</h1>
        </div>
    </div>

    <div class="container" align="center">
        <div class="col-md-6 col-md-offset-3">
            <h3 class="form-signup-heading">Please sign up</h3>

            <form class="form-signup" action="/MemberJoinServlet" method="post">
                <div class="form-group row">
				<label class="col-sm-2">ID</label>
				<div class="col-sm-3">
					<input type="text" id ="id" name="id" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">Password</label>
				<div class="col-sm-3">
					<input type="password" id ="password" name="password" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">Name</label>
				<div class="col-sm-3">
					<input type="text" id ="name" name="name" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
                <label class="col-sm-2">Gender</label>
                <div class="col-sm-5">
                    <select id="gender" name="gender" class="form-control">
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>
            </div>
			<div class="form-group row">
				<label class="col-sm-2">Birth</label>
				<div class="col-sm-3">
					<input type="text" id="birth" name="birth" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">Mail</label>
				<div class="col-sm-3">
					<input type="text" placeholder="example@gmail.com" id="mail" name="mail" class="form-control" >
				</div>
			</div>
                <div class="form-group row">
                    <label class="col-sm-2">Phone</label>
                    <div class="col-sm-3">
                        <input type="text" placeholder="01012345678" id ="phone" name="phone" class="form-control" >
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">Adress</label>
                    <div class="col-sm-3">
                        <input type="text" id ="address" name="address" class="form-control" >
                    </div>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
            </form>
        </div>
    </div>
</body>
</html>
