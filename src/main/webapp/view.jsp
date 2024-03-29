<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css" />
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
<div class="customer_wrap">
	<div class="row">
	  <div class="col-md-2"></div>
	  <div class="col-md-8">
		<div class="customer_title">
			<a href="/jsp_customer/index"><strong>고객관리시스템</strong></a>
			<p>고객상세정보</p>
		</div>
		<div class="col-md-2"></div>
		</div>
		<div class="customer_view_wrap main">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="customer_view">
					<div class="card" style="width: 30rem; margin: 0 auto;">
						<c:if test="${customer.img != null}">
			  				<img src="${customer.img}" alt="업로드 이미지"  class="card-top-img">
			  			</c:if>
					  	<div class="card-body" style ="border-top: 1px solid black;">
						  	<p class="card-text">아이디: ${customer.id }</p>
						    <p class="card-text">고객명: ${customer.name }</p>
						    <p class="card-text">주소: ${customer.address }</p>
						    <p class="card-text">전화번호: ${customer.phone }</p>
						    <p class="card-text">성별: ${customer.gender }</p>
						    <p class="card-text">나이: ${customer.age }</p>
						    <p class="card-text">포인트: ${customer.point }</p>
						    <p class="card-text">등급: ${customer.grade }</p>
						    <div class="card-link">
						    	<a href="edit?id=${customer.id }" class="btn btn-primary edit-btn1">수정하기</a>
						    	<a onclick="chkDelete(${customer.id}); return false;" class="btn btn-danger edit-btn2">삭제하기</a>
						    </div>
					  	</div>
					</div>
			</div> 
			</div>
			<div class="col-md-2"></div>
			
			
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
          </div>
	</div>
	<script type="text/javascript" src="./js/script.js"></script>
	<script>
		/* request 객체에 error가 있을 경우 에러메세지 출력 */
		<c:if test="${error != null}">
			alert("${error}]")
		</c:if>
			
		<c:if test="${param.error != null}">
			alert("${error}]")
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