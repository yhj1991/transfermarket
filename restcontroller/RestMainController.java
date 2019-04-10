package com.tm.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.tm.dao.TmMainDAO;
import com.tm.function.ShaEncoder;

@RestController
public class RestMainController {

	@Autowired private TmMainDAO mainDAO;

	// 회원가입
	@RequestMapping(value = "/rest_join.json",
			method = {RequestMethod.GET, RequestMethod.POST},
			produces = "application/json")
	public @ResponseBody Map<String, Object> restJoin(
			@RequestParam(value = "jointype") String jointype,
			@RequestParam(value = "id") String id,
			@RequestParam(value = "pw") String pw,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "tel") String tel,
			@RequestParam(value = "email") String email){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("jointype", jointype);
			sendMap.put("id", id);
			sendMap.put("pw", new ShaEncoder(256, id).encoding(pw));
			sendMap.put("name", name);
			sendMap.put("tel", tel);
			sendMap.put("email", email);
			
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("ret", mainDAO.insertMember(sendMap));
			jsonMap.put("jointype", jointype);
			
			return jsonMap; 
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/rest_find_member.json",
			method = {RequestMethod.GET, RequestMethod.POST},
			produces = "application/json")
	public @ResponseBody Map<String, Object> restFindMember(
			@RequestParam(value = "name") String name,
			@RequestParam(value = "text") String text,
			@RequestParam(value = "type") String type){
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			jsonMap.put("name", name);
			jsonMap.put("text", text);
			jsonMap.put("type", type);
			jsonMap.put("mem", mainDAO.selectFindMember(jsonMap));
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return jsonMap;
	}
	
	
	// 메인페이지 챔피언스리그 그룹별 클럽목록 
	@RequestMapping(value = "/rest_champs_grouplist.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restChampsGroupList(
			@RequestParam(value = "group") String group){
	
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("group", group);
			
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("groupList", mainDAO.selectChampsClubList(sendMap));
			
			return jsonMap; 
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 메인페이지 챔피언스리그 그룹별 경기일정
	@RequestMapping(value = "/rest_champs_group_match.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restChampsMatchdayList(
		@RequestParam(value = "group") String group){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("group", group);
			
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("match", mainDAO.selectChampsSchedule(sendMap));
			
			return jsonMap; 
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	
}
