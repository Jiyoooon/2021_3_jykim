package kr.ac.kopo.util;

import java.util.UUID;

public class StringUtils {
	//이미지 파일 유형, 파일 확장자
	public static String getNewFileName(String fileType, String fielExt) {
		StringBuilder sb = new StringBuilder();
		
		String uuid = UUID.randomUUID().toString();
		sb.append(fileType).append(uuid).append(".").append(fielExt);
		System.out.println("new image name : " + uuid);
		return sb.toString();
	}
}
