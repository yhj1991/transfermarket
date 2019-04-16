package com.tm.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tm.dao.TmTeamDAO;
import com.tm.vo.TmUserVO;

@Controller
@RequestMapping("/team")
public class TmTeamController {

	@Autowired private TmTeamDAO teamDAO;
	
	// 팀 관리자 메인
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String teamMain() {
		return "team/main";
	}
	
	// 나의 팀
	@RequestMapping(value = "/myteam.do", method = RequestMethod.GET)
	public String myTeam(Authentication auth, Model model,
			@RequestParam(value = "menu", defaultValue="1") int menu) {
		
		if(menu == 1) {
			TmUserVO vo = (TmUserVO)auth.getPrincipal();
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("id", vo.getUsername());
			model.addAttribute("member", teamDAO.selectMemberOne(sendMap));
		}
		else if(menu == 2) {
			TmUserVO vo = (TmUserVO)auth.getPrincipal();
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("id", vo.getUsername());
			model.addAttribute("team", teamDAO.selectMyTeam(sendMap));
			
		}
		else if(menu == 3) {
			TmUserVO vo = (TmUserVO)auth.getPrincipal();
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("id", vo.getUsername());
			model.addAttribute("team", teamDAO.selectMyTeam(sendMap));
		}
		else if(menu == 4) {
			
		}
		else if(menu == 5) {
			
		}
		else {
			return "redirect:myteam.do?menu=1";
		}
		return "team/myteam_menu" + menu;
	}
	
	// 나의 팀관리
	@RequestMapping(value = "/config.do", method = RequestMethod.GET)
	public String myTeamSetting() {
		
		return "team/config";
	}
	
	// 팀 구인
	@RequestMapping(value = "/find.do", method = RequestMethod.GET)
	public String teamFind(Model model,
			@RequestParam(value = "menu", defaultValue="1") int menu) {
		
		if(menu == 1) {
			
		}
		else if(menu == 2) {
			
		}
		else {
			return "redirect:team_find.do?menu=1";
		}
		
		return "team/find_menu" + menu;
	}
}
