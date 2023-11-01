<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("../product_detail.jsp");
		return;
	}

	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if (product == null) {
		response.sendRedirect("../exception/product_not_found.jsp");
	}

	ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
	if (cartList != null) { // 세션에 상품 목록이 비어있지 않은 경우에만 실행
		Product goodsQnt = new Product();
		for (int i = 0; i < cartList.size(); i++) {
			goodsQnt = cartList.get(i);
			if (goodsQnt.getProductId().equals(id)) {
				cartList.remove(goodsQnt);
				break; // 삭제 후 루프를 빠져나감
			}
		}
	}
/*
	Product goodsQnt = new Product();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}
*/
	response.sendRedirect("product_cart.jsp");
%>
