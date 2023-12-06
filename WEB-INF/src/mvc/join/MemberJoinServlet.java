package mvc.join;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.database.Db_connection;

@WebServlet("/MemberJoinServlet")
public class MemberJoinServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("loggedInUserID") != null) {
            response.sendRedirect("index.jsp");
        } else {
            response.setContentType("text/html; charset=utf-8");
		    request.setCharacterEncoding("utf-8");
            
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String birth = request.getParameter("birth");
            String mail = request.getParameter("mail");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String registDay = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                conn = Db_connection.getConnection();
                String insertQuery = "INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertQuery);
                pstmt.setString(1, id);
                pstmt.setString(2, password);
                pstmt.setString(3, new String(name.getBytes("UTF-8"), "UTF-8"));
                pstmt.setString(4, gender);
                pstmt.setString(5, birth);
                pstmt.setString(6, mail);
                pstmt.setString(7, phone);
                pstmt.setString(8, new String(address.getBytes("UTF-8"), "UTF-8"));
                pstmt.setString(9, registDay);

                int result = pstmt.executeUpdate();

                pstmt.close();
                conn.close();

                session.invalidate();

                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}