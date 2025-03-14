<%@page import="com.carrot.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.header {
    border-bottom: 1px solid #000;
    padding: 10px 20px;
    position: fixed;
    width: 100%;
    background-color: white;
    top: 0;
    left: 0;
    right: 0;
}

.logo-section {
    display: flex;
    align-items: center;
    gap: 20px;
    width: 98%;
}

.logo {
    font-size: 24px;
    font-weight: bold;
    margin: 0;
}

.logo img {
    height: 100px;
    width: auto;
}

.nav-menu {
    display: flex;
    gap: 10px;
    margin-left: auto;
}

.menu-item {
    text-decoration: none;
    color: #333;
    padding: 5px 10px;
    background-color: #f0f0f0;
    border-radius: 4px;
    min-width: 80px;
    text-align: center;
    height: 24px;
}
</style>
</head>
<body>
<!-- header.jsp -->
<%
    MemberVO memberVO = (MemberVO)session.getAttribute("userLogin");

%>

<div class="header">
    <div class="logo-section">
        <a class="logo" href="${pageContext.request.contextPath}/main.do">
        	<img src="${pageContext.request.contextPath}/photo/web/logo.png">
        </a>
        <div class="nav-menu">
        	<c:choose>
        		<c:when test="${empty userLogin}">
        			<a href="${pageContext.request.contextPath}/login.do" class="menu-item">로그인</a>
                	<a href="${pageContext.request.contextPath}/join.do" class="menu-item">회원가입</a>
        		</c:when>
        		<c:otherwise>
	        		<p>${userLogin.nickname}님, 안녕하세요.</p>
        			<a href="${pageContext.request.contextPath}/write.do" class="menu-item">글쓰기</a>
                	<a href="${pageContext.request.contextPath}/myPage.do" class="menu-item">마이페이지</a>
                	<a href="${pageContext.request.contextPath}/logout.do" class="menu-item">로그아웃</a>
        		</c:otherwise>
        	</c:choose>
        </div>
    </div>
</div>

</body>
</html>