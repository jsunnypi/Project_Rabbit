<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
.login-container {
	width: 400px;
	margin: 400px auto;
	padding: 40px;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.login-title {
	text-align: center;
	font-size: 28px;
	margin-bottom: 30px;
}

.input-row {
	margin-bottom: 15px;
}

.input-row input {
	width: 95%;
	height: 45px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
}

.button-group {
	display: flex;
	gap: 10px;
	margin: 20px 0;
}

.button-group button, .button-group input[type="submit"] {
	flex: 1;
	height: 45px;
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: #f5f5f5;
	font-size: 16px;
	cursor: pointer;
}

.links {
	text-align: center;
	margin-top: 20px;
}

.links a {
	color: #666;
	text-decoration: none;
	font-size: 14px;
	margin: 0 10px;
}

.error-message {
	color: red;
	text-align: center;
	margin: 10px 0;
}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<c:if test="${not empty userLoing}">
		<%
			RequestDispatcher rd = request.getRequestDispatcher("main.do");
		
			rd.forward(request, response);
		%>
	</c:if>
	
	<div class="login-container">
		<h2 class="login-title">로그인</h2>
		<form method="post" action="login.do">
			<div class="input-row">
				<input type="text" name="userid" placeholder="아이디">
			</div>
			<div class="input-row">
				<input type="password" name="password" placeholder="비밀번호">
			</div>

			<div class="button-group">
				<input type="submit" value="로그인">
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/main.do'">돌아가기</button>
			</div>

			<div class="error-message">${message}</div>

			<div class="links">
				<a href="join.do">회원가입</a> | <a href="">아이디/비밀번호 찾기</a>
			</div>
		</form>
	</div>
</body>
</html>