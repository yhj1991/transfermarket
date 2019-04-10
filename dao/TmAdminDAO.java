package com.tm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TmAdminDAO {

	@Autowired
	@Resource(name="mysql_sqlSession") private SqlSession sqlsession;
	
	// 관리자페이지 선수등록 Position1 List
	public List<Map<String, Object>> selectPlayerPosition(){
		return sqlsession.selectList("tm_admin.select_player_position");
	}
	
	// 관리자페이지 선수등록 Position2 List
	public List<Map<String, Object>> selectPlayerPosition2(Map<String, Object> map){
		return sqlsession.selectList("tm_admin.select_player_position2", map);
	}
	
	// 관리자페이지 선수등록 Country List
	public List<Map<String, Object>> selectPlayerCountry(){
		return sqlsession.selectList("tm_admin.select_player_country");
	}
	
	// 관리자페이지 선수등록 Club List
	public List<Map<String, Object>> selectPlayerClubList(Map<String, Object> map){
		return sqlsession.selectList("tm_admin.select_player_clublist", map);
	}
	
	// 관리자 페이지 선수등록
	public int insertPlayer(Map<String, Object> map) {
		return sqlsession.insert("tm_admin.insert_player", map);
	}
	
	// 관리자 페이지 감독등록
	public int insertCoach(Map<String, Object> map) {
		return sqlsession.insert("tm_admin.insert_coach", map);
	}
	
	// 관리자 페이지 감독등록 Formation List
	public List<Map<String, Object>> selectFormationList() {
		return sqlsession.selectList("tm_admin.select_formationlist");
	}
	
	// 관리자 페이지 에이전트등록
	
	// 관리자 페이지 대륙등록
	public int insertContinent(Map<String, Object> map) {
		return sqlsession.insert("tm_admin.insert_continent", map);
	}
	
	// 관리자 페이지 국가등록
	public int insertCountry(Map<String, Object> map) {
		return sqlsession.insert("tm_admin.insert_country", map);
	}
	
	// 관리자 페이지 리그등록
	public int insertLeague(Map<String, Object> map) {
		return sqlsession.insert("tm_admin.insert_league", map);
	}
	
	// 관리자 페이지 클럽등록
	public int insertClub(Map<String, Object> map) {
		return sqlsession.insert("tm_admin.insert_club", map);
	}
	
	
	// 관리자 페이지 메인
	public Map<String, Object> selectAdminMainList() {
		Map<String, Object> getMap = new HashMap<String, Object>();
		// 최근 가입회원
		getMap.put("member1", sqlsession.selectList("tm_admin.select_main_new_member1"));
		// 최근 가입회원 갯수
		getMap.put("count1", sqlsession.selectOne("tm_admin.select_main_new_member1_count"));
		// 가입신청(클럽/감독)
		getMap.put("member2", sqlsession.selectList("tm_admin.select_main_new_member2"));
		// 가입신청(클럽/감독) 갯수
		getMap.put("count2", sqlsession.selectOne("tm_admin.select_main_new_member2_count"));
		// 최근 탈퇴회원
		getMap.put("member3", sqlsession.selectList("tm_admin.select_main_del_member"));
		// 최근 탈퇴회원 갯수
		getMap.put("count3", sqlsession.selectOne("tm_admin.select_main_del_member_count"));
		return getMap;
	}
	
	// 관리자 페이지 회원관리 리스트
	public Map<String, Object> selectMemberList(Integer detail) {
		Map<String, Object> getMap = new HashMap<String, Object>();
		// 전체회원
		if(detail == 1) {
			getMap.put("list", sqlsession.selectList("tm_admin.select_all_memberlist"));
		}
		// 일반회원
		else if(detail == 2) {
			getMap.put("list", sqlsession.selectList("tm_admin.select_general_memberlist"));
		}
		// 차단회원
		else if(detail == 3){
			getMap.put("list", sqlsession.selectList("tm_admin.select_block_memberlist"));
		}
		else if(detail == 4) {
			getMap.put("list", sqlsession.selectList("tm_admin.select_wait_memberlist"));
		}
		return getMap;
	}
	
	// 관리자페이지 회원관리 회원검색
	public List<Map<String, Object>> selectSearchMember(Map<String, Object> map) {
		return sqlsession.selectList("tm_admin.select_search_member", map);
	}
	
	// 관리자페이지 경기일정관리 (챔피언스리그 목록)
	public Map<String, Object> selectChampsGroupList() {
		Map<String, Object> getMap = new HashMap<String, Object>();
		getMap.put("groupList", sqlsession.selectList("tm_admin.select_rest_champs_grouplist"));
		getMap.put("clubList", sqlsession.selectList("tm_admin.select_champs_all_clublist"));
		
		return getMap;
	}
	
	// 관리자페이지 경기일정관리 (챔피언스리그 목록)
	public List<Map<String, Object>> selectRestChampsGroupList() {
		return sqlsession.selectList("tm_admin.select_rest_champs_grouplist");
	}
	
	// 관리자페이지 경기일정관리 (챔피언스리그 그룹별 클럽)
	public List<Map<String, Object>> selectRestChampsGroupClubList(Map<String, Object> map) {
		return sqlsession.selectList("tm_admin.select_rest_champs_group_clublist", map);
	}
	
	// 관리자페이지 경기일정관리 잔여경기수
	public int selectMatch(Map<String, Object> map) {
		return sqlsession.selectOne("tm_admin.select_match", map);
	}
	
	// 관리자페이지 경기일정관리 일정생성
	public int insertMatch(Map<String, Object> map) {
		return sqlsession.insert("tm_admin.insert_match", map);
	}
	
	// 관리자 페이지 리그관리 리그리스트
	public List<Map<String, Object>> selectLeagueList(){
		return sqlsession.selectList("tm_admin.select_league_list");
	}
	
	// 관리자 페이지 국가관리 국가리스트
	public List<Map<String, Object>> selectCountryList(){
		return sqlsession.selectList("tm_admin.select_country_list");
	}
	
	// 관리자 페이지 클럽관리 클럽리스트
	public List<Map<String, Object>> selectClubList(){
		return sqlsession.selectList("tm_admin.select_club_list");
	}
	
	// 관리자 페이지 선수관리 선수목록 pagination totpage
	public int selectPlayerListTotalPage() {
		return sqlsession.selectOne("tm_admin.select_all_playerlist_totpage");
	}
	
	// 관리자 페이지 선수관리 선수검색
	public Map<String, Object> selectSearchPlayer(Map<String, Object> map) {
		Map<String, Object> getMap = new HashMap<String, Object>();
		int page = sqlsession.selectOne("tm_admin.select_search_player_totpage", map);
		getMap.put("searchPage", (page/23)+1);
		getMap.put("searchList", sqlsession.selectList("tm_admin.select_search_player", map));
		
		return getMap;
	}
	
	// 관리자 페이지 감독관리 감독목록 pagination totpage
	public int selectCoachListTotalPage() {
		return sqlsession.selectOne("tm_admin.select_all_coachlist_totpage");
	}
	
	// 관리자 페이지 감독관리 감독검색
	public Map<String, Object> selectSearchCoach(Map<String, Object> map) {
		Map<String, Object> getMap = new HashMap<String, Object>();
		int page = sqlsession.selectOne("tm_admin.select_search_coach_totpage", map);
		getMap.put("searchPage", (page/23)+1);
		getMap.put("searchList", sqlsession.selectList("tm_admin.select_search_coach", map));
		
		return getMap;
	}
	
	// 관리자 페이지 감독관리 라이센스 조회
	public Map<String, Object> selectAdminCoachOne(Map<String, Object> map) {
		return sqlsession.selectOne("tm_admin.select_rest_admin_coach_detail", map);
	}
	
	/*
	// 관리자페이지 감독관리 페이지별 감독목록
	public List<Map<String, Object>> selectPageCoachList(Map<String, Object> map) {
		return sqlsession.selectList("tm_admin.select_all_coachlist_page", map);
	}
	*/
	
	// 관리자 페이지 클럽관리 이미지등록 (나중에 없어질 Method)
	public int updateClubImg(Map<String, Object> map) {
		return sqlsession.update("tm_admin.update_club_img", map);
	}

	
	// 관리자 페이지 검색 카테고리 대륙리스트
	public List<Map<String, Object>> selectContinentCategoryList(){
		return sqlsession.selectList("tm_admin.select_continent_category_list");
	}
	
	// 관리자 페이지 검색 카테고리 국가리스트
	public List<Map<String, Object>> selectCountryCategoryList(int no){
		return sqlsession.selectList("tm_admin.select_country_category_list", no);
	}
	
	// 관리자 페이지 검색 카테고리 리그리스트
	public List<Map<String, Object>> selectLeagueCategoryList(int no){
		return sqlsession.selectList("tm_admin.select_league_category_list", no);
	}	
	
	// 관리자 페이지 검색 카테고리 클럽리스트
	public List<Map<String, Object>> selectClubCategoryList(int no){
		return sqlsession.selectList("tm_admin.select_club_category_list", no);
	}	
	
	/* end =========================================== */
	
	
	/* 회원관리 항목 ==================================== */
	public int updateMemberEnabled(Map<String, Object> map) {
		return sqlsession.update("tm_admin.update_member_enabled", map);
	}
	
	/* end =========================================== */
	
	/* 국가관리 항목 ==================================== */
	
	// 관리자 페이지 검색 카테고리 대륙별조회
	public List<Map<String, Object>> selectCountryContinentSelectBox(int no){
		return sqlsession.selectList("tm_admin.select_country_continent_selectbox", no);
	}
	
	// 관리자 페이지 검색 카테고리 국가별조회
	public List<Map<String, Object>> selectCountryCountrySelectBox(int no){
		return sqlsession.selectList("tm_admin.select_country_country_selectbox", no);
	}

	// 관리자 페이지 검색 카테고리 리그별조회
	public List<Map<String, Object>> selectCountryLeagueSelectBox(int no){
		return sqlsession.selectList("tm_admin.select_counrty_league_selectbox", no);
	}
	
	/* end =========================================== */
	
	
	/* 리그관리 항목 ==================================== */
	
	// 관리자 페이지 검색 카테고리 대륙별조회
	public List<Map<String, Object>> selectLeagueContinentSelectBox(int no){
		return sqlsession.selectList("tm_admin.select_league_continent_selectbox", no);
	}
	
	// 관리자 페이지 검색 카테고리 국가별조회
	public List<Map<String, Object>> selectLeagueCountrySelectBox(int no){
		return sqlsession.selectList("tm_admin.select_league_country_selectbox", no);
	}

	// 관리자 페이지 검색 카테고리 리그별조회
	public List<Map<String, Object>> selectLeagueLeagueSelectBox(int no){
		return sqlsession.selectList("tm_admin.select_league_league_selectbox", no);
	}
	
	/* end =========================================== */
	
	
	/* 클럽관리 항목 ==================================== */
	
	// 관리자 페이지 검색 카테고리 대륙별조회
	public List<Map<String, Object>> selectClubContinentSelectBox(int no){
		return sqlsession.selectList("tm_admin.select_club_continent_selectbox", no);
	}
	
	// 관리자 페이지 검색 카테고리 국가별조회
	public List<Map<String, Object>> selectClubCountrySelectBox(int no){
		return sqlsession.selectList("tm_admin.select_club_country_selectbox", no);
	}

	// 관리자 페이지 검색 카테고리 리그별조회
	public List<Map<String, Object>> selectClubLeagueSelectBox(int no){
		return sqlsession.selectList("tm_admin.select_club_league_selectbox", no);
	}
	
	/* end =========================================== */
	
}
