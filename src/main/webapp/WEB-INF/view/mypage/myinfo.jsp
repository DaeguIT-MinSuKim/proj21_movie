<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/myinfo.css">
</head>
<body>
	<header>
		<img id="header_ci" alt="브랜드 로고" src="<%=request.getContextPath()%>/resources/images/ci.png">
		<div>
			<a href="#">로그인</a>
			<a href="#">회원가입</a>
			<a href="#">바로예매</a>
		</div>
	</header>
	
	<nav>
		<ul>
			<li><a href="#">영화</a></li>
			<li><a href="#">예매</a></li>
			<li><a href="#">극장</a></li>
			<li><a href="#">이벤트</a></li>
			<li><a href="#">고객센터</a></li>
		</ul>
	</nav>
	
	
	<section>
		<div id="container">
			<div id="mypage-menubar">
			
				<ul>
					<li><a href="#"><h2>My Page</h2></a></li>
					<li><a href="#">예매내역</a></li>
					<li><a href="#">한줄평 내역</a></li>
					<li><a href="#">1대1 문의 내역</a></li>
					<li><a href="#">개인정보 수정</a></li>
					<li><a href="#">회원탈퇴</a></li>
				</ul>
			</div>
			
			<div id="myinfo-wrap">
				<h2>개인정보 수정</h2>
				
				<div>
					<h3>기본정보</h3>
					<table id="myinfo-table" class="myinfo">
						<tr>
							<th>이름</th>
							<td>
								test &nbsp;&nbsp;
								<span>이름 변경하기</span> &nbsp;&nbsp;
								※ 개명으로 이름이 변경된 경우, 회원정보의 이름을 변경하실 수 있습니다.
							</td>
						</tr>
						
						<tr>
							<th>생년월일</th>
							<td>1990년 01월 01일</td>
						</tr>
						
						<tr>
							<th>휴대폰</th>
							<td>
								010-1234-1234 &nbsp;&nbsp;
								<span>휴대폰번호 변경하기</span>
							</td>
						</tr>
						
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" value="test@test.com">
							</td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td><span>비밀번호 변경</span></td>
						</tr>
					</table>
					
					<div id="button-group">
						<span><a herf="#">취소</a></span>
						<span id="confirm"><a herf="#">등록</a></span>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<div>
			<img id="footer_ci" alt="브랜드 로고" src="<%=request.getContextPath()%>/resources/images/ci.png">
			<p>
			제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다.
			<br>
			재판의 전심절차로서 행정심판을 할 수 있다. 행정심판의 절차는 법률로 정하되, 사법절차가 준용되어야 한다.
			</p>
		</div>
	</footer>
	
</body>
</html>