<%@ page contentType = "text/html;charset=utf-8" %>
	<footer class="container">
	<p>&copy; 쇼핑몰 대표 : 김건희, 고유번호 : 20220966, 연락처 : event000pw@sungkyul.ac.kr<br> </p>
            <p>
                &copy; WebMarket
                <%
	Date day = new java.util.Date();
	String am_pm;
	int hour = day.getHours() + 9;
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