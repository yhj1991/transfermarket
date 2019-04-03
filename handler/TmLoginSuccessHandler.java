package com.tm.handler;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.tm.vo.TmUserVO;;

public class TmLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		HttpSession httpSession = request.getSession();
		TmUserVO vo = (TmUserVO)authentication.getPrincipal();
		Collection<GrantedAuthority> list = vo.getAuthorities();
		for(GrantedAuthority tmp : list) {
			if(tmp.getAuthority().equals("ROLE_ADMIN")) {
				response.sendRedirect(request.getContextPath() + "/admin/main.do");
			}
			else if(tmp.getAuthority().equals("ROLE_CLUB")) {
				response.sendRedirect(request.getContextPath() + "/club/main.do");
			}
			else if(tmp.getAuthority().equals("ROLE_COACH")) {
				response.sendRedirect(request.getContextPath() + "/coach/main.do");
			}
			else if(tmp.getAuthority().equals("ROLE_USER")) {
				response.sendRedirect(request.getContextPath() + "/" + (String)httpSession.getAttribute("session_current_url"));
			}
		}
	}

}
