package com.tm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tm.dao.TmDetailDAO;
import com.tm.dao.TmMainDAO;

@Controller
@RequestMapping("/detail")
public class TmDetailController {

	@Autowired private TmMainDAO mainDAO;
	@Autowired private TmDetailDAO detailDAO;
	
	// 대륙별 상세페이지
	@RequestMapping(value = "/continent.do", method = RequestMethod.GET)
	public String continentDetail(Model model,
			@RequestParam(value = "no") int no) {
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			// 대륙종류
			model.addAttribute("category", mainDAO.selectMainCardCategory());
			model.addAttribute("continentList", detailDAO.selectDetailContinent(sendMap));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "detail/continent_detail";
	}
	
	// 리그별 상세페이지
	@RequestMapping(value = "/league.do", method = RequestMethod.GET)
	public String leagueDetail(Model model,
			@RequestParam(value = "no") int no) {
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			// league.league 리그정보 & league.clubs 클럽목록
			model.addAttribute("continentList", detailDAO.selectSbContinentList(null));
			model.addAttribute("league", detailDAO.selectDetailLeague(sendMap));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "detail/league_detail";
	}
	
	// 클럽 상세페이지
	@RequestMapping(value = "/club.do", method = RequestMethod.GET)
	public String clubDetail(Model model, HttpSession httpSession,
			@RequestParam(value = "no") int no) {
		
		try {
			httpSession.setAttribute("player_hit", 1);
			
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			model.addAttribute("club", detailDAO.selectDetailClub(sendMap));
			model.addAttribute("continentList", detailDAO.selectSbContinentList(null));
			model.addAttribute("playerList", detailDAO.selectDetailClubPlayerList(sendMap));
			model.addAttribute("info", detailDAO.selectDetailClubInfo(sendMap));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "detail/club_detail";
	}
	
	// 선수 상세페이지
	@RequestMapping(value = "/player.do", method = RequestMethod.GET)
	public String playerDetail(Model model, HttpSession httpSession,
			@RequestParam(value = "no") int no) {
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			int player_hit = (Integer)httpSession.getAttribute("player_hit");
			if(player_hit == 1) {
				detailDAO.updatePlayerHit(sendMap);
				httpSession.setAttribute("player_hit", 0);
			}
			
			model.addAttribute("player", detailDAO.selectDetailPlayer(sendMap));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "detail/player_detail";
	}
	
	// 매치정보 상세페이지
	@RequestMapping(value = "/match.do", method = RequestMethod.GET)
	public String ScheduleDetail(Model model, HttpSession httpSession,
			@RequestParam(value = "no", defaultValue="0") int no) {
		
		try {
			httpSession.setAttribute("player_hit", 1);
			
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			// 매치정보
			model.addAttribute("match", detailDAO.selectDetailMatch(sendMap));
			// 클럽정보
			model.addAttribute("info", detailDAO.selectDetailMatchClubsInfo(sendMap));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "detail/match_detail";
	}
		
	// 챔스매치정보 상세페이지
	@RequestMapping(value = "/champs_match.do", method = RequestMethod.GET)
	public String champsScheduleDetail(Model model, HttpSession httpSession,
			@RequestParam(value = "no", defaultValue="0") int no) {
		
		try {
			httpSession.setAttribute("player_hit", 1);
			
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			model.addAttribute("match", detailDAO.selectDetailChampsMatch(sendMap));
			model.addAttribute("clubs", detailDAO.selectDetailChampsMatchClubs(sendMap));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "detail/champs_match_detail";
	}
	
}
