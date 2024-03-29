<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css" />
<!-- 부트스트랩 -->
      <link
         href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
         crossorigin="anonymous"
      />
<title>고객관리시스템</title>
</head>
<body>
<div class="wrap">
	<header class="header">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<strong>고객관리시스템</strong>
			</div>
			<div class="col-md-2"></div>
		</div>
	</header>
	<main class="main">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 table_div">
				<table class="table table-dark customer_list">
				  <thead>
				   		<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>포인트</th>
							<th>등급</th>
						</tr>
				  </thead>
				  <tbody>
				   	    <!-- JSTL로 내용은 foreach돌림 --> 
						<!-- for(Customer customer : coustomerList) -->
						<c:forEach var="customer" items="${customerList}" > <!-- list: 고객리스트 전체목록 -->
				    		<tr class="table-active">	
								<td>${customer.id}</td>
								<td class="title"><a href="./view?id=${customer.id}">${customer.name}</a></td>
								<td>${customer.point}</td>
								<td>${customer.grade}</td>
							</tr>
						</c:forEach>
				   </tbody>
				</table>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="bt_wrap bt_list ">
			<a href="register">고객등록하기</a>
		</div>
		<div class="customer_page">
			<a href="#" class="bt first">&lt;&lt;</a>
			<a href="#" class="bt prev">&lt;</a>
			<a href="#" class="num on">1</a>
			<a href="#" class="num">2</a>
			<a href="#" class="num">3</a>
			<a href="#" class="num">4</a>
			<a href="#" class="num">5</a>
			<a href="#" class="bt next">&gt;</a>
			<a href="#" class="bt last">&gt;&gt;</a>
		</div>
	</main>
	<footer class="footer">
		<div class="container">
               <div class="row align-items-center">
                  <div class="col-md-2 text-center mb-3 mb-md-0">
                     <img
                        src="./images/logo.png"
                        class="img-fluid"
                        alt="푸터로고"
                     />
                  </div>
                  <div class="col-md-10">
                     <p style="font-size: 13px">
                        Address: Himedia Academy, 557, Gyeongin-ro, Guro-gu,
                        Seoul, Republic of Korea | <br />
                        Contact: htc_desirehd@naver.com | © 2024 sseung. All
                        Rights Reserved.
                     </p>
                  </div>
               </div>
               <div class="row align-items-center">
                  <div class="col-md-2"></div>
                  <div class="col-md-10">
                     <div class="icons">
                        <a target="_blank" href="https://github.com/sseung519" target="_blank"
                           ><img
                              src="./images/github.png"
                              width="80%"
                              class="img-fluid"
                              alt="github로고"
                           />
                        </a>
                        <a target="_blank"
                           href="https://w1701182135-lo1221947.slack.com/team/U069WAPFP8A"
                        >
                           <img
                              src="./images/slack.png"
                              width="80%"
                              class="img-fluid"
                              alt="slack로고"
                              style
                           />
                        </a>
                        <a 
                           ><img
                              src="./images/jsp.png"
                              width="80%"
                              class="img-fluid"
                              alt="jsp로고"
                        /></a>
                        <a
                           ><img
                              src="./images/cheonan.png"
                              alt="for Cheonan"
                        /></a>
                        <a target="_blank" href="https://kyome.io/runcat/index.html?lang=en">
                           <img
                              src="./images/flash_cat.png"
                              width="80%"
                              class="img-fluid"
                              alt="run_cat"
                           />
                        </a>
                     </div>
                  </div>
               </div>
            </div>
          </footer>
</div>
	
	<script>
		/* request 객체에 error가 있을 경우 에러메세지 출력 */
		/* 쿼리스트링에 error가 있을 경우 에레머세지 출력(request 객체에 포함되므로)  */
		<c:if test="${error != null}">
			alert("${error}")
		</c:if>
			
		<c:if test="${param.error != null}">
			alert("${error}")
		</c:if>
	</script>
	<!-- 부트스트랩 -->
      <script
         src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
         crossorigin="anonymous"
      ></script>
</body>
</html>