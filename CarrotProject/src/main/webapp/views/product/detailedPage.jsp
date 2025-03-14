<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<%@ include file="/views/common/header.jsp"%>
		<h1>상품 상세 페이지</h1>
		<form method="post">
			<table>
				<tr>
					<th>카테고리</th>
					<td colspan="5">${product.category}</td>
					<td>
						<!-- 로그인했을때 -->
						<input type="button" value="글 수정하기"
						onclick="location.href='writeModify.do'">
					</td>
				</tr>



				<tr>
					<td colspan="5">
						<c:choose>
							<c:when test="${product.photoUrl!=null}">
								<img
									src="photo/product/apple.jpg">
							</c:when>

							<c:otherwise>
								<img
									src="${request.getContextPath()}/photo/product/${product.photoUrl}">
							</c:otherwise>
						</c:choose>
					</td>

					<td>

						<table>
							<tr>
								<td>${product.title}</td>
							</tr>
							<tr>
								<td>${product.price}원</td>
							</tr>
							<tr>
								<td>${product.description}</td>
							</tr>
							<tr>
								<td><input type="button" value="메시지 보내기"></td>
								<td><input type="button" value="구매하기"
									onclick="location.href='purchase.do?id=${product.id}'"></td>
							</tr>
						</table>

					</td>

				</tr>

				<tr>
					<td colspan="2">판매자: ${product.authorId}님</td> &nbsp;&nbsp;
					<td>수집한 당근 : 개</td>
				</tr>

			</table>



			판매자의 다른 판매 물품 목록&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
				value="더 구경하기" onclick="location.href='salesList.do'">
			<!--  <input type="button" value="더 구경하기" onclick="location.href='salesList?authorId=${product.authorId}'">-->


			<c:forEach var="product" items="${salesList}">
				<div>${product.title}</div>
				<div>${product.price}</div>
				<div>${product.photoUrl}</div>
			</c:forEach>




		</form>
	</div>

</body>
</html>