<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>상품 수정 페이지</h1>
<form method="post" enctype="multipart/form-data" name="frm">
<table>
	<tr>
		<td> 제 목 </td>
		<td><input type="text" name="title" value="${product.title}"></td>
	</tr>
	<tr>
		<td> 물품 카테고리 </td>
		<td>
			<select name="category" value="${product.category}">
				<option value="1">생활 가전</option>
				<option value="2">가구 인테리어</option>
				<option value="3">디지털 기기</option>
				<option value="4">생활/주방</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td> 가 격 </td>
		<td> <input type="text" name="price" value="${product.price}">원</td>
		<td> 나눔 </td>
		<td><input type="checkbox" name="price" value="1"></td>
	</tr>
	
	<tr>
		<td> 사 진 </td>
		<td><input type="file" name="photoUrl" value="${product.photoUrl}"></td>
	</tr>
	
	<tr>
		<td> 설 명 </td>
		<td>
			<textarea name="description" rows="10" cols="80" >${product.description}</textarea>
		</td>
	</tr>
</table>
<br>

<input type="submit" value="수정" onclick="return productCheck()">
<input type="reset" value="취소">
<input type="button" value="목록" onclick="location.href='salesList.do'">
</form>
</body>
</html>