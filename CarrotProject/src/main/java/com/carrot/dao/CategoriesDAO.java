package com.carrot.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.carrot.vo.CategoryVO;

public class CategoriesDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private CategoriesDAO() {
		conn = null;
		pstmt = null;
		rs = null;
	}

	private static CategoriesDAO instance = new CategoriesDAO();

	public static CategoriesDAO getInstance() {
		return instance;
	}

	// 카테고리 추가: 새로운 카테고리를 데이터베이스에 저장
	public int insertCategory(CategoryVO categoryVO) {
		return 0;
	}

	// 카테고리 조회: 특정 카테고리 정보 조회
	public CategoryVO getCategoryById(int categoryId) {
		return new CategoryVO();
	}

	// 전체 카테고리 목록 조회
	public List<CategoryVO> getAllCategories() {
		return new ArrayList<>();
	}

	// 상위 카테고리 목록 조회: 최상위 카테고리만 조회
	public List<CategoryVO> getParentCategories() {
		return new ArrayList<>();
	}

	// 하위 카테고리 목록 조회: 특정 카테고리의 하위 카테고리 조회
	public List<CategoryVO> getSubCategories(int parentId) {
		return new ArrayList<>();
	}

	// 카테고리 수정: 카테고리 정보 업데이트
	public int updateCategory(CategoryVO categoryVO) {
		return 0;
	}

	// 카테고리 삭제: 특정 카테고리 삭제 (하위 카테고리가 없는 경우에만 가능)
	public int deleteCategory(int categoryId) {
		return 0;
	}
	
	// 카테고리 삭제: 특정 카테고리와 모든 하위 카테고리를 삭제
    public int deleteCategoryWithSubCategories(int categoryId) {
        return 0;
    }
}
