package com.itwillbs.function;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

public class FunctionClass {
	
	// 팬션 고유번호 생성
	public String simplePenSionCreateCode() {
		StringBuilder sb = new StringBuilder();
		Random r = new Random();
		sb.append((char)(r.nextInt(26) + 65));
		for (int i = 0; i < 12; i++) {
			sb.append(r.nextInt(10));
		}
		return sb.toString();
	}
	
	// 현재시간
	public String nowTime(String pattern) {
		return LocalDateTime.now().format(DateTimeFormatter.ofPattern(pattern));
	}
}
