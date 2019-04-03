package com.tm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TmDetailDAO {

	@Autowired
	@Resource(name="mysql_sqlSession") private SqlSession sqlsession;

	// 상세페이지 카테고리 SelectBox 대륙목록
	public List<Map<String, Object>> selectSbContinentList(Map<String, Object> map){
		return sqlsession.selectList("tm_detail.select_sb_continentlist", map);
	}
	
	// 상세페이지 카테고리 SelectBox 국가목록
	public List<Map<String, Object>> selectSbCountryList(Map<String, Object> map){
		return sqlsession.selectList("tm_detail.select_sb_countrylist", map);
	}
	
	// 상세페이지 카테고리 SelectBox 리그목록
	public List<Map<String, Object>> selectSbLeagueList(Map<String, Object> map){
		return sqlsession.selectList("tm_detail.select_sb_leaguelist", map);
	}
	
	// 상세페이지 카테고리 SelectBox 클럽목록
	public List<Map<String, Object>> selectSbClubList(Map<String, Object> map){
		return sqlsession.selectList("tm_detail.select_sb_clublist", map);
	}
	
	// 대륙 상세
	public List<Map<String, Object>> selectDetailContinent(Map<String, Object> map){
		return sqlsession.selectList("tm_detail.select_detail_continent", map);
	}
	
	// 리그 상세
	public Map<String, Object> selectDetailLeague(Map<String, Object> map) {
		Map<String, Object> getMap = new HashMap<String, Object>();
		getMap.put("league", sqlsession.selectOne("tm_detail.select_detail_league1", map));
		getMap.put("clubs", sqlsession.selectList("tm_detail.select_detail_league2", map));
		getMap.put("rank", sqlsession.selectList("tm_detail.select_detail_league3", map));
		getMap.put("mv", sqlsession.selectList("tm_detail.select_detail_league4", map));
		getMap.put("goal", sqlsession.selectList("tm_detail.select_detail_league5", map));
		getMap.put("assist", sqlsession.selectList("tm_detail.select_detail_league6", map));
		
		return getMap;
	}
	
	// 클럽 상세
	public Map<String, Object> selectDetailClub(Map<String, Object> map) {
		return sqlsession.selectOne("tm_detail.select_detail_club", map);
	}
	
	// 클럽 상세 선수리스트
	public List<Map<String, Object>> selectDetailClubPlayerList(Map<String, Object> map) {
		return sqlsession.selectList("tm_detail.select_detail_club_playerlist", map);
	}
	
	// 클럽 상세 선수리스트 정렬
	public List<Map<String, Object>> selectRestDetailClubPlayerList(Map<String, Object> map) {
		return sqlsession.selectList("tm_detail.select_rest_detail_club_playerlist", map);
	}
	
	// 클럽 상세 클럽정보
	public Map<String, Object> selectDetailClubInfo(Map<String, Object> map) {
		Map<String, Object> getMap = new HashMap<String, Object>();
		// 감독
		getMap.put("coach", sqlsession.selectOne("tm_detail.select_detail_club_coach", map));
		// 주장
		getMap.put("captain", sqlsession.selectOne("tm_detail.select_detail_club_captain", map));
		// 최다득점자
		getMap.put("mogoal", sqlsession.selectOne("tm_detail.select_detail_club_mogoal", map));
		// 최다도움
		getMap.put("moassist", sqlsession.selectOne("tm_detail.select_detail_club_moassist", map));
		// 최고가치선수
		getMap.put("movalue", sqlsession.selectOne("tm_detail.select_detail_club_movalue", map));
		// 공격포인트 순위
		getMap.put("pointlist", sqlsession.selectList("tm_detail.select_detail_club_pointlist", map));
		
		return getMap;
	}

	// 선수 상세 조회수
	public int updatePlayerHit(Map<String, Object> map) {
		return sqlsession.update("tm_detail.update_player_hit", map);
	}
	
	// 선수 상세
	public Map<String, Object> selectDetailPlayer(Map<String, Object> map){
		return sqlsession.selectOne("tm_detail.select_detail_player", map);
	}
	
	// 감독 상세
	public Map<String, Object> selectDetailCoach(Map<String, Object> map){
		return sqlsession.selectOne("tm_detail.select_detail_coach", map);
	}
	
	// 경기일정 상세
	public Map<String, Object> selectDetailMatch(Map<String, Object> map){
		return sqlsession.selectOne("tm_detail.select_detail_match", map);
	}
	
	// 경기일정 상세 클럽정보
	public Map<String, Object> selectDetailMatchClubsInfo(Map<String, Object> map){
		Map<String, Object> getMap = sqlsession.selectOne("tm_detail.select_detail_match_clubs", map);
		getMap.put("home", getMap.get("match_home"));
		getMap.put("away", getMap.get("match_away"));
		
		// 클럽정보
		getMap.put("club", sqlsession.selectList("tm_detail.select_detail_match_clubs_info", getMap));
		// 감독정보
		getMap.put("coach", sqlsession.selectList("tm_detail.select_detail_match_coachs", getMap));
		// 핵심선수
		getMap.put("player1", sqlsession.selectList("tm_detail.select_detail_match_player1", getMap));
		// 최다득점
		getMap.put("player2", sqlsession.selectList("tm_detail.select_detail_match_player2", getMap));
		// 최다도움
		getMap.put("player3", sqlsession.selectList("tm_detail.select_detail_match_player3", getMap));
		// 최고가치
		getMap.put("player4", sqlsession.selectList("tm_detail.select_detail_match_player4", getMap));
		return getMap;
	}
	
	// 챔스경기일정 상세
	public Map<String, Object> selectDetailChampsMatch(Map<String, Object> map){
		return sqlsession.selectOne("tm_detail.select_detail_champs_match", map);
	}
		
	// 챔스경기일정 상세 클럽정보
	public List<Map<String, Object>> selectDetailChampsMatchClubs(Map<String, Object> map){
		Map<String, Object> getMap = sqlsession.selectOne("tm_detail.select_detail_champs_match_clubs", map);
		getMap.put("home", getMap.get("match_home"));
		getMap.put("away", getMap.get("match_away"));
			
		return sqlsession.selectList("tm_detail.select_detail_champs_match_clubs_info", getMap);
	}
	
}
