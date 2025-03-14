<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style>
.join-container {
	width: 700px;
	margin: 250px auto;
	padding: 40px;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.join-title {
	text-align: center;
	font-size: 24px;
	margin-bottom: 30px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

td {
	padding: 8px 0;
}

td:first-child {
	width: 120px;
	text-align: left;
}

/* 일반 입력 필드 너비 수정 */
input[type="text"], input[type="password"] {
	width: 425px;
	height: 35px;
	padding: 5px 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

/* 이메일 입력 필드 수정 */
td input[name="email"], td input[name="email_domain"] {
	width: 130px;
}

/* 이메일 선택 박스 수정 */
td select {
	width: 110px;
	height: 45px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

/* 중복확인 버튼 수정 */
.check-button {
	width: 100px; /* 버튼 너비 고정 */
	height: 35px; /* 높이 통일 */
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: #f5f5f5;
	cursor: pointer;
	margin-left: 10px;
	white-space: nowrap;
}

.button-group {
	text-align: center;
	margin-top: 30px;
}

/* 하단 버튼 수정 */
.button-group button {
	width: 120px; /* 버튼 너비 증가 */
	height: 35px;
	margin: 0 5px;
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: #f5f5f5;
	cursor: pointer;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/script/member.js"></script>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<div class="join-container">
		<h2 class="join-title">회원 가입</h2>
		<form method="post" action="join.do" name="frm">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" required> <input
						type="hidden" name="reuserid">
						<button type="button" class="check-button" onclick="useridCheck()">중복
							확인</button></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" required></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="checked_password" required></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" required></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nickname" required></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<div class="email-input">
							<input type="text" name="email">
							<span>@</span>
							<input type="text" name="email_domain">
							<select name="email_select">
							    <option value="custom">직접 입력하기</option>
							    <option value="naver.com">naver.com</option>
							    <option value="gmail.com">gmail.com</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" required></td>
				</tr>
			</table>
			<div class="button-group">
				<button type="submit" onclick="return joinCheck()">회원가입</button>
				<button type="button" onclick="location.href='main.do'">돌아가기</button>
			</div>
		</form>
	</div>
</body>
</html>