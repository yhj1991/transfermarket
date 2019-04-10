package com.tm.function;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

public class TmMatch {
	
	@Autowired
	@Resource(name = "mysql_sqlSession") private static SqlSession sqlSession;

	public TmMatch(SqlSession sqlSession) {
		super();
		TmMatch.sqlSession = sqlSession;
	}

	private static List<Integer> homeList = new ArrayList<Integer>();
	private static List<Integer> awayList = new ArrayList<Integer>();
	private static List<String> dateList = new ArrayList<String>();
	private static List<String> kickoffList = new ArrayList<String>();
	
	public static List<Integer> getHomeList() {
		return homeList;
	}
	
	public static void setHomeList(List<Integer> homeList) {
		TmMatch.homeList = homeList;
	}
	
	public static List<Integer> getAwayList() {
		return awayList;
	}
	
	public static void setAwayList(List<Integer> awayList) {
		TmMatch.awayList = awayList;
	}
	
	public static List<String> getDateList() {
		return dateList;
	}

	public static void setDateList(List<String> dateList) {
		TmMatch.dateList = dateList;
	}

	public static List<String> getKickoffList() {
		return kickoffList;
	}

	public static void setKickoffList(List<String> kickoffList) {
		TmMatch.kickoffList = kickoffList;
	}
	
	// 경기일정 생성(일정)
	public static void createMatch (JSONObject jobj, String matchdate, String kickoff) {
		int clubs =jobj.length();
		int[] club_no = new int[clubs];
		
		for(int i = 0; i < clubs; i++) {
			club_no[i] = i;
		}
		
		homeList.clear();
		awayList.clear();
		kickoffList.clear();
		dateList.clear();
		
		for(int i = 0; i < clubs - 1; i++) {
			String[] matchtime = kickoff.split(":");
			int hour = Integer.parseInt(matchtime[0])+3;
			for(int j = 0; j < clubs/2; j++) {
				homeList.add((Integer)jobj.get("" + club_no[j]));
				awayList.add((Integer)jobj.get("" + club_no[clubs-j-1]));
				TmMatch.createDate(matchdate, i);
				if(i%2 > 0) {
					if(hour < 10) {
						kickoffList.add("0" + hour + ":" + matchtime[1]);
					}
					else {
						kickoffList.add(hour + ":" + matchtime[1]);
					}
				}
				else {
					kickoffList.add(matchtime[0]+":"+matchtime[1]);
				}
			}
			for (int j = 0; j < clubs - 1; j++) {
				club_no[j] = (club_no[j] + 1) % (clubs - 1);
			}
		}
	}

	// 경기일정 생성(시간)
	public static void createDate(String matchdate, int idx) {
		String[] match = matchdate.split("-");
		Calendar cal = Calendar.getInstance();
		StringBuffer sbDate = new StringBuffer();

		cal.set(Integer.parseInt(match[0]), Integer.parseInt(match[1])-1, Integer.parseInt(match[2]));
		cal.add(Calendar.DAY_OF_MONTH, idx*3);

		int matchyear = cal.get(Calendar.YEAR);
		int matchmonth = cal.get(Calendar.MONTH) + 1;
		int matchday = cal.get(Calendar.DAY_OF_MONTH);
		
		// 년
		sbDate.append(matchyear + "-");
		// 월
		if(matchmonth < 10) {
			sbDate.append("0");
		}
		sbDate.append(matchmonth + "-");
		// 일
		if(matchday < 10) {
			sbDate.append("0");
		}
		sbDate.append(matchday);
		
		dateList.add(sbDate.toString());
		sbDate.setLength(0);
	}
	
