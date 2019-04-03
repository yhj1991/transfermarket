package com.tm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tm.dao.TmMainDAO;

@Controller
public class TmMainController {

	@Autowired private TmMainDAO mainDAO;
	
	/*
	SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH");

	Date time = new Date();

	String now = format.format(time);
	 */
	
	// 메인
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String mainGet(Model model, HttpSession httpSession) {
		
		try {
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
			e.printStackTrace();
		}
		return "main/main";
	}
	
}
