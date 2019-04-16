package com.tm.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TmImgDAO {

	@Autowired
	@Resource(name="mysql_sqlSession") private SqlSession sqlsession;
	
	// 대륙 이미지
	public Map<String, Object> selectContinentImg(Map<String, Object> map){
		return sqlsession.selectOne("tm_img.select_continent_img", map);
	}
	
	// 국가 이미지
	public Map<String, Object> selectCountryImg(Map<String, Object> map){
		return sqlsession.selectOne("tm_img.select_country_img", map);
	}
		
	// 리그 이미지
	public Map<String, Object> selectLeagueImg(Map<String, Object> map){
		return sqlsession.selectOne("tm_img.select_league_img", map);
	}
	
	// 클럽 이미지
	public Map<String, Object> selectClubImg(Map<String, Object> map){
		return sqlsession.selectOne("tm_img.select_club_img", map);
	}	
	
	// 선수 이미지
	public Map<String, Object> selectPlayerImg(Map<String, Object> map){
		return sqlsession.selectOne("tm_img.select_player_img", map);
	}
	
	// 감독 이미지
	public Map<String, Object> selectCoachImg(Map<String, Object> map){
		return sqlsession.selectOne("tm_img.select_coach_img", map);
	}
	
	// 포지션 이미지
	public Map<String, Object> selectPositionImg(Map<String, Object> map){
		return sqlsession.selectOne("tm_img.select_position_img", map);
	}
	
	// 포메이션 이미지
	public Map<String, Object> selectFormationImg(Map<String, Object> map){
		return sqlsession.selectOne("tm_img.select_formation_img", map);
	}
	
	// 팀 이미지
	public Map<String, Object> selectTeamImg(Map<String, Object> map) {
		return sqlsession.selectOne("tm_img.select_team_img", map);
	}
	
	// 회원 이미지
	public Map<String, Object> selectMemberImg(Map<String, Object> map) {
		return sqlsession.selectOne("tm_img.select_mem_img", map);
	}
}
