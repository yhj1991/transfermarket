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

import com.tm.dao.TmMypageDAO;
import com.tm.function.ShaEncoder;
import com.tm.vo.TmUserVO;

@Controller
@RequestMapping("/mypage")
public class TmMypageController {

	@Autowired private TmMypageDAO mypageDAO;
	
	// 마이페이지 메인
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String mypage() {
		return "mypage/main";
	}
	
	// 마이페이지 비밀번호 변경
	@RequestMapping(value = "/update_pw.do", method = RequestMethod.GET)
	public String mypageUpdatePassword() {
		return "mypage/update_pw";
	}
	
	// 마이페이지 비밀번호 변경
	@RequestMapping(value = "/update_pw.do", method = RequestMethod.POST)
	public String mypageUpdatePasswordPost(Authentication auth, Model model,
			@RequestParam(value = "old_pw") String old_pw,
			@RequestParam(value = "new_pw") String new_pw) {
		
		String msg = "비밀번호가 변경되었습니다.";
		String url = "update_pw.do";
		try {
			TmUserVO vo = (TmUserVO)auth.getPrincipal();
			
			if(new ShaEncoder(256, vo.getUsername()).encoding(old_pw).equals(vo.getPassword())){
				Map<String, Object> sendMap = new HashMap<String, Object>();
				sendMap.put("id", vo.getUsername());
				sendMap.put("pw", new ShaEncoder(256, vo.getUsername()).encoding(new_pw));
				
				mypageDAO.updateMemberPw(sendMap);
				url = "main.do";
			}
			else {
				msg = "기존 비밀번호가 일치하지 않습니다.";
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			msg = "비밀번호 변경에 실패했습니다. 다시 시도해주세요.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "alert";
	}
	
	// 마이페이지 회원정보 변경
	@RequestMapping(value = "/update_member.do", method = RequestMethod.GET)
	public String mypageUpdateMember(Model model, Authentication auth) {
		
		try {
			TmUserVO vo = (TmUserVO)auth.getPrincipal();
			if(vo != null) {
				Map<String, Object> sendMap = new HashMap<String, Object>();
				sendMap.put("id", vo.getUsername());
				
				model.addAttribute("member", mypageDAO.selectMypageMember(sendMap));
			}
			else {
				return "redirect:main.do";
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "mypage/update_member";
	}
	
	// 마이페이지 회원정보 변경
	@RequestMapping(value = "/update_member.do", method = RequestMethod.POST)
	public String mypageUpdateMemberPost(Model model,
			@RequestParam(value = "id") String id,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "tel") String tel,
			@RequestParam(value = "email") String email) {
		
		String msg = "회원정보가 변경되었습니다.";
		String url = "main.do";
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("id", id);
			sendMap.put("name", name);
			sendMap.put("tel", tel);
			sendMap.put("email", email);
			
			mypageDAO.updateMypageMember(sendMap);
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			msg = "회원정보 변경에 실패했습니다. 다시 확인해주세요.";
			url = "update_member.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "alert";
	}
	
	// 마이페이지 회원탈퇴
	@RequestMapping(value = "/delete_member.do", method = RequestMethod.GET)
	public String deleteMemberGet() {
		return "mypage/delete_member";
	}
	
	// 마이페이지 회원탈퇴
		@RequestMapping(value = "/delete_member.do", method = RequestMethod.POST)
		public String deleteMemberPost(Authentication auth, Model model,
				@RequestParam(value = "id") String id,
				@RequestParam(value = "pw") String pw) {
			
			String msg = "현재 로그인된 계정 정보와 일치하지 않습니다.";
			String url = "delete_member.do";
			try {
				TmUserVO vo = (TmUserVO)auth.getPrincipal();
				if(vo != null) {
					if(vo.getUsername().equals(id) && vo.getPassword().equals(new ShaEncoder(256, id).encoding(pw))) {
						Map<String, Object> sendMap = new HashMap<String, Object>();
						sendMap.put("id", id);
						
						mypageDAO.deleteMember(sendMap);
						
						msg = "회원탈퇴가 되었습니다.";
						url = "/tm/logout.do";
					}
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
