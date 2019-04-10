package com.tm.controller;

import java.util.HashMap;
import java.util.List;
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
import com.tm.function.SupportComment;
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
			System.out.println(e.getMessage());
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
			model.addAttribute("prev", supportDAO.selectSupportPrev(sendMap));
			model.addAttribute("next", supportDAO.selectSupportNext(sendMap));
			
			// refresh 중복방지 댓글 초기화
			SupportComment.getCommentList().clear();
			// 댓글리스트
			List<Map<String, Object>> getList = supportDAO.selectSupportComment(sendMap);
			for(int i = 0; i < getList.size(); i++) {
				int p_no = (Integer)getList.get(i).get("parent_no");
				int c_no = (Integer)getList.get(i).get("comment_no");
				if(p_no == 0) {
					SupportComment.supportCommentList(c_no, getList, i+1);
				}
			}
			model.addAttribute("comment", SupportComment.getCommentList());
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
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
			System.out.println(e.getMessage());
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
			System.out.println(e.getMessage());
			return "redirect:insert.do";
		}
	}
	
	// 게시판 글수정
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String supportUpdateGet(Model model, Authentication auth,
			@RequestParam(value = "no", required=true) int no) {
		
		try {
			TmUserVO vo = (TmUserVO)auth.getPrincipal();
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			sendMap.put("writer", vo.getUsername());
			
			model.addAttribute("support", supportDAO.selectSupportOne(sendMap));
			model.addAttribute("category", supportDAO.selectSupportCategory());
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "support/support_update";
	}
	
	// 게시판 글수정
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String supportUpdatePost(Model model,
			@RequestParam(value = "no", required=true) Integer no,
			@RequestParam(value = "category", required=true) Integer category,
			@RequestParam(value = "title", required=true) String title,
			@RequestParam(value = "content", required=true) String content) {
		
		String msg = "수정할 수 없습니다. 다시 시도해주세요.";
		String url = "update.do?no=" + no;
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			sendMap.put("category", category);
			sendMap.put("title", title);
			sendMap.put("content", content);
			
			int ret = supportDAO.updateSupportOne(sendMap);
			if(ret > 0) {
				msg = "수정되었습니다.";
				url = "main.do";
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "alert";
	}
	
	// 게시판 글삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String supportDelete(Model model,
			@RequestParam(value = "no") int no) {
		
		String msg = "삭제할 수 없습니다. 다시 시도해주세요.";
		String url = "select.do?no=" + no;
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			int ret = supportDAO.deleteSupportOne(sendMap);
			if(ret > 0) {
				msg = "삭제되었습니다.";
				url = "main.do";
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "alert";
	}
}
