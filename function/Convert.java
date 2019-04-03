package com.tm.function;

import java.security.MessageDigest;

public class Convert {

	// pw 암호화 SHA256
	public static String convertSHA256(String str) {
		try{
	        MessageDigest digest = MessageDigest.getInstance("SHA-256");
	        byte[] hash = digest.digest(str.getBytes("UTF-8"));
	        StringBuffer hexString = new StringBuffer();
	
	        for (int i = 0; i < hash.length; i++) {
	            String hex = Integer.toHexString(0xff & hash[i]);
	            if(hex.length() == 1) hexString.append('0');
	            hexString.append(hex);
	        }
	        
	        return hexString.toString();
	    } catch(Exception ex){
	        return null;
	    }
	}
}
