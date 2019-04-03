package com.tm.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.tm.dao.TmDetailDAO;

@RestController
@RequestMapping("/detail")
public class RestDetailController {

	@Autowired private TmDetailDAO detailDAO;
	
	// 상세페이지 카테고리 SelectBox 국가 목록
	@RequestMapping(value = "/rest_sb_countrylist.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restDetailCountryList(
			@RequestParam(value = "no") int no){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			List<Map<String, Object>> countryList = detailDAO.selectSbCountryList(sendMap);
			
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("countryList", countryList);
			
			return jsonMap;
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 상세페이지 카테고리 SelectBox 리그 목록
	@RequestMapping(value = "/rest_sb_leaguelist.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restDetailLeagueList(
			@RequestParam(value = "no") int no){

		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			List<Map<String, Object>> leagueList = detailDAO.selectSbLeagueList(sendMap);
			
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("leagueList", leagueList);
			
			return jsonMap;
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 상세페이지 카테고리 SelectBox 클럽 목록
	@RequestMapping(value = "/rest_sb_clublist.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restDetailClubList(
			@RequestParam(value = "no") int no){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			List<Map<String, Object>> clubList = detailDAO.selectSbClubList(sendMap);
			
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("clubList", clubList);
			
			return jsonMap;
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 클럽 선수리스트 가치별 정렬
	@RequestMapping(value = "/rest_club_playerlist.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restDetailClubPlayerList(
		@RequestParam(value = "no") int no,
		@RequestParam(value = "order") int order){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			sendMap.put("order", order);
			
			List<Map<String, Object>> playerList = detailDAO.selectRestDetailClubPlayerList(sendMap);
			
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("playerList", playerList);
			
			return jsonMap;
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
