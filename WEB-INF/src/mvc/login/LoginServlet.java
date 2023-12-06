import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.database.Db_connection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String m_id = request.getParameter("j_username");
    String m_pw = request.getParameter("j_password");

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = Db_connection.getConnection(); // 데이터베이스 연결을 가져옵니다.

        // 사용자명과 비밀번호가 일치하는지 확인합니다.
        String query = "SELECT id,password,name FROM member WHERE id= ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, m_id);
        rs = ps.executeQuery();

        if (rs.next()) { // 일치하는 사용자가 발견된 경우
            if (m_pw.equals(rs.getString("password"))) {
                HttpSession session = request.getSession();
                session.setAttribute("user_name", rs.getString("name"));
            }
            // 성공 페이지로 리디렉션하거나 추가 처리를 수행합니다.
            response.sendRedirect("/index.jsp");
        } else {
            // 로그인 페이지로 에러 파라미터와 함께 리디렉션합니다.
            response.sendRedirect("/login_user.jsp?error=invalid");
        }
    } catch (SQLException e) {
        e.printStackTrace(); // 잠재적인 오류 처리 - 로그 기록 또는 오류 페이지로 리디렉션
    } catch (ClassNotFoundException e) {
        e.printStackTrace(); // Db_connection 클래스를 찾지 못한 경우의 처리
    } finally {
        // 리소스를 닫습니다.
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            }
        }
    }
}
