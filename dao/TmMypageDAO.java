package com.tm.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TmMypageDAO {

	@Autowired
	@Resource(name="mysql_sqlSession") private SqlSession sqlsession;

	// 마이페이지 비밀번호 변경 로그인
	public int updateMemberPwLogin(Map<String, Object> map) {
		return sqlsession.selectOne("tm_mypage.select_member_login", map);
	}
	
	// 마이페이지 비밀번호 변경
	public int updateMemberPw(Map<String, Object> map) {
		return sqlsession.update("tm_mypage.update_member_pw", map);
	}
	
	// 마이페이지 회원정보 변경 회원정보 불러오기
	public Map<String, Object> selectMypageMember(Map<String, Object> map) {
		return sqlsession.selectOne("tm_mypage.select_mypage_member", map);
	}
	
	// 마이페이지 회원정보 변경
	public int updateMypageMember(Map<String, Object> map) {
		return sqlsession.update("tm_mypage.update_mypage_member", map);
	}
	
	// 마이페이지 회원탈퇴
	public int deleteMember(Map<String, Object> map) {
		return sqlsession.update("tm_mypage.delete_member", map);
	}
}
