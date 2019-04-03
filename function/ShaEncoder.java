package com.tm.function;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;

// ShaEncoder obj = new ShaEncoder(256);
// obj.encoding('비밀번호');

// new ShaEncoder(256).encoding('비밀번호');
public class ShaEncoder extends ShaPasswordEncoder{

	private String salt;
	
	public ShaEncoder() {
		super();
	}

	public ShaEncoder(int strength) {
		super(strength);
	}
	
	public ShaEncoder(int strength, String salt) {
		super(strength);
		this.salt = salt;
	}
	
	public String encoding(String str) {
		return this.encodePassword(str, salt);
	}

}