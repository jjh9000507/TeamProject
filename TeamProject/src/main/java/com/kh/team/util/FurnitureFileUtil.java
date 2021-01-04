package com.kh.team.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.util.IOUtils;

public class FurnitureFileUtil {

	private static String uploadFileDirectory = "C:/Temp/tpImage";
	
	public static String uploadFile(MultipartFile file, String categoryName) throws Exception {
		//카테고리에 해당하는 디렉토리를 만든다
		String directoryPath = uploadFileDirectory + "/" +  categoryName;
		directoryCheck(directoryPath);
		//기존 파일 이름 xxx.jpg
		String originalName = file.getOriginalFilename();
		//새로만들 파일 이름
		String saveFileName = makeFileName(originalName);
		
		//(저장할 파일,(저장할 디렉토리,새로 저장할 파일이름))
		IOUtils.copy(file.getInputStream(), new FileOutputStream(new File(directoryPath,saveFileName)));
		
		
		return directoryPath+"/"+saveFileName;
	}
	
	private static void directoryCheck(String directoryPath) {
		
		File file = new File(directoryPath);
		//uploadFileDirectory 에 furniture 디렉토리를 만든다
		if(!file.exists()) {
			file.mkdirs();
		}
	}
	
	private static String makeFileName(String originalName) {
		
		System.out.println("originalName:"+originalName);
		int length = originalName.length();
		int dot = originalName.lastIndexOf(".");
		
		//파일 이름 앞부분 가져오기
		String firstName = originalName.substring(0,dot);
		System.out.println("firstName:"+firstName);
		
		//파일 앞부분에 날짜와 UUID추가
		String uuidFileName = addFileName(firstName);
		
		//확장 가져오기
		String expandName = originalName.substring(dot+1, length);
		
		String saveFileName = uuidFileName + "." + expandName;
		return saveFileName;
	}
	
	private static String addFileName(String firstName) {
		UUID uuid = UUID.randomUUID();
		String uuidFileName = firstName + "_" + uuid;
		return uuidFileName;
	}
}