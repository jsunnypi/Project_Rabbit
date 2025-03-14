<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입을 축하합니다.</h2>
	<div>
		<form name ="frm">
			<table>
				<tr>
					<th>아이디 : </th>
					<td>${member.userid}</td> <!-- 수정된 부분 -->
				</tr>

				<tr>
					<th>비밀번호 : </th>
					<td>${member.password}</td> <!-- 수정된 부분 -->
				</tr>

				<tr>
					<th>이름 : </th>
					<td>${member.name}</td> <!-- 수정된 부분 -->
				</tr>

				<tr>
					<th>닉네임 : </th>
					<td>${member.nickname}</td> <!-- 수정된 부분 -->
				</tr>

				<tr>
					<th>전화번호 : </th>
					<td>${member.phone}</td> <!-- 수정된 부분 -->
				</tr>

				<tr>
					<th>이메일 : </th>
					<td>${member.email}</td> <!-- 수정된 부분 -->
				</tr>

				<tr>
					<th>주소 : </th>
					<td>${member.address}</td> <!-- 수정된 부분 -->
				</tr>

				<tr>
					<td colspan="2">${message}</td> <!-- 성공 메시지 출력 -->
				</tr>

				<tr>
					<td colspan="2">
						<input type="button" value="로그인 페이지로 이동" onclick="location.href='login.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>