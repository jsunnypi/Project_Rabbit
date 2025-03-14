package com.carrot.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.carrot.vo.FavoriteVO;

public class FavoritesDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private FavoritesDAO() {
		conn = null;
		pstmt = null;
		rs = null;
	}

	private static FavoritesDAO instance = new FavoritesDAO();

	public static FavoritesDAO getInstance() {
		return instance;
	}

	// 관심 상품 추가: 회원이 관심 있는 상품을 관심 목록에 추가
	public int insertFavorite(FavoriteVO favoriteVO) {
		return 0;
	}

	// 관심 상품 삭제: 관심 목록에서 특정 상품 제거
	public int deleteFavorite(int memberId, int productId) {
		return 0;
	}

	// 관심 상품 목록 조회: 특정 회원의 관심 상품 목록 조회
	public List<FavoriteVO> getFavoritesByMemberId(int memberId) {
		return new ArrayList<>();
	}

	// 관심 상품 체크: 특정 상품이 관심 목록에 있는지 확인
	public boolean checkFavorite(int memberId, int productId) {
		return false;
	}

	// 상품별 관심 수 조회: 특정 상품의 관심 등록 수 조회
	public int getFavoriteCount(int productId) {
		return 0;
	}
}
