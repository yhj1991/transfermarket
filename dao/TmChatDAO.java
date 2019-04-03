package com.tm.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TmChatDAO {

	@Autowired
	@Resource(name="mysql_sqlSession") private SqlSession sqlsession;
	
	// 채팅페이지 회원정보 조회
	public Map<String, Object> selectTmMember(Map<String, Object> map){
		return sqlsession.selectOne("tm_chat.select_member", map);
	}
}
