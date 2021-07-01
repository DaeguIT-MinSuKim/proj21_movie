<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/login/find_main.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
<script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script type="text/javascript">
function openPop(){
	var contextPath = "<%=request.getContextPath()%>";
    var popup = window.open(contextPath + "/find_ID", 
    		'이메일찾기', 'width=264px,height=373px,scrollbars=no,menubar=no,resizable=no');
}

function openPop2(){
	var contextPath = "<%=request.getContextPath()%>";
    var popup = window.open(contextPath + "/find_PW", 
    		'패스워드찾기', 'width=264px,height=333px,scrollbars=no,menubar=no,resizable=no');
}
</script>
</head>
<body>
	<%@include file="/WEB-INF/view/header.jsp"%>
		<section>
			<div class="find_m">
				<img id="find_account" alt="안내이미지" src="${contextPath}/resources/images/login/info.png">
				<h3>이메일 또는 패스워드 찾기를 선택해 주세요</h3>
				<a href="#none" target="_blank" onclick="openPop()">
				<input class="btn_id" id="button" type="button" value="이메일 찾기"/></a>
				<a href="#none" target="_blank" onclick="openPop2()">
				<input class="btn_pw" id="button" type="button" value="패스워드 찾기"/></a>
			</div>
		</section>
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>