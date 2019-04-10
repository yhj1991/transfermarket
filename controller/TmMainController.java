package com.tm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tm.dao.TmDetailDAO;
import com.tm.dao.TmMainDAO;
import com.tm.exception.PageNotFoundException;

@Controller
public class TmMainController {

	@Autowired private TmMainDAO mainDAO;
	@Autowired private TmDetailDAO detailDAO;
	
	@ExceptionHandler(PageNotFoundException.class)
	public String pagenot() {
		return "pagenotfound";
	}
	
	@RequestMapping(value = "/{path}", method = RequestMethod.GET)
	public String home(@PathVariable("path") String path) {
		throw new PageNotFoundException();
	}
	
	@RequestMapping(value = "/error_403.do", method = RequestMethod.GET)
	public String error403() {
		return "error_403";
	}
	
	// 메인
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String mainGet(Model model, HttpSession httpSession) {
		
		try {
			// 선수조회수
			httpSession.setAttribute("player_hit", 1);
			// 대륙종류
			model.addAttribute("category", mainDAO.selectMainCardCategory());
			//  시즌기록(득점/도움), 시장가치, 많이검색
			model.addAttribute("player", mainDAO.selectPlayer(null));
			// Greece
			model.addAttribute("schedule_greece", mainDAO.selectGreeceSchedule());
			// EPL
			model.addAttribute("epl", mainDAO.selectEPLClubList());
			model.addAttribute("schedule_epl", mainDAO.selectEPLSchedule());
			// 라리가
			model.addAttribute("laliga", mainDAO.selectLaligaClubList());
			model.addAttribute("schedule_laliga", mainDAO.selectLaligaSchedule());
			// 세리에
			model.addAttribute("seria", mainDAO.selectSeriaAClubList());
			model.addAttribute("schedule_seria", mainDAO.selectSeriaSchedule());
			// 챔피언스리그
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("group", "A");
			model.addAttribute("champs", mainDAO.selectChampsClubList(sendMap));
			model.addAttribute("schedule_champs", mainDAO.selectChampsSchedule(sendMap));
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "main/main";
	}

	// 정보수정
	@RequestMapping(value = "/suggest.do", method = RequestMethod.GET)
	public String propose(Model model, HttpSession httpSession,
			@RequestParam(value = "type", defaultValue="") String type) {
		try {
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			httpSession.setAttribute("player_hit", 1);
			if(type.equals("")) {
				return "redirect:suggest.do?type=player";
			}
			else if(type.equals("player")) {
				list = mainDAO.selectPlayerList();
			}
			else if(type.equals("club")) {
				list = mainDAO.selectClubList();
			}
			model.addAttribute("list", list);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "main/suggest";
	}
	
	// 정보수정 선수
	@RequestMapping(value = "/suggest_player.do", method = RequestMethod.POST)
	public String proposePlayer(Model model,
			@RequestParam(value = "no") int no) {
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			model.addAttribute("player", detailDAO.selectDetailPlayer(sendMap));
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "main/suggest_player";
	}
}
