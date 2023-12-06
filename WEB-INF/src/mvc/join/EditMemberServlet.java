import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.database.Db_connection;

@WebServlet("/EditMemberServlet")
public class EditMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String loggedInUserId = (String) session.getAttribute("user_id"); // 로그인한 사용자의 ID를 가져옵니다.

        String newGender = request.getParameter("gender");
        String newBirth = request.getParameter("birth");
        String newMail = request.getParameter("mail");
        String newPhone = request.getParameter("phone");
        String newAddress = request.getParameter("address");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Db_connection.getConnection();

            String query = "UPDATE member SET gender=?, birth=?, mail=?, phone=?, address=? WHERE id=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, newGender);
            ps.setString(2, newBirth);
            ps.setString(3, newMail);
            ps.setString(4, newPhone);
            ps.setString(5, newAddress);
            ps.setString(6, loggedInUserId);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                response.getWriter().write("User information updated successfully!");
            } else {
                response.getWriter().write("Failed to update user information.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources in a finally block
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}