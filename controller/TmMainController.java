package com.tm.controller;

import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.tm.dao.TmMainDAO;
import com.tm.exception.PageNotFoundException;
import com.tm.function.ShaEncoder;

@Controller
public class TmMainController {

	@Autowired private TmMainDAO mainDAO;
	
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
	public ModelAndView mainGet(Model model, HttpSession httpSession) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			// 선수조회수
			httpSession.setAttribute("player_hit", 1);
			// 대륙종류
			map.put("category", mainDAO.selectMainCardCategory());
			//  시즌기록(득점/도움), 시장가치, 많이검색
			map.put("player", mainDAO.selectPlayer(null));
			// Greece
			map.put("schedule_greece", mainDAO.selectGreeceSchedule());
			// EPL
			map.put("epl", mainDAO.selectEPLClubList());
			map.put("schedule_epl", mainDAO.selectEPLSchedule());
			// 라리가
			map.put("laliga", mainDAO.selectLaligaClubList());
			map.put("schedule_laliga", mainDAO.selectLaligaSchedule());
			// 세리에
			map.put("seria", mainDAO.selectSeriaAClubList());
			map.put("schedule_seria", mainDAO.selectSeriaSchedule());
			// 챔피언스리그
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("group", "A");
			map.put("champs", mainDAO.selectChampsClubList(sendMap));
			map.put("schedule_champs", mainDAO.selectChampsSchedule(sendMap));
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return new ModelAndView("main/main", "main", map);
	}

	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	// 세션 시간초과
	@RequestMapping(value = "/login_timeout.do", method = RequestMethod.GET)
	public String loginTimeout() {
		return "login_timeout";
	}
	
	// 중복 로그인
	@RequestMapping(value = "/login_duplicate.do", method = RequestMethod.GET)
	public String loginDuplicate() {
		return "login_duplicate";
	}
	
	// 회원가입
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinGet() {
		return "join";
	}
	
	// 회원가입
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String joinPost(Model model,
		@RequestParam(value = "id") String id,
		@RequestParam(value = "pw") String pw,
		@RequestParam(value = "name") String name,
		@RequestParam(value = "tel") String tel,
		@RequestParam(value = "email") String email){
	
	String msg = "회원가입에 실패했습니다.";
	String url = "join.do";
	
	Map<String, Object> sendMap = new HashMap<String, Object>();
	sendMap.put("id", id);
	sendMap.put("pw", new ShaEncoder(256, id).encoding(pw));
	sendMap.put("name", name);
	sendMap.put("tel", tel);
	sendMap.put("email", email);
	try {
		int ret = mainDAO.insertMember(sendMap);
		if(ret > 0) {
			msg = "회원가입이 완료되었습니다.";
			url = "login.do";
		}
	}
	catch(Exception e) {
		System.out.println(e.getMessage());
	}
	model.addAttribute("msg", msg);
	model.addAttribute("url", url);
	return "alert"; 
}
	
	// 아이디 찾기
	@RequestMapping(value = "/find_id.do", method = RequestMethod.GET)
	public String findIDGet() {
		return "find_id";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
	public ModelAndView findIDPost(
			@RequestParam(value = "name") String name,
			@RequestParam(value = "email", defaultValue="") String email,
			@RequestParam(value = "tel", defaultValue="") String tel ) {
		
		Map<String, Object> sendMap = new HashMap<String, Object>();
		if(tel.equals("")) {
			sendMap.put("name", name);
			sendMap.put("type", "mem_email");
			sendMap.put("text", email);
		}
		else if(email.equals("")) {
			sendMap.put("name", name);
			sendMap.put("type", "mem_tel");
			sendMap.put("text", tel);
		}
		return new ModelAndView("find_id_result", "find_id", mainDAO.selectFindMember(sendMap));
	}
	
}