	// 경기결과 업데이트
	public static void updateMatchResult() {
		
		// 현재시간 기준 업데이트 할 경기 조회
		List<Map<String, Object>> getList = sqlSession.selectList("tm_main.select_update_match_result");
		
		List<Integer> matchList = new ArrayList<Integer>();
		List<Integer> homeList = new ArrayList<Integer>();
		List<Integer> awayList = new ArrayList<Integer>();
		List<Integer> winList = new ArrayList<Integer>();
		List<Integer> h_pointList = new ArrayList<Integer>();
		List<Integer> a_pointList = new ArrayList<Integer>();
		
		if(!getList.isEmpty()) {
			for(int i = 0; i < getList.size(); i++) {
				matchList.add((Integer)getList.get(i).get("match_no"));
				homeList.add((Integer)getList.get(i).get("match_home"));
				awayList.add((Integer)getList.get(i).get("match_away"));
				int win = (int)(Math.random()*3);
				int h_point = (int)(Math.random()*6);
				int a_point = (int)(Math.random()*6);
				int change = 0;
				
				// 무
				if(win == 0) {
					winList.add(win);
					h_point = a_point;
				}
				// 홈 승
				else if(win == 1) {
					winList.add((Integer)getList.get(i).get("match_home"));
					if(h_point < a_point) {
						change = h_point;
						h_point = a_point;
						a_point = change;
					}
				}
				// 어웨이 승
				else if(win == 2) {
					winList.add((Integer)getList.get(i).get("match_away"));
					if(h_point > a_point) {
						change = a_point;
						a_point = h_point;
						h_point = change;
					}
				}
				// 홈 득점/도움
				h_pointList.add(h_point);
				// 어웨이 득점/도움
				a_pointList.add(a_point);
			}
			
			// 경기결과 업데이트(승/무/패)
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("match", matchList);
			sendMap.put("win", winList);
			sqlSession.update("tm_main.update_match_result", sendMap);
			
			// 경기별 선수
			sendMap.clear();
			sendMap.put("match", matchList);
			sendMap.put("home", homeList);
			sendMap.put("away", awayList);
			sqlSession.insert("tm_main.insert_point_playerlist", sendMap);
			
			// 홈
			List<Map<String, Object>> h_g_playerList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> h_a_playerList = new ArrayList<Map<String, Object>>();
			
			// 어웨이
			List<Map<String, Object>> a_g_playerList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> a_a_playerList = new ArrayList<Map<String, Object>>();
			
			// 경기별 득점/도움 선수
			for(int i = 0; i < homeList.size(); i++) {
				sendMap.clear();
				// 홈
				sendMap.put("match", (int)matchList.get(i));
				sendMap.put("club", (int)homeList.get(i));
				sendMap.put("point", (int)h_pointList.get(i));
				// 득점
				h_g_playerList.addAll(sqlSession.selectList("tm_main.select_point_player", sendMap));
				// 도움
				h_a_playerList.addAll(sqlSession.selectList("tm_main.select_point_player", sendMap));

				// 어웨이
				sendMap.clear();
				sendMap.put("match", (int)matchList.get(i));
				sendMap.put("club", (int)awayList.get(i));
				sendMap.put("point", (int)a_pointList.get(i));
				// 득점
				a_g_playerList.addAll(sqlSession.selectList("tm_main.select_point_player", sendMap));
				// 도움
				a_a_playerList.addAll(sqlSession.selectList("tm_main.select_point_player", sendMap));
			}
			// 홈 득점
			if(!h_g_playerList.isEmpty()) {
				for(int i = 0; i < h_g_playerList.size(); i++) {
					sendMap.clear();
					sendMap.put("type", "goal");
					sendMap.put("player", h_g_playerList.get(i));
					sqlSession.insert("tm_main.update_point_player", sendMap);
				}
			}
			// 홈 도움
			if(!h_a_playerList.isEmpty()) {
				for(int i = 0; i < h_a_playerList.size(); i++) {
					sendMap.clear();
					sendMap.put("type", "assist");
					sendMap.put("player", h_a_playerList.get(i));
					sqlSession.insert("tm_main.update_point_player", sendMap);
				}
			}
			// 어웨이 득점
			if(!a_g_playerList.isEmpty()) {
				for(int i = 0; i < a_g_playerList.size(); i++) {
					sendMap.clear();
					sendMap.put("type", "goal");
					sendMap.put("player", a_g_playerList.get(i));
					sqlSession.insert("tm_main.update_point_player", sendMap);
				}
			}
			// 어웨이 도움
			if(!a_a_playerList.isEmpty()) {
				for(int i = 0; i < a_a_playerList.size(); i++) {
					sendMap.clear();
					sendMap.put("type", "assist");
					sendMap.put("player", a_a_playerList.get(i));
					sqlSession.insert("tm_main.update_point_player", sendMap);
				}
			}
		}
	}
}
