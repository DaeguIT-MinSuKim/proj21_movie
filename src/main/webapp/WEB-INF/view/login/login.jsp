<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${contextPath}/resources/css/login/login.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
<script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	<!-- 회원 로그인 -->
	var contextPath = "<%= request.getContextPath()%>";
	$("#selButton").click(function(e){
		var LoginCommand = {  
                 memEmail: $("#memEmail").val(), 
                 memPasswd: $("#memPasswd").val()
               };
		$.ajax({
    		url         : contextPath + "/api/login",
    		type        : "POST",
    		contentType : "application/json; charset=utf-8",
    		datatype    : "json",
    		cache       : false,
    		data        : JSON.stringify(LoginCommand),
    		success     : function(data) {
    			alert("로그인에 성공했습니다");
        		window.location.href = contextPath + "/loginSuccess";
    		},
    		error       : function(request, status, error){
        		alert("아이디 또는 비밀번호를 확인해주세요");
        		window.location.href = contextPath + "/loginfail";
    		}
		});
	}); 
});
</script>
</head>
<body>
	<header>
		<a href="${contextPath}/main"> 
		<img id="header_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png"></a>
		<div>
			<a href="${contextPath}/login">로그인</a> 
			<a href="${contextPath}/join">회원가입</a>
			<a href="#">바로예매</a>
		</div>
	</header>
	<nav>
		<ul>
			<li class="nav"><a href="${contextPath}/movielist">영화</a></li>
			<li class="nav"><a href="${contextPath}/reserve">예매</a></li>
			<li class="nav"><a href="${contextPath}/theaterlist">극장</a></li>
			<li class="nav"><a href="${contextPath}/inquiry">이벤트</a></li>
			<li class="nav"><a href="${contextPath}/noticelist">고객센터</a></li>
			<li id="mypagebtn"><a href="${contextPath}/mypage"><i class="far fa-user"></i></a></li>
		</ul>
	</nav>
	<section id="loginFormArea">
		<form action="/login" id="login_form" method="POST">
			<fieldset>
				<div class="fm_box">
					<table>
						<tr>
							<td>
								<div class="title"><h1>로그인</h1></div>
							</td>
						</tr>
						<tr>
							<td>
								<input class="id_input" type="text" name="memEmail" placeholder="아이디" />
							</td>
						</tr>
						<tr>
							<td>
								<input class="pw_iput" type="password" name="memPasswd" placeholder="비밀번호" />
							</td>
						</tr>
					</table>
					<c:if test = "${result == 0 }">
					<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
					</c:if>
						<label class="chbox"> 
						<input type="checkbox" name="chek_box" value="id_check" id="coki">아이디 저장</label> 
						<br> 
						<input class="btn" type="submit" value="로그인" id="selButton" /> 
						<br><br>
					<div class="text_h">
						<a href="#">ID/PW 찾기</a> | <a href="${contextPath}/join">회원가입</a>
					</div>
				</div>
			</fieldset>
		</form>
	</section>
	
	<footer>
		<div id="content">
			<img id="footer_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer>
</body>
</html>