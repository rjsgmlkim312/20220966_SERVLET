<%@ page contentType = "text/html;charset=utf-8" %>
 <%-- Class는 스타일 적용시에 사용되는 이름, 중첩 가능 --%>
        <%! String greeting = "게임 모음 Gam Mo";
            String tagline = "게임 모음 사이트에 온 것을 환영합니다!";%>
                <div class ="jumbotron">
                    <div class ="container" style = "text-align:center">
                        <h1 class="display-3">
                            <%=greeting%>
                        </h1>
                    </div>
                </div>
        <div class="container">
            <div class="text-center">
                <h3>
                    <%=tagline%>
                </h3>
            </div>
            <hr>
        </div>
 <div class="card bg-dark text-white">
    <img src="Image/Game.png" class="card-img" alt="...">
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

