package com.tm.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tm.dao.TmImgDAO;

@Controller
@RequestMapping("/img")
public class TmImgController {

	@Autowired private TmImgDAO imgDAO;
	
	// 대륙 이미지
	@RequestMapping(value = "/continent_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> continentImg(
			@RequestParam("no") int no ){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			Map<String, Object> getMap = imgDAO.selectContinentImg(sendMap);
			
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			byte[] img = (byte[])getMap.get("continent_filedata");
			return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
		
	// 국가 이미지
	@RequestMapping(value = "/country_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> countryImg(
			@RequestParam("no") int no ){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			Map<String, Object> getMap = imgDAO.selectCountryImg(sendMap);
			
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			byte[] img = (byte[])getMap.get("country_filedata");
			return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
			
	// 리그 이미지
	@RequestMapping(value = "/league_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> leagueImg(
			@RequestParam("no") int no ){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			Map<String, Object> getMap = imgDAO.selectLeagueImg(sendMap);
			
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			byte[] img = (byte[])getMap.get("league_filedata");
			return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 클럽 이미지
	@RequestMapping(value = "/club_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> clubImg(
			@RequestParam("no") int no ){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			Map<String, Object> getMap = imgDAO.selectClubImg(sendMap);
			
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			byte[] img = (byte[])getMap.get("club_filedata");
			return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 선수 이미지
	@RequestMapping(value = "/player_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> playerImg(
			@RequestParam("no") int no ){
	
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			Map<String, Object> getMap = imgDAO.selectPlayerImg(sendMap);
			
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			byte[] img = (byte[])getMap.get("player_filedata");
			return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 감독 이미지
	@RequestMapping(value = "/coach_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> coachImg(
			@RequestParam("no") int no ){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			Map<String, Object> getMap = imgDAO.selectCoachImg(sendMap);
			
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			byte[] img = (byte[])getMap.get("coach_filedata");
			return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}	
	
	// 포지션 이미지
	@RequestMapping(value = "/position_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> positionImg(
			@RequestParam("position2") String position2 ){
	
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("position2", position2);
			
			Map<String, Object> getMap = imgDAO.selectPositionImg(sendMap);
			
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			byte[] img = (byte[])getMap.get("position_filedata");
			return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 포메이션 이미지
	@RequestMapping(value = "/formation_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> formationImg(
			@RequestParam("formation") String formation ){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("formation", formation);
			
			Map<String, Object> getMap = imgDAO.selectFormationImg(sendMap);
			
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			byte[] img = (byte[])getMap.get("formation_filedata");
			return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 팀 이미지
	@RequestMapping(value = "/team_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> teamImg(
			@RequestParam("no") int no){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("no", no);
			
			Map<String, Object> getMap = imgDAO.selectTeamImg(sendMap);
			
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			byte[] img = (byte[])getMap.get("team_filedata");
			return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	// 회원 이미지
	@RequestMapping(value = "/mem_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> memberImg(
			@RequestParam("id") String id){
		
		try {
			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("id", id);
			
			Map<String, Object> getMap = imgDAO.selectMemberImg(sendMap);
			
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			byte[] img = (byte[])getMap.get("mem_filedata");
			return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
}
