package com.tm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tm.dao.TmSupportDAO;
import com.tm.vo.TmUserVO;

@Controller
@RequestMapping("/support")
public class TmSupportController {

	@Autowired private TmSupportDAO supportDAO;
	
	// 게시판 메인
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String supportMain(Model model, HttpSession httpSession) {
		
		try {
			httpSession.setAttribute("hit", 1);
			
			model.addAttribute("category", supportDAO.selectSupportCategory());
			int page = supportDAO.selectSupportListTotPage();
			model.addAttribute("totpage", page/16+1);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "support/support_main";
	}
	
	// 게시판 조회
	@RequestMapping(value = "/select.do", method = RequestMethod.GET)
	public String selectSupportOne(Model model, HttpSession httpSession,
			@RequestParam(value = "no", required=true) Integer no) {
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			int hit = (int)httpSession.getAttribute("hit");
			if(hit > 0) {
				supportDAO.updateSupportOneHit(sendMap);
				httpSession.setAttribute("hit", 0);
			}
			
			model.addAttribute("support", supportDAO.selectSupportOne(sendMap));
			model.addAttribute("commentList", supportDAO.selectSupportComment(sendMap));
			model.addAttribute("prev", supportDAO.selectSupportPrev(sendMap));
			model.addAttribute("next", supportDAO.selectSupportNext(sendMap));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "support/support_select";
	}
	
	// 게시판 글쓰기
	@RequestMapping(value = "/insert.do", method = RequestMethod.GET)
	public String supportInsertGet(Model model) {
		
		try {
			model.addAttribute("category", supportDAO.selectSupportCategory());
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "support/support_insert";
	}
	
	// 게시판 글쓰기
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String supportInsertPost(Authentication auth,
			@RequestParam(value = "category", required=true) int category,
			@RequestParam(value = "title", defaultValue="") String title,
			@RequestParam(value = "content", defaultValue="") String content) {
		
		try {
			TmUserVO vo = (TmUserVO)auth.getPrincipal();
			
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("category", category);
			sendMap.put("title", title);
			sendMap.put("content", content);
			sendMap.put("writer", vo.getUsername());
			
			int ret = supportDAO.insertSupportOne(sendMap);
			if(ret > 0) {
				return "redirect:main.do";
			}
			else {
				return "redirect:insert.do";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:insert.do";
		}
	}
	
	// 게시판 글수정
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String supportUpdate(
			@RequestParam(value = "no", required=true) int no,
			@RequestParam(value = "title", required=true) String title,
			@RequestParam(value = "content", required=true) String content,
			@RequestParam(value = "writer", required=true) String writer) {
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			sendMap.put("title", title);
			sendMap.put("content", content);
			sendMap.put("writer", writer);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "main.do";
	}
	
	// 게시판 글삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String supportDelete() {
		return "main.do";
	}
}
