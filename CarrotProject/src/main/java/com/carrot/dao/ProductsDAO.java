package com.carrot.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.carrot.util.DBManager;
import com.carrot.vo.ProductVO;

public class ProductsDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private ProductsDAO() {
		conn = null;
		pstmt = null;
		rs = null;
	}

	private static ProductsDAO instance = new ProductsDAO();

	public static ProductsDAO getInstance() {
		return instance;
	}
	
	
	// 상품 등록: 새로운 상품 정보를 데이터베이스에 저장
	public int insertProduct(ProductVO productVO) {
				
		String sql = "INSERT INTO Products (id, author_id, title, description, photo_url, price, category) " +
	            "VALUES (seq_products_id.NEXTVAL, ?, ?, ?, ?, ?, ?)";

		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productVO.getAuthorId());
			pstmt.setString(2, productVO.getTitle());
			pstmt.setString(3, productVO.getDescription());
			pstmt.setString(4, productVO.getPhotoUrl());
			pstmt.setDouble(5, productVO.getPrice());
			pstmt.setInt(6, productVO.getCategory());
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {

			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

		return result;

	}

	// 상품 상세 조회: 상품 ID로 상품 정보 조회
	public ProductVO getProductById(int productId) {
		
		String sql = "SELECT * FROM Products WHERE id=?";
		ProductVO pvo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pvo = new ProductVO();
				pvo.setId(rs.getInt("id"));
				pvo.setAuthorId(rs.getInt("authorId"));
				pvo.setTitle(rs.getString("title"));
				pvo.setCategory(rs.getInt("category"));
				pvo.setPrice(rs.getDouble("price"));
				pvo.setPhotoUrl(rs.getString("photoUrl"));
				pvo.setDescription(rs.getString("description"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return pvo;
		
	}
	
	

	// 상품 정보 수정: 변경된 상품 정보를 데이터베이스에 업데이트
	public int updateProduct(ProductVO productVO) {
		String sql = "UPDATE Products SET title=?, description=?, photo_url=?, price=?, category=? WHERE id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productVO.getTitle());
			pstmt.setString(2, productVO.getDescription());
			pstmt.setString(3, productVO.getPhotoUrl());
			pstmt.setDouble(4, productVO.getPrice());
			pstmt.setInt(5, productVO.getCategory());
			pstmt.setInt(6, productVO.getId());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
			
		}
		return result;
	}

	// 상품 삭제: 상품 ID로 해당 상품 정보 삭제
	public int deleteProduct(int productId) {
		String sql = "delete from products where id=?";
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productId);
			result = pstmt.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
						
		return result;
	}

	// 상품 목록 조회: 전체 상품 목록을 조회
	public List<ProductVO> getAllProducts() {
		
		String sql = "SELECT * FROM Products ORDER BY created_at DESC";
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO pvo = new ProductVO();
				pvo.setId(rs.getInt("id"));
				pvo.setAuthorId(rs.getInt("authorId"));
				pvo.setTitle(rs.getString("title"));
				pvo.setDescription(rs.getString("description"));
				pvo.setPhotoUrl(rs.getString("photoUrl"));
				pvo.setPrice(rs.getDouble("price"));		
				pvo.setCategory(rs.getInt("category"));				
				/*
				 * pvo.setViews(rs.getInt("views")); pvo.setSold(rs.getBoolean("isSold"));
				 * pvo.setHidden(rs.getBoolean("isHidden"));
				 * pvo.setCreatedAt(rs.getDate("createdAt"));
				 * pvo.setBumpCount(rs.getInt("bumpCount"));
				 */
				list.add(pvo);
			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
			return list;
		}
	
	

	// 카테고리별 상품 조회: 특정 카테고리의 상품 목록 조회
	public List<ProductVO> getProductsByCategory(int categoryId) {
		return new ArrayList<>();
	}

	// 조회수 증가: 상품 상세 페이지 조회 시 조회수 증가
	public void increaseViews(int productId) {
	}

	// 상품 판매 상태 변경: 판매중/판매완료 상태 변경
	public int updateProductStatus(int productId, boolean isSold) {
		return 0;
	}

	// 상품 숨김 처리: 상품 숨김 상태 변경
	public int updateProductHidden(int productId, boolean isHidden) {
		return 0;
	}

	// 상품 끌올하기: 상품의 마지막 끌올 시간과 횟수 업데이트
	public int bumpProduct(int productId) {
		return 0;
	}

}
















