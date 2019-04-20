package com.tm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TmMainDAO {

	@Autowired
	@Resource(name="mysql_sqlSession") private SqlSession sqlSession;

	// 메인페이지 시즌기록(득점/도움), 시장가치
	public Map<String, Object> selectPlayer(Map<String, Object> map) {
		Map<String, Object> getMap = new HashMap<String, Object>();
		// 시즌기록(득점)
		getMap.put("goal", sqlSession.selectList("tm_main.select_player_goal"));
		// 시즌기록(도움)
		getMap.put("assist", sqlSession.selectList("tm_main.select_player_assist"));
		// 시장가치
		getMap.put("mv", sqlSession.selectList("tm_main.select_player_mv"));
		// 많이검색된선수
		getMap.put("hit", sqlSession.selectList("tm_main.select_player_hit"));
		
		return getMap;
	}
	
	// 로그인
	public int selectMember(Map<String, Object> map) {
		return sqlSession.selectOne("tm_main.select_member", map);
	}
	
	// 회원가입
	public int insertMember(Map<String, Object> map) {
		return sqlSession.insert("tm_main.insert_member", map);
	}
	
	// 아이디 찾기
	public Map<String, Object> selectFindMember(Map<String, Object> map) {
		return sqlSession.selectOne("tm_main.select_find_member", map);
	}
	
	// 메인페이지 카드 카테고리
	public List<Map<String, Object>> selectMainCardCategory(){
		return sqlSession.selectList("tm_main.select_main_card_category");
	}
	
	// 메인페이지 Greece 경기일정
	public List<Map<String, Object>> selectGreeceSchedule(){
		return sqlSession.selectList("tm_main.select_greece_schedule");
	}
	
	// 메인페이지 EPL 경기일정
	public List<Map<String, Object>> selectEPLSchedule(){
		return sqlSession.selectList("tm_main.select_epl_schedule");
	}
	
	// 메인페이지 라리가 경기일정
	public List<Map<String, Object>> selectLaligaSchedule(){
		return sqlSession.selectList("tm_main.select_laliga_schedule");
	}
	
	// 메인페이지 세리에 경기일정
	public List<Map<String, Object>> selectSeriaSchedule(){
		return sqlSession.selectList("tm_main.select_seria_schedule");
	}
	
	// 메인페이지 챔피언스리그 경기일정
	public List<Map<String, Object>> selectChampsSchedule(Map<String, Object> map){
		return sqlSession.selectList("tm_main.select_champs_schedule", map);
	}
	
	// 메인페이지 EPL 리스트
	public List<Map<String, Object>> selectEPLClubList(){
		return sqlSession.selectList("tm_main.select_epl_clublist");
	}

	// 메인페이지 라리가 리스트
	public List<Map<String, Object>> selectLaligaClubList(){
		return sqlSession.selectList("tm_main.select_laliga_clublist");
	}
	
	// 메인페이지 세리에 리스트
	public List<Map<String, Object>> selectSeriaAClubList(){
		return sqlSession.selectList("tm_main.select_seria_clublist");
	}
	
	// 메인페이지 챔피언스리그 리스트
	public List<Map<String, Object>> selectChampsClubList(Map<String, Object> map){
		return sqlSession.selectList("tm_main.select_champs_clublist", map);
	}
	
	// 정보수정 선수
	public  List<Map<String, Object>> selectPlayerList() {
		return sqlSession.selectList("tm_main.select_player_list");
	}

	// 정보수정 클럽
	public  List<Map<String, Object>> selectClubList() {
		return sqlSession.selectList("tm_main.select_player_club");
	}
}
