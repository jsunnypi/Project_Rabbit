<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="script/member.js"></script>


</head>
<body>
<%-- 세션 유무 확인 --%>
<%
if (session.getAttribute("userLogin") == null) {
    response.sendRedirect("login.do");
    return;
}
%>


	<h2>회원정보 수정 페이지</h2>
	<div>
		<form method="post" action="myPageModify.do" name ="frm">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="userid" value="${userLogin.userid}" readonly></td>
					
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password" required></td>
				</tr>

				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="checked_password" required></td>
				</tr>

				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${userLogin.name}" readonly></td>
				</tr>

				<tr>
					<th>닉네임</th>
					<td><input type="text" name="nickname" required></td>
				</tr>

				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" required></td>
				</tr>

				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" required></td>
				</tr>

				<tr>
					<th>주소</th>
					<td><input type="text" name="address" required></td>
				</tr>
				
				
				<%-- 회원 고유 번호 (id) --%>
				<tr>
					<td><input type="hidden" name = "id" value="${userLogin.id}" readonly></td>
				</tr>
				
				<tr>
					<td><input type ="submit" value="수  정" onclick="return joinCheck()"></td>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<td><input type ="reset" value="취  소"></td>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<td><input type="button" value="마이페이지 돌아가기" onclick = "location.href='views/member/myPage.jsp'"></td>
					
				</tr>
				<tr>
					<td>
						
					</td>
				</tr>
				
				<tr>
					<td colspan="2">${message}</td>
				</tr>
			</table>
		</form>
	</div>

	
</body>
</html>