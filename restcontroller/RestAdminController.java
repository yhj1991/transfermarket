package com.tm.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.tm.dao.TmAdminDAO;
import com.tm.function.TmMatch;

@RestController
@RequestMapping("/admin")
public class RestAdminController {

	@Autowired private TmAdminDAO adminDAO;
	
	// 관리자페이지 선수관리 ClubList	
	@RequestMapping(value = "/rest_country_club.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restClubSelectBox(
			@RequestParam("country") int country){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("country", country);
			
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("clubList", adminDAO.selectPlayerClubList(sendMap));
			
			return jsonMap;
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	
	// 관리자페이지 선수관리 Position2List
	@RequestMapping(value = "/rest_player_position2.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restPosition2SelectBox(
			@RequestParam("position1") String position1){
	
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("position1", position1);
			
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("position2List", adminDAO.selectPlayerPosition2(sendMap));
			
			return jsonMap;
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 관리자페이지 회원관리 회원정지/해제
	@RequestMapping(value = "/rest_update_member_enabled.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restUpdateMemberEnabled(
			@RequestParam("id") String id,
			@RequestParam("btn") String btn){
		
		int enabled = 0;
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("ret", 0);
		
		try {
			if(btn.equals("해제")) {
				enabled = 1;
			}
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("id", id);
			sendMap.put("enabled", enabled);
			
			adminDAO.updateMemberEnabled(sendMap);
			jsonMap.put("ret", 1);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return jsonMap;
	}
	
	// 관리자페이지 회원관리 회원검색
	@RequestMapping(value = "/rest_search_member.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restSearchMember(
			@RequestParam("text") String text,
			@RequestParam("detail") Integer detail){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("text", text);
			sendMap.put("detail", detail);
			sendMap.put("search", adminDAO.selectSearchMember(sendMap));
			
			return sendMap;
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 관리자페이지 경기일정관리 챔피언스리그 그룹별 클럽목록
	@RequestMapping(value = "/rest_champs_group_clublist.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restChampsClubList(
			@RequestParam("group") String group){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("group", group);
			sendMap.put("search", adminDAO.selectRestChampsGroupClubList(sendMap));
			return sendMap;
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}	
	
	// 관리자페이지 선수관리 pagination / 선수독검색
	@RequestMapping(value = "/rest_search_player.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restSearchPlayer(
			@RequestParam(value = "text", defaultValue="") String text,
			@RequestParam(value = "page", defaultValue="1") Integer page){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("text", text);
			sendMap.put("spage", ((page-1)*22));
			sendMap.put("search", adminDAO.selectSearchPlayer(sendMap));
			
			return sendMap;
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 관리자페이지 감독관리 라이센스조회
	@RequestMapping(value = "/rest_admin_coach_detail.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restAdminCoachDetail(
			@RequestParam("no") int no){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			sendMap.put("coach", adminDAO.selectAdminCoachOne(sendMap));
			return sendMap;
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}

	// 관리자페이지 감독관리 pagination / 감독검색
	@RequestMapping(value = "/rest_search_coach.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restSearchCoach(
			@RequestParam(value = "text", defaultValue="") String text,
			@RequestParam(value = "page", defaultValue="1") Integer page){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("text", text);
			sendMap.put("spage", ((page-1)*22));
			sendMap.put("search", adminDAO.selectSearchCoach(sendMap));
			
			return sendMap;
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 일정생성
	@RequestMapping(value = "/rest_insert_match.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restInsertMatch(
			@RequestParam(value = "clubno") String clubno,
			@RequestParam(value = "leagueno") int leagueno,
			@RequestParam(value = "matchdate") String matchdate,
			@RequestParam(value = "kickoff") String kickoff){
		
		
		Map<String, Object> sendMap = new HashMap<String, Object>();	
		JSONObject jobj = new JSONObject(clubno);
		try {
			TmMatch.createMatch(jobj, matchdate, kickoff);
			sendMap.put("league", leagueno);
			int cnt = adminDAO.selectMatch(sendMap);
			System.out.println(cnt);
			if(cnt == 0) {
				sendMap.put("kickoff", TmMatch.getKickoffList());
				sendMap.put("home", TmMatch.getHomeList());
				sendMap.put("away", TmMatch.getAwayList());
				sendMap.put("matchdate", TmMatch.getDateList());
				sendMap.put("ret", adminDAO.insertMatch(sendMap));
			}
			else {
				sendMap.put("ret", 0);
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			sendMap.put("ret", -1);
		}
		return sendMap;
	}
}
