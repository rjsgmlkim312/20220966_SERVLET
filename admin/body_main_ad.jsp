<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>


<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
 <%-- Class는 스타일 적용시에 사용되는 이름, 중첩 가능 --%>
        <%! String greeting = "게임 모음 Gam Mo";
            String tagline = "게임 모음 사이트에 온 것을 환영합니다!";%>
<div class="container">
	<div class="jumbotron">
		<div class="container">
			<h3 class="display-4">
				<%=greeting%>
            </h3>
		</div>
	</div>	
    <%
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>

    
    <div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
                <div class="card bg-dark text-white">
                    <img src="/Image/Product/<%=product.getFilename()%>" class="card-img" alt="...">
                        <div class="card-img-overlay">
                            <h5 class="card-title">그래픽 카드 이미지 샘플</h5>
                            <p class="card-text">출처 : 구글 검색</p>
                        </div>
                </div>
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				<p><%=product.getUnitPrice()%>원
                <p>><a href="product_detail_ad.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button"> 상품 상세 정보 &raquo;</a>
			</div>
			<%
				}
			%>
		</div>
		<hr>
	</div>

    <div class="card bg-dark text-white">
        <img src="../Image/Game.png" class="card-img" alt="...">
            <div class="card-img-overlay">
                <h5 class="card-title">Game Type</h5>
                <p class="card-text">출처 : Poki</p>
            </div>
      </div>
    <div class="list-group">
          <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
            그 외 추천 게임
          </a>
        <a href="#" class="list-group-item list-group-item-action">탱크</a>
        <a href="#" class="list-group-item list-group-item-action">경영</a>
        <a href="#" class="list-group-item list-group-item-action">요리</a>
        <a href="#" class="list-group-item list-group-item-action">두뇌</a>
        <a href="#" class="list-group-item list-group-item-action">공포</a>
    </div>
    <div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
		</div>
		<hr>
	</div>
</div>

