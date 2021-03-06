package com.study_project.web.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	
	/*소주 썸네일 이미지파일 경로*/
	public static final String SojuThumbnailPath = "C:" + File.separator + "webFile" + File.separator + "soju" + File.separator + "thumbnail";
	/*소주 상품소개 이미지 경로(다중)*/
	public static final String SojuproductImagePath = "C:" + File.separator + "webFile" + File.separator + "soju" + File.separator + "productImage";

	/**
	 * MultipartFile 객체를 File 객체로 변환.
	 * @param multipart
	 * @return convertFile
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException {
		File convertFile = new File(multipart.getOriginalFilename());
		multipart.transferTo(convertFile);
		return convertFile;
	}
	
	/**
	 * 서버에 업로드 될 파일이름 생성
	 * @param ntmPid
	 * @param path
	 * @param originalFileName
	 * @return serverFile
	 */
	public String makeServerFileName(String bizNo, String originalFileName) {
		int extIdx = originalFileName.lastIndexOf(".");
		String ext = "";
		if (extIdx > 0) {
			ext = originalFileName.substring(extIdx);
		}
		
		String serverFileName = bizNo + "_"
				+ String.valueOf(System.currentTimeMillis()) + "_"
				+ String.format("%04d", (int)(Math.random()*10000))
				+ ext;
		
		return serverFileName;
	}
	
	/**
	 * 서버에 업로드 될 파일이름중 ntmPid 를 대체할 시간 데이터 생성
	 * @param path
	 * @param originalFileName
	 * @return date
	 */
	public String getStrNowTime() {
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH);		String strMonth = getTimePositionalNumber(month);
	    String ymdhms = year+strMonth;
	    
	    return ymdhms;
	}
	private String getTimePositionalNumber(int val){
		String retStr = "";
		if(val < 10)	retStr = "0"+val;
		else			retStr = ""+val;
		
		return retStr;
	}
	
	
	/**
	 * 서버로 파일 업로드
	 * @param multipartFile
	 * @param serverPath
	 * @param serverFileName
	 * @return uploadResult
	 */
	public boolean uploadFile(MultipartFile multipartFile, String serverPath, String serverFileName) {
		boolean uploadResult = false;
		FileOutputStream fos = null;
		
		try {
			byte[] fileData = multipartFile.getBytes();
	    	fos = new FileOutputStream(serverPath + File.separator  + serverFileName);
	    	fos.write(fileData);
	    	uploadResult = true;
		} catch(Exception e) {
			e.printStackTrace();
			uploadResult = false;
		} finally {
			if (fos != null) {
				try {
					fos.close();
				}
				catch (Exception e) {
					e.printStackTrace();
					uploadResult = false;
				};	
			}
		}
		return uploadResult;
	}
	
	
	/**
	 * 파일 삭제
	 * @param path
	 * @param fileName
	 * @return deleteResult
	 */
	public boolean deleteFile(String path, String fileName) {
		System.out.println("<><> deleteFile()");
		System.out.println("<><> path        >> "+path);
		System.out.println("<><> fileName    >> "+fileName);
		
		boolean deleteResult = false;
		try {
			if (path == null || path.trim().length() == 0) {
				throw new Exception("Empty path.");
			} else if (fileName == null || fileName.trim().length() == 0) {
				throw new Exception("Empty file name.");
			} else {
				File file = new File(path, fileName);
				System.out.println("파일유틸 = " + file);
				System.out.println("<><> FullPath    >> "+file.getAbsolutePath());
				
				boolean isFileExist = file.exists();
				System.out.println("<><> isFileExist >> "+isFileExist);
				if (isFileExist) {
					file.delete();
				} else {
					throw new Exception("File not exists.");
				}
				deleteResult = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return deleteResult;
	}
	
	/**
	 * 서버경로+서버파일이름 에서 서버파일경로 뽑아내기
	 * @param path
	 * @param fileName
	 * @return deleteResult
	 */
	public String filePathSearch (String ServerFileName) {
		int i =  ServerFileName.indexOf("_");
		
		//파일경로 뽑아내기
		String filePath = ServerFileName.substring(0,i);
		return filePath;
	}
	
	/**
	 * 서버경로+서버파일이름 에서 서버파일이름 뽑아내기
	 * @param path
	 * @param fileName
	 * @return deleteResult
	 */
	public String fileNameSearch (String ServerFileName) {
		int i = ServerFileName.indexOf("_");
		
		//파일이름 뽑아내기
		String fileName = ServerFileName.substring(i+1);
		return fileName;
	}
	
	/**
	 * 파일 확장자명 뽑아내기
	 * @param fileName
	 * @return transFileName
	 */
	public String fileTypeTrans (String fileName) {
		int name = fileName.indexOf(".");
		
		String transName = fileName.substring(name+1);
		
		return transName;
	}
	
}