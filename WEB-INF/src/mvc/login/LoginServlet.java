import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import mvc.database.Db_connection; // Assuming this class handles DB connections

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("j_username");
        String password = request.getParameter("j_password");
        boolean isValidUser = validateUser(username, password);

        if (isValidUser) {
            // If the user is valid, set session attribute and redirect to a success page
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("success.jsp"); // Replace with your success page
        } else {
            // If the user is not valid, redirect back to the login page with an error parameter
            response.sendRedirect("login.jsp?error=true"); // Replace with your login page
        }
    }

    // Method to validate user credentials against the database
    private boolean validateUser(String username, String password) {
        boolean isValid = false;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Db_connection.getConnection(); // Get your DB connection
            String query = "SELECT * FROM member WHERE id=? AND password=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            isValid = rs.next(); // Check if any results were returned
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close connections
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isValid;
    }
}