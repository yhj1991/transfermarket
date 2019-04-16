package com.tm.dao;

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
		return sqlsession.selectOne("tm_team.select_my_team", map);
	}
	
	// 내 정보
	public Map<String, Object> selectMemberOne(Map<String, Object> map) {
		return sqlsession.selectOne("tm_team.select_member_one", map);
	}
}
