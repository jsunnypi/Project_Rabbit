<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
<%@ include file="/views/common/header.jsp"%>
<div align="center">
<h1>상품 삭제</h1>
<form method="post">

	<input type="submit" value="삭제">
	<input type="button" value="목록보기" onclick="location.href='salesList.do'">

</form>
</div>

</body>
</html>