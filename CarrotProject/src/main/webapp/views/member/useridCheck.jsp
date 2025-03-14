<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/script/member.js"></script>
<style>
.popup-container {
	width: 400px;
	margin: 20px auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.popup-title {
	text-align: center;
	font-size: 20px;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

td {
	padding: 8px 0;
}

input[type="text"] {
	width: 200px;
	height: 35px;
	padding: 5px 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

input[type="submit"], input[type="button"] {
	width: 100px;
	height: 35px;
	margin-left: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: #f5f5f5;
	cursor: pointer;
}

.message {
	text-align: center;
	margin: 15px 0;
	padding: 10px;
	border-radius: 4px;
}

.message.error {
	color: #dc3545;
}

.message.success {
	color: #28a745;
}

.button-group {
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="popup-container">
		<h2 class="popup-title">아이디 중복 확인</h2>

		<form method="get" name="frm" action="useridCheck.do">
			<table>
				<tr>
					<td><input type="text" name="userid" value="${userid}"
						placeholder="아이디"> <input type="submit" value="중복체크">
					</td>
				</tr>
				<tr>
					<td>
						<div class="message ${result ? 'error' : 'success'}">
							<c:choose>
								<c:when test="${result}">
                                    ${userid}는 이미 사용 중인 아이디입니다.
                                </c:when>
								<c:otherwise>
                                    ${userid}는 사용 가능한 아이디입니다.
                                </c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
				<c:if test="${not result}">
					<tr>
						<td class="button-group"><input type="button" value="사용하기"
							class="cancel" onclick="idok('${userid}')"></td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
</body>
</html>