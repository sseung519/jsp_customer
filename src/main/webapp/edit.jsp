<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<p>고객수정</p>
		</div>
		</div>
		<div class="col-md-2"></div>
	  </div>
		<div class="customer_register_wrap">
			<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">								<!-- 파일첨부할때 필요 enctype="multipart/form-data  -->
			<form name="frm" method="post" action="update?id=${customer.id }" enctype="multipart/form-data"> 
				<div class="customer_register">
					<div style="padding-top: 10px;">
						<label style="font-size: 1.4rem; padding-right: 20px;" for="file">프로필 업로드</label>
						<input type="file" name="file" id="file" style="color: white;"/> 
						<c:if test="${customer.img != null}">
						<img alt="업로드 이미지" src="${customer.img}" width="100"/>
						</c:if>
						<input type="hidden" name="origin_file" value="${customer.img}">
					</div> <br/>
					<div class="info">
						<dl>
							<dt>이름</dt>
							<dd><input type="text" name="name" maxlength="50" placeholder="이름입력" class="reg" value="${customer.name }" /></dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>주소</dt>
							<dd><input type="text" name="address" maxlength="50" placeholder="주소입력" class="reg" value="${customer.address }" /></dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>전화번호</dt>
							<dd><input type="text" name="phone" maxlength="50" placeholder="'-'를 포함하여 입력" class="reg" value="${customer.phone }" /></dd>
						</dl>
					</div>
					<div class="info">
						<dt>성별</dt>
						<dd>
							<input type="radio" id="option1" name="gender" value="남">
							<label for="option1">남성</label></br>
							<input type="radio" id="option2" name="gender" value="여">
							<label for="option2">여성</label></br>
						</dd>
					</div>
					<div class="info">
						<dt>나이</dt>
						<dd><input type="number" name="age" maxlength="10" placeholder="나이입력" class="reg" value="${customer.age }" /></dd>
					</div>
					<div class="info">
						<dt>포인트</dt>
						<dd><input type="number" name="point" maxlength="10" placeholder="포인트입력" class="reg" value="${customer.point }" /></dd>
					</div>
					<div class="info">
						<dt>등급</dt>
						<dd>
							<select name="grade" id="grade">
							  <option value="bronze">bronze</option>
							  <option value="silver">silver</option>
							  <option value="gold">gold</option>
							  <option value="vip">VIP</option>
							</select>
						</dd>
					</div>
				</div>
			</form>
			</div>
			<div class="col-md-2"></div>
		</div>
			<div class="bt_wrap">
				<a onclick="chkForm(); return false;" class="on">등록</a>
				<a href="index">취소</a>
			</div>
		</div>
		<br/>
		<br/>
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
	<script type="text/javascript" src="./js/script.js"></script>
	<!-- 부트스트랩 -->
     <script
         src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
         crossorigin="anonymous"
      ></script>
</body>
</html>