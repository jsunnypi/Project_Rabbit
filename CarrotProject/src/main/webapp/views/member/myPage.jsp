<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
.product-container {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.product-item {
	width: calc(33.33% - 20px);
	border: 1px solid #ddd;
	padding: 10px;
	box-sizing: border-box;
}

.product-item img {
	width: 100%;
	height: auto;
}

.header-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.profile-edit-btn {
	padding: 8px 16px;
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: #fff;
	cursor: pointer;
}
</style>

</head>
<body>
	<%--헤더 --%>
	<%@ include file="../common/header.jsp"%>


	<%--세션 유무 확인 --%>
	<%
	if (session.getAttribute("userLogin") == null) {
		response.sendRedirect("main.do");
		return;
	}
	%>
	<form method="post" action="myPage.do">


		<div class="header-container">
			<h2>${userLogin.nickname}님의마이페이지</h2>
			<input type="submit" value="프로필 수정하기" class="profile-edit-btn">
		</div>

		<hr>
		<div class="header-container">
			<h2>찜목록</h2>
			<input type="button" class="profile-edit-btn"
				onclick="location.href='현재 로그인한 사용자의 모든 찜목록 보여주는 페이지'"
				value="찜목록 더보기">
		</div>
		<div class="product-container">
			<c:forEach items="${favoriteProductList}" var="favoriteProduct" begin="0" end="2">
				<div class="product-item">
					<img src="${favoriteProduct.photoUrl}" alt="${favoriteProduct.title}">
					<p>판매글 제목 : ${favoriteProduct.title}</p>
					<p>판매여부: ${favoriteProduct.isSold ? '판매완료' : '판매 중'}</p>
					<p>가격: ${favoriteProduct.price}원</p>
					<p>
						<fmt:formatDate value="${favoriteProduct.createdAt}" pattern="yyyy.MM.dd" />
					</p>
				</div>
			</c:forEach>
		</div>

		<hr>
		<h2>구매목록</h2>



		<hr>
		<div class="header-container">
			<h2>판매목록</h2>
			<input type="button" class="profile-edit-btn"
				onclick="location.href='salesList.do?id=${userLogin.id}'"
				value="판매목록 더보기">
		</div>
		<div class="product-container">
			<c:forEach items="${productList}" var="product" begin="0" end="2">
				<div class="product-item">
					<img src="${product.photoUrl}" alt="${product.title}">
					<p>판매글 제목 : ${product.title}</p>
					<p>판매여부: ${product.isSold ? '판매완료' : '판매 중'}</p>
					<p>가격: ${product.price}원</p>
					<p>
						<fmt:formatDate value="${product.createdAt}" pattern="yyyy.MM.dd" />
					</p>
				</div>
			</c:forEach>
		</div>


	</form>

</body>
</html>