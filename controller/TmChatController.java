package com.tm.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tm.dao.TmChatDAO;

@Controller
@RequestMapping("/chat")
public class TmChatController {

	@Autowired TmChatDAO chatDAO;
	
	// 채팅페이지 메인
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String chat() {
		return "chat/main";
	}
	
	// 채팅페이지 회원정보 조회
	@RequestMapping(value = "/member_info.do", method = RequestMethod.GET)
	public String memberInfo(Model model,
			@RequestParam(value = "id", defaultValue="") String id) {
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("id", id);
			model.addAttribute("member", chatDAO.selectTmMember(sendMap));
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "chat/member_info";
	}
	
	// 채팅페이지 1:1 대화
	@RequestMapping(value = "/chat_user_to_user.do", method = RequestMethod.GET)
	public String chatUsertoUser(Model model,
			@RequestParam(value="id1") String id1,
			@RequestParam(value="id2") String id2) {
		try {
			String topic = id1 + "_to_" + id2;
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("topic", topic);
			model.addAttribute("topic", sendMap);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "chat/chat_user_to_user";
	}
}
