<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<style>
.container {
	width: 800px;
	margin: 200px auto;
	padding: 20px;
}

.category-select {
	margin-bottom: 15px;
}

.image-container {
	width: 300px;
	height: 300px;
	border: 1px solid #ddd;
	margin-bottom: 10px;
}

.form-group {
	margin-bottom: 15px;
}

.form-row {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.form-row label {
	width: 80px;
}

.input-field {
	width: 400px;
}

textarea {
	width: 400px;
	height: 150px;
	resize: none;
	white-space: nowrap;
}

.button-group {
	text-align: right;
	margin-top: 20px;
}

.button-group button {
	padding: 5px 20px;
	margin-left: 10px;
}

.content-wrapper {
	display: flex;
	gap: 20px;
}

.right-content {
	flex: 1;
}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<div class="container">
		<form action="detailedPage.do" method="post" enctype="multipart/form-data">
			<div class="category-select">
				<select name="mainCategory">
					<option value="">대카테고리</option>
					<option value="1">전자제품</option>
					<option value="2">가전제품</option>
					<option value="3">의류</option>
					<option value="4">도서</option>
					<option value="5">문구류</option>
					
				</select> / <select name="subCategory">
					<option value="">소카테고리</option>
					<option value="6">노트북</option>
					<option value="7">태블릿</option>
					<option value="8">스마트폰</option>
					<option value="9">카메라</option>
					<option value="10">게임기</option>
					<option value="11">TV</option>
					<option value="12">세탁기</option>
					<option value="13">냉장고</option>
					<option value="14">청소기</option>
					<option value="15">에어컨</option>
					<option value="16">히터</option>
					<option value="17">믹서기</option>
					<option value="18">셔츠</option>
					<option value="19">바지</option>
					<option value="20">코트</option>
					<option value="21">드레스</option>
					<option value="22">운동복</option>
					<option value="23">신발</option>
					<option value="24">소설</option>
					<option value="25">역사</option>
					<option value="26">과학</option>
					<option value="27">요리</option>
					<option value="28">여행</option>
					<option value="29">예술</option>
					<option value="30">노트</option>
					<option value="31">펜</option>
					<option value="32">파일</option>
					<option value="33">스티커</option>
					<option value="34">테이프</option>
					<option value="35">가위</option>

				</select>
			</div>

			<div class="content-wrapper">
				<div class="left-content">
					<div class="image-container">
						<img id="preview" src="#" alt="상품 이미지"
							style="max-width: 100%; max-height: 100%;">
					</div>
					<input type="file" name="productImage"
						onchange="previewImage(this)">
				</div>

				<div class="right-content">
					<div class="form-row">
						<label>제목</label> <input type="text" name="title"
							class="input-field">
					</div>
					<div class="form-row">
						<label>가격</label> <input type="text" name="price"
							class="input-field"> 원
					</div>
					<div class="form-row">
						<input type="checkbox" name="freeDelivery" id="freeDelivery">
						<label for="freeDelivery">무료 나눔</label>
					</div>
					<div class="form-row">
						<label>상세 설명</label>
						<textarea name="description"></textarea>
					</div>
				</div>
			</div>

			<div class="button-group">
				<button type="submit">올리기</button>
				<button type="button" onclick="history.back()">돌아가기</button>
			</div>
		</form>
	</div>
</body>
</html>