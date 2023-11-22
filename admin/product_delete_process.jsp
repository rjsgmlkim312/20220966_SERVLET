<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../db/db_conn.jsp" %>

<%
    // 1. 상품 ID 확인
    String productId = request.getParameter("productId");
    if (productId != null) {
        try {
            // 2. 상품 삭제 쿼리 실행
            String deleteQuery = "DELETE FROM product WHERE p_id = ?";
            PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery);
            deleteStatement.setString(1, productId);
            int rowsDeleted = deleteStatement.executeUpdate();

            // 3. 삭제 결과 피드백
            if (rowsDeleted > 0) {
                out.println("<p>상품이 성공적으로 삭제되었습니다!</p>");
            } else {
                out.println("<p>상품 삭제에 실패했습니다.</p>");
            }

            deleteStatement.close();
        } catch (SQLException e) {
            out.println("<p>에러 발생: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>삭제할 상품 ID가 제공되지 않았습니다.</p>");
    }

    // 4. 데이터베이스 연결 닫기
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            out.println("<p>연결 닫기 에러: " + e.getMessage() + "</p>");
        }
    }
    	response.sendRedirect("product_edit.jsp?edit=delete");
%>