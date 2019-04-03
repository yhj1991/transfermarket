package com.tm.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.tm.vo.TmUserVO;

public class TmUserDAO implements UserDetailsService{

	@Autowired
	@Resource(name="mysql_sqlSession") private SqlSession sqlSession;
	
	public TmUserDAO(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		Map<String, Object> sendMap = new HashMap<String, Object>();
		sendMap.put("id", username);
		
		Map<String, Object> getMap = sqlSession.selectOne("tm_main.select_member_login", sendMap);
		
		if(getMap == null) {
			throw new UsernameNotFoundException(username);
		}
		
		boolean enabled = false;
		if((Integer)getMap.get("enabled") == 1) {
			enabled = true;
		}
		
		List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
		GrantedAuthority vo = new SimpleGrantedAuthority((String)getMap.get("authority"));
		list.add(vo);
		
		 TmUserVO obj = new TmUserVO(
				 (String)getMap.get("mem_id"),
				 (String)getMap.get("mem_pw"),
				 enabled,
				 true,
				 true,
				 true,
				 list,
				 getMap
				 );
		 
		 return obj;
	}

}
