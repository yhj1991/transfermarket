package com.tm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MainInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession httpSession = request.getSession();
		String path = request.getServletPath();
		path = path.substring(1);	// url 주소 "/" 삭제
		String query = request.getQueryString();
		
		if(query == null) {
			httpSession.setAttribute("session_current_url", path);
			System.out.println("MainInterceptor :" + path);
		}
		else {
			httpSession.setAttribute("session_current_url", path+ "?" + query);
			System.out.println("MainInterceptor :" + path + "?" + query);
		}
		
		return true;
	}

}
