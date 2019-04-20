package com.tm.dao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TmTeamDAO {

	@Autowired
	@Resource(name="mysql_sqlSession") private SqlSession sqlsession;
	
	// 나의 팀
	public Map<String, Object> selectMyTeam(Map<String, Object> map) {
		Map<String, Object> getMap = new HashMap<String, Object>();
		// 나의 팀 정보
		getMap.put("team", sqlsession.selectOne("tm_team.select_my_team", map));
		// 나의 팀 선수목록
		getMap.put("member", sqlsession.selectList("tm_team.select_my_team_memberlist", map));
		// 나의 팀 주장
		getMap.put("captain", sqlsession.selectOne("tm_team.select_my_team_captain", map));
		// 나의 팀 최다득점 / 최다도움
		map.put("type", "goal");
		getMap.put("goal", sqlsession.selectOne("tm_team.select_my_team_point", map));
		map.put("type", "assist");
		getMap.put("assist", sqlsession.selectOne("tm_team.select_my_team_point", map));
		return getMap;
	}
	
	// 내 정보
	public Map<String, Object> selectMemberOne(Map<String, Object> map) {
		return sqlsession.selectOne("tm_team.select_member_one", map);
	}
}
