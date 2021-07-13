<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원탈퇴</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/withdrawal.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(document).ready(function(){
		var contextPath = "<%=request.getContextPath()%>";
		var form = {
				memEmail    : $('#memEmail').val(),
				memPasswd   : $('#memPasswd').val()
				};
		$('#delete').click(function(){
			$.ajax({
	            url         : contextPath + "/withdrawal.do",
	            type        : "POST",
	            contentType : "application/json; charset=utf-8",
	            datatype    : "json",
	            cache       : false,
	            data        : JSON.stringify(form),
				success	: function(data){
					if(data==0){
						alert("패스워드가 틀렸습니다.");
						return;
					}else{
						var result = confirm('정말 탈퇴 하시겠습니까?');
						if(result){
							$('#delFrm').submit();
						}
					}
				},
				error: function(){
					alert("서버 에러.");
				}
			});
		});
		
		<!-- 취소 -->
		$('#cancel').click(function(){
	    	var contextPath = "<%=request.getContextPath()%>";
			location.href = contextPath + "/mypage";
		});
            	
        <!-- 비밀번호 입력확인 -->	
        $("#delete").on("click", function(){
        	if($("#memPasswd").val()==""){
               alert("패스워드를 입력해주세요.");
               $("#memPasswd").focus();
               return;
			}else if($('#confmemPasswd').val() == ''){
				alert("패스워드를 입력해 주세요.");
				$('#confmemPasswd').focus();
				return;
			}
        	
        	<!-- 패스워드 일치 확인 -->
        	if($('#confmemPasswd').val() != $('#memPasswd').val()){
				alert("패스워드가 일치하지 않습니다.");
				$('#confmemPasswd').focus();
				return;
			}        	
        }); 
	});
});
</script>
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<!-- section -->
	<section>
		<div id="container">
		
			<!-- 메뉴바 -->
			<div id="mypage-menubar">
				<ul>
					<li><a href="${contextPath}/mypage"><h2>My Page</h2></a></li>
					<li><a href="${contextPath}/reserveInfo">예매내역</a></li>
					<li><a href="${contextPath}/commentInfo">한줄평 내역</a></li>
					<li><a href="${contextPath}/inquiryInfo">1대1 문의 내역</a></li>
					<li><a href="${contextPath}/myinfo">개인정보 수정</a></li>
					<li class="active-menu"><a href="${contextPath}/withdrawal">회원탈퇴</a></li>
				</ul>
			</div>
			
			<!-- 본문 -->
			<form action="withdrawalsuccess.do" name="delFrm" id="delFrm" method="post">
			<div id="mypage-wrap">
					<h2>회원탈퇴</h2>
					<div id="textarea">
						<div id="titlearea">
							<i class="fas fa-square"></i>
							<h2>유의사항</h2>
						</div>
						<br>
						<span>
							   회원탈퇴를 진행하신 계정은 탈퇴 후 모든 정보가 삭제되어 복구가 불가합니다.<br>
	 			 			   예매 중이신 영화정보도 함께 삭제되니 반드시 확인 후 진행해주시길 바랍니다.
	 			 		</span>			
 			 		</div>
 			 		<div id="passwordarea">
 			 		 	<label>이메일</label>
 			 			<input type="email" name="memEmail" value="${member.memEmail}" readonly>
 			 			<br>
 			 			<label>비밀번호</label>
 			 			<input type="password" id="memPasswd" name="memPasswd" placeholder="비밀번호를 입력해주세요.">
 			 			<br>
 			 			<label>비밀번호 확인</label>
 			 			<input type="password" id="confmemPasswd" name="confmemPasswd" placeholder="비밀번호를 한번 더 입력해주세요.">
 			 		</div>
 			 		<div id="button-group">
 			 			<input class="btn1" type="button" value="취소" id="cancel" /> 
						<input class="btn2" type="submit" value="탈퇴" id="delete" />	
 			 		</div>
				</div>
			</form>
		</div>
	</section>

	<!-- footer -->
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>