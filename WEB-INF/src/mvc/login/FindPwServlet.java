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

import mvc.database.Db_connection;

@WebServlet("/FindPasswordServlet")
public class FindPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("id");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = Db_connection.getConnection();

            String query = "SELECT password FROM member WHERE id=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, userId);
            rs = ps.executeQuery();

            if (rs.next()) {
                String password = rs.getString("password");
                response.getWriter().write("Password for user ID " + userId + " is: " + password);
            } else {
                response.getWriter().write("User ID not found!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources in a finally block
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