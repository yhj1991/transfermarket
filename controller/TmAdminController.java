package com.tm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tm.dao.TmAdminDAO;

@Controller
@RequestMapping("/admin")
public class TmAdminController {

	@Autowired private TmAdminDAO adminDAO;
	
	// 관리자 메인페이지
	@RequestMapping(value="/main.do", method = RequestMethod.GET)
	public String adminMain(Model model,
			@RequestParam(value = "menu", defaultValue = "") String menu,
			@RequestParam(value = "detail", required = false) Integer detail,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "boxnum", defaultValue = "0", required = false) Integer boxnum,
			@RequestParam(value = "continent", defaultValue = "0") Integer continent,
			@RequestParam(value = "country", defaultValue = "0") Integer country,
			@RequestParam(value = "league", defaultValue = "0") Integer league) {

		try {
			// 관리자 메인
			if(menu.equals("")) {
				model.addAttribute("main", adminDAO.selectAdminMainList());
			}
			// 관리자 회원 관리
			if(menu.equals("member")) {
				if(detail == null) {
					return "redirect:main.do?menu=member&detail=1";
				}
				else if(detail < 5){
					model.addAttribute("member", adminDAO.selectMemberList(detail));
				}
				else {
					return "redirect:main.do?menu=member&detail=1";
				}
			}
			// 관리자 경기일정 관리
			else if(menu.equals("match")) {
				if(detail == null) {
					return "redirect:main.do?menu=match&detail=1";
				}
				else {
					if(detail == 1) {
						model.addAttribute("continentList", adminDAO.selectContinentCategoryList());
					}
					else if(detail == 2) {
						model.addAttribute("champs", adminDAO.selectChampsGroupList());
						@SuppressWarnings("unchecked")
						int length = ((List<Map<String, Object>>) adminDAO.selectChampsGroupList().get("clubList")).size();
						model.addAttribute("clubLength", length);
					}
					else {
						return"redirect:main.do?menu=match&detail=1";
					}
				}
			}
			// 관리자 선수 관리
			else if(menu.equals("player")) {
				if(detail == null) {
					return "redirect:main.do?menu=player&detail=1";
				}
				// 선수목록
				else if(detail == 1) {
					int totpage = adminDAO.selectPlayerListTotalPage();
					model.addAttribute("totpage", (totpage/23)+1);
				}
				// 선수등록
				else if(detail == 2) {
					model.addAttribute("countryList", adminDAO.selectPlayerCountry());
					model.addAttribute("position1List", adminDAO.selectPlayerPosition());
				}
				else {
					return "redirect:main.do?menu=player&detail=1";
				}
			}
			// 관리자 감독 관리
			else if(menu.equals("coach")) {
				if(detail == null) {
					return "redirect:main.do?menu=coach&detail=1";
				}
				// 감독목록
				else if(detail == 1) {
					if(page == null) {
						return "redirect:main.do?menu=coach&detail=1&page=1";
					}
					else {
						int totpage = adminDAO.selectCoachListTotalPage();
						model.addAttribute("totpage", (totpage/23)+1);
					}
				}
				// 감독등록
				else if(detail == 2) {
					model.addAttribute("countryList", adminDAO.selectPlayerCountry());
					model.addAttribute("formationList", adminDAO.selectFormationList());
				}
				else {
					return "redirect:main.do?menu=coach&detail=1";
				}
			}
			// 관리자 클럽/리그/국가 관리
			else if(menu.equals("tm_data")) {
				if(detail == null) {
					return "redirect:main.do?menu=tm_data&detail=1";
				}
				// 클럽관리
				else if(detail == 1) {
					model.addAttribute("countryList", adminDAO.selectPlayerCountry());
				}
				// 리그관리
				else if(detail == 2) {
					
				}
				// 국가관리
				else if(detail == 3) {
					
				}
				else {
					return "redirect:main.do?menu=tm_data&detail=1";
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "admin/main";
	}
	
	// 관리자 페이지 대륙등록
	@RequestMapping(value="/continent.do", method = RequestMethod.POST)
	public String continentPost(MultipartHttpServletRequest mrequest,
			@RequestParam(value="name") String name) throws Exception {
		
		try {
			MultipartFile file =  mrequest.getFile("file");
			
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("name", name);
			sendMap.put("filedata", file.getBytes());
			
			adminDAO.insertContinent(sendMap);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:main.do";
	}
	
	// 관리자 페이지 국가등록
	@RequestMapping(value="/country.do", method = RequestMethod.POST)
	public String countryPost(MultipartHttpServletRequest mrequest,
			@RequestParam(value="continent[]") Integer[] continent,
			@RequestParam(value="name[]") String[] name) throws Exception {
		
		try {
			List<MultipartFile> filedata =  mrequest.getFiles("file[]");
			
			List<Integer> contientList = new ArrayList<Integer>();
			List<String> nameList = new ArrayList<String>();
			List<byte[]> fileList = new ArrayList<byte[]>();
			
			for(int i = 0; i < continent.length; i++) {
				contientList.add(continent[i]);
				nameList.add(name[i]);
				fileList.add(filedata.get(i).getBytes());
			}
			
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("continent", contientList);
			sendMap.put("name", nameList);
			sendMap.put("filedata", fileList);
			
			adminDAO.insertCountry(sendMap);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:main.do?menu=public";
	}
	
	// 관리자 페이지 리그등록
	@RequestMapping(value="/league.do", method = RequestMethod.POST)
	public String leaguePost(MultipartHttpServletRequest mrequest,
			@RequestParam(value="country[]") Integer[] country,
			@RequestParam(value="name[]") String[] name) throws Exception {
		
		try {
			List<MultipartFile> filedata =  mrequest.getFiles("file[]");
			
			List<Integer> countryList = new ArrayList<Integer>();
			List<String> nameList = new ArrayList<String>();
			List<byte[]> fileList = new ArrayList<byte[]>();
			
			for(int i = 0; i < country.length; i++) {
				countryList.add(country[i]);
				nameList.add(name[i]);
				fileList.add(filedata.get(i).getBytes());
			}
			
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("country", countryList);
			sendMap.put("name", nameList);
			sendMap.put("filedata", fileList);
			
			adminDAO.insertLeague(sendMap);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:main.do?menu=public";
	}
	
	// 관리자 페이지 클럽등록
	@RequestMapping(value="/club.do", method = RequestMethod.POST)
	public String clubPost(MultipartHttpServletRequest mrequest,
			@RequestParam(value="no[]") Integer[] no,
			@RequestParam(value="name[]") String[] name,
			@RequestParam(value="addr[]") String[] addr,
			@RequestParam(value="tel[]") String[] tel,
			@RequestParam(value="fax[]") String[] fax,
			@RequestParam(value="page[]") String[] page,
			@RequestParam(value="stadium[]") String[] stadium,
			@RequestParam(value="founded[]") String[] founded) throws Exception {

		try {
			List<MultipartFile> filedata =  mrequest.getFiles("file[]");
			
			List<Integer> noList = new ArrayList<Integer>();
			List<String> nameList = new ArrayList<String>();
			List<String> addrList = new ArrayList<String>();
			List<String> telList = new ArrayList<String>();
			List<String> faxList = new ArrayList<String>();
			List<String> pageList = new ArrayList<String>();
			List<String> stadiumList = new ArrayList<String>();
			List<String> foundedList = new ArrayList<String>();
			List<byte[]> fileList = new ArrayList<byte[]>();
			
			for(int i = 0; i < no.length; i++) {
				noList.add(no[i]);
				nameList.add(name[i]);
				addrList.add(addr[i]);
				telList.add(tel[i]);
				faxList.add(fax[i]);
				pageList.add(page[i]);
				stadiumList.add(stadium[i]);
				foundedList.add(founded[i]);
				fileList.add(filedata.get(i).getBytes());
			}
			
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", noList);
			sendMap.put("name", nameList);
			sendMap.put("addr", addrList);
			sendMap.put("tel", telList);
			sendMap.put("fax", faxList);
			sendMap.put("page", pageList);
			sendMap.put("stadium", stadiumList);
			sendMap.put("founded", foundedList);
			sendMap.put("filedata", fileList);
			
			adminDAO.insertClub(sendMap);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:main.do?menu=club";
	}
	
	// 관리자페이지 선수등록
	@RequestMapping(value = "/insert_player.do", method = RequestMethod.POST)
	public String insertPlayer(MultipartHttpServletRequest mrequest,
			@RequestParam(value = "player_country[]") Integer[] country,
			@RequestParam(value = "club[]") Integer[] club,
			@RequestParam(value = "name[]") String[] name,
			@RequestParam(value = "backnum[]") Integer[] backnum,
			@RequestParam(value = "birth[]") String[] birth,
			@RequestParam(value = "mv[]") String[] mv,
			@RequestParam(value = "age[]", defaultValue="0", required=false) Integer[] age,
			@RequestParam(value = "height[]", defaultValue="0", required=false) Integer[] height,
			@RequestParam(value = "position1[]") String[] position1,
			@RequestParam(value = "position2[]") String[] position2,
			@RequestParam(value = "foot[]") String[] foot) throws Exception {
	
		try {
			List<MultipartFile> filedata = mrequest.getFiles("file[]");
			
			List<Integer> countryList = new ArrayList<Integer>();
			List<Integer> clubList = new ArrayList<Integer>();
			List<String> nameList = new ArrayList<String>();
			List<Integer> backnumList = new ArrayList<Integer>();
			List<String> birthList = new ArrayList<String>();
			List<String> mvList = new ArrayList<String>();
			List<Integer> ageList = new ArrayList<Integer>();
			List<Integer> heightList = new ArrayList<Integer>();
			List<String> position1List = new ArrayList<String>();
			List<String> position2List = new ArrayList<String>();
			List<String> footList = new ArrayList<String>();
			List<byte[]> fileList = new ArrayList<byte[]>();
			
			// null처리 수정해야함
			if(country[0] != 0) {
				for(int i = 0; i < country.length; i++) {
					if(country[i] != 0) {
						countryList.add(country[i]);
						clubList.add(club[i]);
						nameList.add(name[i]);
						backnumList.add(backnum[i]);
						birthList.add(birth[i]);
						mvList.add(mv[i]);
						ageList.add(age[i]);
						heightList.add(height[i]);
						position1List.add(position1[i]);
						position2List.add(position2[i]);
						footList.add(foot[i]);
						fileList.add(filedata.get(i).getBytes());
					}
				}
			
				Map<String, Object> sendMap = new HashMap<String, Object>();
				sendMap.put("country", countryList);
				sendMap.put("club", clubList);
				sendMap.put("name", nameList);
				sendMap.put("backnum", backnumList);
				sendMap.put("birth", birthList);
				sendMap.put("mv", mvList);
				sendMap.put("age", ageList);
				sendMap.put("height", heightList);
				sendMap.put("position1", position1List);
				sendMap.put("position2", position2List);
				sendMap.put("foot", footList);
				sendMap.put("filedata", fileList);
				
				adminDAO.insertPlayer(sendMap);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:main.do?menu=player&detail=2";
	}
	
	// 관리자페이지 선수등록
	@RequestMapping(value = "/insert_coach.do", method = RequestMethod.POST)
	public String insertCoach(MultipartHttpServletRequest mrequest,
			@RequestParam(value = "coach_country[]") Integer[] country,
			@RequestParam(value = "name[]") String[] name,
			@RequestParam(value = "birth[]") String[] birth,
			@RequestParam(value = "age[]", defaultValue="0", required=false) Integer[] age,
			@RequestParam(value = "formation[]") String[] formation) throws Exception {
	
		try {
			List<MultipartFile> filedata = mrequest.getFiles("file[]");
			
			List<Integer> countryList = new ArrayList<Integer>();
			List<String> nameList = new ArrayList<String>();
			List<String> birthList = new ArrayList<String>();
			List<Integer> ageList = new ArrayList<Integer>();
			List<String> formationList = new ArrayList<String>();
			List<byte[]> fileList = new ArrayList<byte[]>();
	
			// null처리 수정해야함
			if(country[0] != 0) {
				for(int i = 0; i < country.length; i++) {
					if(country[i] != 0) {
						countryList.add(country[i]);
						nameList.add(name[i]);
						birthList.add(birth[i]);
						ageList.add(age[i]);
						formationList.add(formation[i]);
						fileList.add(filedata.get(i).getBytes());
					}
				}
			
				Map<String, Object> sendMap = new HashMap<String, Object>();
				sendMap.put("country", countryList);
				sendMap.put("name", nameList);
				sendMap.put("birth", birthList);
				sendMap.put("age", ageList);
				sendMap.put("formation", formationList);
				sendMap.put("filedata", fileList);
				
				adminDAO.insertCoach(sendMap);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:main.do?menu=coach&detail=2";
	}

	// 관리자페이지 클럽등록
	@RequestMapping(value = "/update_club.do", method = RequestMethod.POST)
	public String insertPlayer(MultipartHttpServletRequest mrequest,
			@RequestParam(value="club[]", defaultValue="0", required=true) Integer[] club) throws Exception {
		
		try {
			List<MultipartFile> files = mrequest.getFiles("file[]");
			List<Integer> clubList = new ArrayList<Integer>();
			List<byte[]> fileList = new ArrayList<byte[]>();
			
			for(int i = 0; i < club.length; i++) {
				if(club[i] != 0) {
					clubList.add(club[i]);
					fileList.add(files.get(i).getBytes());
				}
			}
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("club", clubList);
			sendMap.put("filedata", fileList);
			
			adminDAO.updateClubImg(sendMap);
		}
		catch(Exception e) {
			
		}
		return "redirect:main.do?menu=tm_data&detail=1";
	}
}

