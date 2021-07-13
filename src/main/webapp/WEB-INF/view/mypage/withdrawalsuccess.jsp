<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원탈퇴완료</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/mypage/withdrawalsuccess.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<!-- section -->
	<section>
		<div class="con_main">
			<img id="con_img2" alt="안내이미지" src="${contextPath}/resources/images/mypage/information.png">
			<div class="con_text">
				<h2>지금까지 BOX MOVIE를 이용해주셔서 감사합니다.</h2>
				<a href="${contextPath}/main"><input class="btn_main" id="button" type="submit" value="메인으로 돌아가기"/></a>
			</div>
		</div>
	</section>
	
	<!-- footer -->	
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>