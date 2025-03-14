package com.carrot.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.carrot.vo.CarrotVO;

public class CarrotsDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private CarrotsDAO() {
		conn = null;
		pstmt = null;
		rs = null;
	}

	private static CarrotsDAO instance = new CarrotsDAO();

	public static CarrotsDAO getInstance() {
		return instance;
	}

	// 당근 정보 추가: 회원의 당근 정보를 새로 생성하거나 업데이트
	public int insertOrUpdateCarrots(CarrotVO carrotVO) {
		return 0;
	}

	// 당근 정보 조회: 특정 회원의 당근 정보 조회
	public CarrotVO getCarrotsByMemberId(int memberId) {
		return new CarrotVO();
	}

	// 황금 당근 추가: 회원의 황금 당근 수량 증가
	public int addGoldenCarrots(int memberId, int amount) {
		return 0;
	}

	// 황금 당근 사용: 회원의 황금 당근 수량 감소
	public int useGoldenCarrots(int memberId, int amount) {
		return 0;
	}

	// 썩은 당근 사용: 회원의 썩은 당근 수량 감소
	public int useRottenCarrots(int memberId, int amount) {
		return 0;
	}

	// 전체 당근 순위 조회: 황금 당근 기준으로 회원들의 순위 조회
	public List<CarrotVO> getCarrotsRanking() {
		return new ArrayList<>();
	}
}
