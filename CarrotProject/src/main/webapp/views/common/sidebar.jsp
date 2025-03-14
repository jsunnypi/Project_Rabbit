<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.sidebar {
    width: 200px;
    height: calc(100vh - 135px); /* 헤더 높이를 뺀 높이 */
    padding: 20px;
    border-right: 1px solid #ddd;
    position: fixed;
    left: 0;
    top: 127px; /* 헤더 높이만큼 아래로 */
    background-color: white;
    overflow-y: auto;
    z-index: 100;
    margin-top: 0;
}

.category-title {
    font-weight: bold;
    margin: 20px 0 10px 0;
}

.filter-item {
    margin: 8px 0;
    display: flex;
    align-items: center;
}

.filter-item input[type="radio"] {
    margin-right: 8px;
}

.price-range {
    margin-top: 10px;
}

.price-range input {
    width: 80px;
    margin: 5px 0;
    padding: 4px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.apply-btn {
    width: 100%;
    padding: 8px;
    margin-top: 8px;
    background-color: #f0f0f0;
    border: 1px solid #ddd;
    border-radius: 4px;
    cursor: pointer;
}

.apply-btn:hover {
    background-color: #e0e0e0;
}
</style>

<div class="sidebar">
    <div class="trading-status">
        <input type="checkbox" id="trading"> 
        <label for="trading">거래 가능</label>
    </div>

    <div class="category-section">
        <div class="category-title">카테고리</div>
        
        <div class="filter-item">
            <input type="radio" name="category" id="all" checked> 
            <label for="all">전체</label>
        </div>
        
        <c:forEach var="mainCategory" items="${mainCategoryList}">
	        <c:choose>
	        	<c:when test="${mainCategory.parentId == 0 && mainCategory.id != 0}">
		        	<div class="filter-item">
		        		<input type="radio" name="category" value="${mainCategory.id}"> 
	            		<label class="mainCategory" for="${mainCategory.id}">${mainCategory.name}</label>
	            		<!--
	            		<c:forEach var="Subcategory" items="${categoryList}">
	            			<c:choose>
	            				<c:when test="${mainCategory.id == Subcategory.parentId}">
	            					<div class="filter-item">
	            						
							            <input type="radio" name="category" value="${Subcategory.id}"> 
							            <label for="${Subcategory.id}">${Subcategory.name}, ${mainCategory.id}, ${Subcategory.parentId}</label>
							        </div>
	            				</c:when>
	            			</c:choose>
	            		</c:forEach>
	            		-->
	            	</div>
	        	</c:when>
	        </c:choose>
        </c:forEach>
    </div>

    <div class="sort-section">
        <div class="category-title">정렬</div>
        <div class="filter-item">
            <input type="radio" name="sort" id="latest" checked> 
            <label for="latest">최신순</label>
        </div>
        <div class="filter-item">
            <input type="radio" name="sort" id="popular"> 
            <label for="popular">인기순</label>
        </div>
    </div>

    <div class="price-section">
        <div class="category-title">가격</div>
        <div class="filter-item">
            <input type="radio" name="price" id="free"> 
            <label for="free">나눔</label>
        </div>
        <div class="filter-item">
            <input type="radio" name="price" id="under5000"> 
            <label for="under5000">5,000원 이하</label>
        </div>
        <div class="filter-item">
            <input type="radio" name="price" id="under10000"> 
            <label for="under10000">10,000원 이하</label>
        </div>
        <div class="filter-item">
            <input type="radio" name="price" id="under20000"> 
            <label for="under20000">20,000원 이하</label>
        </div>
        
        <div class="price-range">
            <input type="text" placeholder="최소가격">
            <br>     ~
            <input type="text" placeholder="최대가격">
            <button type="button" class="apply-btn">적용하기</button>
        </div>
    </div>
</div>
