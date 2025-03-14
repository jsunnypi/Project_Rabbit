package com.carrot.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.carrot.vo.ProductVO;

public class SearchDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private SearchDAO() {
		conn = null;
		pstmt = null;
		rs = null;
	}

	private static SearchDAO instance = new SearchDAO();

	public static SearchDAO getInstance() {
		return instance;
	}

	// 기본 최신순 전체 상품 검색
	public List<ProductVO> getAllProductsByLatest() {
		return new ArrayList<>();
	}

	// 거래가능한 상품만 최신순 검색 (판매완료 제외)
	public List<ProductVO> getAvailableProductsByLatest() {
		return new ArrayList<>();
	}

	// 카테고리별 상품 검색 (상위/하위 카테고리 구분하여 검색)
	public List<ProductVO> searchProductsByCategory(int categoryId, boolean isParentCategory) {
		return new ArrayList<>();
	}

	// 정렬 기준별 검색 (최신순, 인기순(조회수))
	public List<ProductVO> getProductsSortedBy(String sortType) {
		// "latest" or "popular"
		return new ArrayList<>();
	}

	// 가격대별 상품 검색
	public List<ProductVO> searchProductsByPriceRange(String priceRange) {
		// priceRange: "free"(무료나눔), "under5000", "under10000", "under20000"
		return new ArrayList<>();
	}

	// 특정 가격 범위 검색
	public List<ProductVO> searchProductsByCustomPriceRange(int minPrice, int maxPrice) {
		return new ArrayList<>();
	}

	// 복합 검색 (카테고리 + 가격 + 정렬기준)
	public List<ProductVO> searchProductsByMultipleConditions(
			Integer categoryId,
			boolean isParentCategory,
			String priceRange,
			String sortType,
			boolean availableOnly) {
		return new ArrayList<>();
	}

	// 키워드로 검색 (제목, 내용 포함)
	public List<ProductVO> searchProductsByKeyword(String keyword, String sortType, boolean availableOnly) {
		return new ArrayList<>();
	}
}
