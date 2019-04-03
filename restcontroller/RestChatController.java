package com.tm.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.tm.vo.TmUserVO;

@RestController
@RequestMapping("/chat")
public class RestChatController {

	@RequestMapping(value = "/rest_chat_id.json",
							method = {RequestMethod.GET, RequestMethod.POST},
							produces = "application/json")
	public @ResponseBody Map<String, Object> restChatId(Authentication auth){
		
		if(auth != null) {
		TmUserVO vo = (TmUserVO)auth.getPrincipal();
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("id", vo.getUsername());
		
		return jsonMap;
		}
		else {
			System.out.println("로그인된 회원만 채팅됨");
			 return null;
		}
	}
}
