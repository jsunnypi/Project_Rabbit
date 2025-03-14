<%@page import="javax.print.DocFlavor.STRING"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토끼마켓</title>
<style>
.container {
	display: flex;
	padding-top: 150px;
}

.content {
	margin: 0 auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: flex-start;
	gap: 20px;
	padding: 20px;
}

.search-container {
	width: 100%;
	margin: 20px 0;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
}

.search-box {
	width: 60%;
	padding: 12px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.search-button {
	padding: 12px 24px;
	font-size: 16px;
	background-color: #f0f0f0;
	border: 1px solid #ddd;
	border-radius: 4px;
	cursor: pointer;
}

.products-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 50px;
	padding: 20px;
	width: 100%;
}

.product-card {
	min-width: 200px;
	width: 100%;
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 20px;
	text-align: center;
	min-height: 250px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.product-image {
	min-width: 200px;
	height: 150px;
	object-fit: cover;
	margin-bottom: 15px;
	border-radius: 4px;
}

.product-title {
	font-size: 18px;
	margin: 10px 0;
}

.product-price {
	font-size: 16px;
	font-weight: bold;
	color: #333;
}

a {
	text-decoration: none;
	color: inherit;
	cursor: pointer;
	border: none;
	padding: 0;
	margin: 0;
	background: none;
	outline: none;
}

/* 방문한 링크 스타일 초기화 */
a:visited {
	color: inherit;
}

/* 호버 상태 스타일 초기화 */
a:hover {
	text-decoration: none;
	color: inherit;
}

/* 클릭 상태 스타일 초기화 */
a:active {
	color: inherit;
}
</style>
</head>
<body>
	
	<%
		request.setAttribute("categoryList",
		request.getAttribute("categoryList"));
	%>
	<c:choose>
		<c:when test="${not empty message}">
			<script>
				alert("${message}");
			</script>
			<%
			session.setAttribute("message", null);
			%>
		</c:when>
	</c:choose>




	<%@ include file="/views/common/header.jsp"%>
	<%@ include file="/views/common/sidebar.jsp"%>
	<div class="container">
		<div class="content">
			<div class="search-container">
				<input type="text" class="search-box" placeholder="검색어를 입력하세요">
				<button class="search-button">검색</button>
			</div>
			<div class="products-grid">
				<!-- 상품 카드 반복 -->
				<c:forEach var="product" items="${productList}">
					<a href="/detailedPage.do?id=${product.id}">
						<div class="product-card">
							<c:choose>
								<c:when test="${not empty product.photoUrl}">
									<img src="${pageContext.request.contextPath}/photo/product/noimg.gif"
										alt="기본 이미지" class="product-image">
								</c:when>
								<c:otherwise>
									<img src="${product.photoUrl}" alt="상품 이미지"
										class="product-image">
								</c:otherwise>
							</c:choose>

							<h3 class="product-title">${product.title}</h3>
							<p class="product-price">
								<fmt:formatNumber value="${product.price}" pattern="#,###"/> 원
							</p>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>