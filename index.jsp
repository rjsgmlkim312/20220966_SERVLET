<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <title>WelCome</title>
    </head>
    <body> <%-- JSP주석처리 %>
        <nav class = "navbar navbar-expand navbar-dark bg-dark">
            <div class = "container">
                <div class = "navbar-header">
                    <a class = "navbar-brand" href="./index.jsp">Home</a>
                </div>
            </div>
        </nav>
        <%-- Class는 스타일 적용시에 사용되는 이름, 중첩 가능 --%>
        <%! String greeting = "Welcome to Web Shopping Mall";
            String tagline = "Welcome to Web Market";%>
                <div class ="jumbotron">
                    <div class ="container">
                        <h1 class="display-3">
                            <%=greeting%>
                        </h1>
                    </div>
                </div>
        <div class="container">
            <div class="text-center">
                <h3>
                    <%=tagline%>
                </h3>
            </div>
            <hr>
        </div> 
        <footer class="container">
            <p>
                &copy; WebMarket
                <%
	Date day = new java.util.Date();
	String am_pm;
	int hour = day.getHours();
	int minute = day.getMinutes();
	int second = day.getSeconds();
	if (hour / 12 == 0) {
		am_pm = "AM";
	} else {
		am_pm = "PM";
		hour = hour - 12;
	}
	String CT = hour + ":" + minute + ":" + second + " " + am_pm;
	out.println("현재 접속  시각: " + CT + "\n");
                %>
            </p>
        </footer>
    </body>
</html>
