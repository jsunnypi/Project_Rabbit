package com.carrot.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.carrot.util.DBManager;
import com.carrot.vo.MemberVO;
import com.carrot.vo.ProductVO;

public class MembersDAO {
   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;

   private MembersDAO() {
      conn = null;
      pstmt = null;
      rs = null;
   }

   private static MembersDAO instance = new MembersDAO();

   public static MembersDAO getInstance() {
      return instance;
   }

   // 회원가입: 회원 정보를 받아 데이터베이스에 저장
   public int insertMember(MemberVO member) {
       String sql = "insert into members (id, userid, nickname, name, password, phone, email, address) values (seq_members_id.nextval, ?, ?, ?, ?, ?, ?, ?)";
       Connection conn = null;
       PreparedStatement pstmt = null;
       int result = -1;

       try {
           conn = DBManager.getConnection();   
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, member.getUserid());
           pstmt.setString(2, member.getNickname());
           pstmt.setString(3, member.getName());
           pstmt.setString(4, member.getPassword());
           pstmt.setString(5, member.getPhone());
           pstmt.setString(6, member.getEmail());
           pstmt.setString(7, member.getAddress());

           result = pstmt.executeUpdate();
       } catch(Exception e) {
           e.printStackTrace();
       } finally {
           try {
               DBManager.close(conn, pstmt);
           } catch(Exception e) {
               e.printStackTrace();
           }
       }
       return result; // 삽입 결과 반환
   }

   // 로그인: 아이디와 비밀번호를 받아 일치하는 회원 정보 반환
   public MemberVO loginMember(String userid, String password) {
      return new MemberVO();
   }

   // 회원정보 수정: 변경된 회원 정보를 받아 데이터베이스 업데이트
   public int updateMember(MemberVO member) {
      int result = -1;
      String sql = "update members set userid=?, password=?,name=?,nickname=?,phone=?,email=?,address=? where id=?";
      Connection conn= null;
      PreparedStatement pstmt =null;
      
      
      try {
         conn=DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, member.getUserid());
         pstmt.setString(2, member.getPassword());
         pstmt.setString(3, member.getName());
         pstmt.setString(4, member.getNickname());
         pstmt.setString(5, member.getPhone());
         pstmt.setString(6, member.getEmail());
         pstmt.setString(7, member.getAddress());
         pstmt.setInt(8, member.getId());    // id 값 설정 추가
          
         result = pstmt.executeUpdate();
         
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         DBManager.close(conn, pstmt);
      }
      
      return result;
   }

   // 회원 조회: 회원 ID로 회원 정보 조회
   public MemberVO getMemberById(int membersid) {
      String sql = "select * from members where id=?";
      Connection conn = null;
      PreparedStatement pstmtPreparedStatement = null;
      ResultSet rs = null;
      MemberVO mvo = null;
      try {

         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, membersid);
         rs = pstmt.executeQuery();
         
         mvo.setId(rs.getInt("id"));
         mvo.setUserid(rs.getString("userid"));
         mvo.setNickname(rs.getString("nickname"));   
         mvo.setName(rs.getString("name"));
         mvo.setPassword(rs.getString("password"));
         mvo.setPhone(rs.getString("phone"));
         mvo.setEmail(rs.getString("email"));
         mvo.setAddress(rs.getString("address"));
         
         
         
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         DBManager.close(conn, pstmt, rs);
      }
      return mvo;
   }

   // 회원 조회: 회원 userid로 회원 정보 조회
      public MemberVO getMemberByUserid(String userid) {
         String sql = "select * from members where userid=?";
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         MemberVO mvo = null;
         try {

            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {   
               mvo = new MemberVO(); 
            mvo.setId(rs.getInt("id"));
            mvo.setUserid(rs.getString("userid"));
            mvo.setNickname(rs.getString("nickname"));   
            mvo.setName(rs.getString("name"));
            mvo.setPassword(rs.getString("password"));
            mvo.setPhone(rs.getString("phone"));
            mvo.setEmail(rs.getString("email"));
            mvo.setAddress(rs.getString("address"));
            }
            
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            DBManager.close(conn, pstmt, rs);
         }
         return mvo;
      }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   // 회원 삭제: 회원 ID를 받아 해당 회원 정보 삭제
   public int deleteMember(int membersid) {
      return 0;
   }

   // 아이디 중복 체크: 회원가입 시 아이디 중복 확인
   public int checkDuplicateId(String userid) {
      int result = 1;
      String sql = "select * from Members where userid=?";
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userid);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            // 아이디 중복하지 않아 사용 가능한 경우
            result = 1;
         } else {
            // 아이디 중복하여 사용하지 못하는 경우
            result = -1;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         DBManager.close(conn, pstmt, rs);
      }
      return result;
   }

   // 내 판매 목록 조회: 회원의 판매 상품 목록 조회
   public List<ProductVO> getMySalesList(int membersid) {
      return new ArrayList<>();
   }

   // 내 구매 목록 조회: 회원의 구매 상품 목록 조회
   public List<ProductVO> getMyPurchaseList(int membersid) {
      return new ArrayList<>();
   }

   // 내 관심 목록 조회: 회원의 관심 상품 목록 조회
   public List<ProductVO> getMyFavoriteList(int membersid) {
      return new ArrayList<>();
   }
}
