<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import="java.util.Date"%>
<%@ page import="example.*" %>

	<footer class="container">
	<p>&copy; 쇼핑몰 대표 : 김건희, 고유번호 : 20220966, 연락처 : event000pw@sungkyul.ac.kr<br> </p>
        <p>
            &copy; Game Site
            <%
    	    ShopTime time = new ShopTime();
            %>
            오늘 날짜와 시간 <%=time.timenow() %>
        </p>
</footer>

