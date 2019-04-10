package com.tm.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.tm.dao.TmSupportDAO;
import com.tm.vo.TmUserVO;

@RestController
@RequestMapping("/support")
public class RestSupportController {

	@Autowired private TmSupportDAO supportDAO;

	// 내가쓴글
	@RequestMapping(value = "/rest_mysupport.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restMySupport(Authentication auth,
			@RequestParam(value = "page", defaultValue="1") Integer page) {
		
		try {
			TmUserVO vo = (TmUserVO)auth.getPrincipal();
			
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("id", vo.getUsername());
			sendMap.put("page", (page-1)*15);
			sendMap.put("mysupport", supportDAO.selectMySupport(sendMap));
			
			return sendMap; 
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 게시판 전체목록 pagination
	@RequestMapping(value = "/rest_supportlist_page.json",
								method = {RequestMethod.GET, RequestMethod.POST},
								produces = "application/json")
	public @ResponseBody Map<String, Object> restSupportListPage(
			@RequestParam(value = "page", defaultValue="1") Integer page) {
	
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("page", (page-1)*15);
			sendMap.put("supportList", supportDAO.selectSupportList(sendMap));
			
			return sendMap; 
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 게시판 검색
	@RequestMapping(value = "/rest_search_support.json",
								method = {RequestMethod.GET, RequestMethod.POST},
								produces = "application/json")
	public @ResponseBody Map<String, Object> restSearchsupport(
			@RequestParam(value = "category") int category,
			@RequestParam(value = "type") String type,
			@RequestParam(value = "text") String text,
			@RequestParam(value = "page", defaultValue="1") Integer page) {
	
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("category", category);
			sendMap.put("type", type);
			sendMap.put("text", text);
			sendMap.put("page", (page-1)*15);
			sendMap.put("search", supportDAO.selectSearchSupportList(sendMap));
			
			return sendMap; 
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 게시판 댓글등록
	@RequestMapping(value = "/rest_insert_comment.json", 
			method = {RequestMethod.GET, RequestMethod.POST}, 
			produces="application/json")
	public @ResponseBody Map<String, Object> restInsertComment(Authentication auth,
			@RequestParam("no") int no,
			@RequestParam("text") String text){
		
		Map<String, Object> sendMap = new HashMap<String, Object>();
		try {
			TmUserVO vo = (TmUserVO)auth.getPrincipal();
			sendMap.put("no", no);
			sendMap.put("text", text);
			sendMap.put("id", vo.getUsername());
			
			sendMap.put("ret", supportDAO.insertSupportComment(sendMap));
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			sendMap.put("ret", 0);
		}
			return sendMap;
	}
	
	// 게시판 답댓글등록
	@RequestMapping(value = "/rest_insert_recomment.json", 
			method = {RequestMethod.GET, RequestMethod.POST}, 
			produces="application/json")
	public @ResponseBody Map<String, Object> restInsertReComment(Authentication auth,
			@RequestParam("supno") int supno,
			@RequestParam("parno") int parno,
			@RequestParam("parw") String parw,
			@RequestParam("text") String text,
			@RequestParam("depth") int depth){
		
		Map<String, Object> sendMap = new HashMap<String, Object>();
		try {
			TmUserVO vo = (TmUserVO)auth.getPrincipal();
			sendMap.put("supno", supno);
			sendMap.put("parno", parno);
			sendMap.put("parw", parw);
			sendMap.put("text", text);
			sendMap.put("depth", depth+1);
			sendMap.put("id", vo.getUsername());
			
			sendMap.put("ret", supportDAO.insertSupportReComment(sendMap));
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			sendMap.put("ret", 0);
		}
		return sendMap;
	}	
	
}
