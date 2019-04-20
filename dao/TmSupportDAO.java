package com.tm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TmSupportDAO {

	@Autowired
	@Resource(name="mysql_sqlSession") private SqlSession sqlsession;

	// 게시판 카테고리
	public List<Map<String, Object>> selectSupportCategory() {
		return sqlsession.selectList("tm_support.select_support_category");
	}
	
	// 게시판 내가쓴글
	public Map<String, Object> selectMySupport(Map<String, Object> map) {
		Map<String, Object> sendMap = new HashMap<String, Object>();
		sendMap.put("searchList", sqlsession.selectList("tm_support.select_mysupport", map));
		int page = sqlsession.selectOne("tm_support.select_mysupport_totpage", map);
		sendMap.put("searchPage", (page/16+1));
		return sendMap;
	}
	
	// 게시판 전체목록
	public List<Map<String, Object>> selectSupportList(Map<String, Object> map) {
		return sqlsession.selectList("tm_support.select_supportlist", map);
	}
	
	// 게시판 전체목록 총 페이지
	public int selectSupportListTotPage() {
		return sqlsession.selectOne("tm_support.select_supportlist_totpage");
	}
	
	// 게시판 조회수
	public int updateSupportOneHit(Map<String, Object> map) {
		return sqlsession.update("tm_support.update_support_one_hit", map);
	}
	
	// 게시판 조회
	public Map<String, Object> selectSupportOne(Map<String, Object> map) {
		return sqlsession.selectOne("tm_support.select_support_one", map);
	}
	
	// 게시판 조회 이미지
	public Map<String, Object> selectSupportOneImg(Map<String, Object> map) {
		return sqlsession.selectOne("tm_support.select_support_one_img", map);
	}
	
	// 게시판 이전글
	public int selectSupportPrev(Map<String, Object> map) {
		return sqlsession.selectOne("tm_support.select_support_prev", map);
	}
	
	// 게시판 다음글
	public int selectSupportNext(Map<String, Object> map) {
		return sqlsession.selectOne("tm_support.select_support_next", map);
	}
	
	// 게시판 글쓰기
	public int insertSupportOne(Map<String, Object> map) {
		return sqlsession.insert("tm_support.insert_support_one", map);
	}
	
	// 게시판 글쓰기 이미지
	public int insertSupportOneImg(Map<String, Object> map) {
		return sqlsession.insert("tm_support.insert_support_one_img", map);
	}
	
	// 게시판 검색
	public Map<String, Object> selectSearchSupportList(Map<String, Object> map) {
		Map<String, Object> sendMap = new HashMap<String, Object>();
		int page = sqlsession.selectOne("tm_support.select_search_supportlist_page", map);
		sendMap.put("searchList", sqlsession.selectList("tm_support.select_search_supportlist", map));
		sendMap.put("searchPage", (page/16+1));
		
		return sendMap;
	}
	
	// 게시판 댓글조회
	public List<Map<String, Object>> selectSupportComment(Map<String, Object> map) {
		return sqlsession.selectList("tm_support.select_support_comment", map);
	}
	
	// 게시판 댓글등록
	public int insertSupportComment(Map<String, Object> map) {
		return sqlsession.insert("tm_support.insert_support_comment", map);
	}
	
	// 게시판 답댓글등록
	public int insertSupportReComment(Map<String, Object> map) {
		return sqlsession.insert("tm_support.insert_support_recomment", map);
	}
	
	// 게시판 글수정
	public int updateSupportOne(Map<String, Object> map) {
		return sqlsession.update("tm_support.update_support_one", map);
	}
	
	// 게시판 글삭제
	public int deleteSupportOne(Map<String, Object> map) {
		return sqlsession.update("tm_support.delete_support_one", map);
	}
	
	// 게시판 댓글수정
	public int updateSupportComment(Map<String, Object> map) {
		return sqlsession.update("tm_support.update_support_comment", map);
	}
	
	// 게시판 댓글삭제
	public int deleteSupportComment(Map<String, Object> map) {
		return sqlsession.delete("tm_support.delete_support_comment", map);
	}
		
}
