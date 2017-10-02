package com.study_project.web.util;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class Pager {
	
	/* 블럭 당 페이지의 갯수. 한 블럭 당 페이지는 10개 */
	public static final int PAGE_PER_BLOCK = 10;
	
	/* 페이지 내용(목록)의 갯수. 한 페이지에 10 항목을 출력 */
	public static final int PAGE_SIZE = 10;
	
	/* 이미지 게시판 블럭당 페이지의 갯수 . 한블럭당 페이지는 10게 */
	public static final int IMAGE_PAGE_PER_BLOCK = 10;
	
	/* 이미지 게시판에 내용(목록)의 갯수. 한페이지에 30항목을 출력  */
	public static final int IMAGE_PAGE_SIZE = 10;
	
	
	public Pager() {
		// TODO Auto-generated constructor stub
	}

	public Map<String, Object> paramMap(HttpServletRequest req, String[] columnArr) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String uri = req.getQueryString();
			map.put("orderCol", columnArr[0]);
			map.put("orderVal", "desc");
			map.put("limit", 30);
			
			if(uri != null && !uri.isEmpty()) {
				uri = URLDecoder.decode(uri, "UTF-8");
				String [] uriArr = uri.split("&");
				
				for(int i = 0; i < uriArr.length; i++) {
					String [] itemArr = uriArr[i].split("=");
					String strKey = itemArr[0];
					String strValue = itemArr[1];
					
					if(strKey.equals("orderNo")) {
						map.put("orderCol", columnArr[Integer.parseInt(strValue)]);
						req.setAttribute(strKey, strValue);
					} else if(strKey.equals("orderVal")) {
						map.put(strKey, strValue);
						req.setAttribute(strKey, strValue);
					} else if(strKey.equals("searchNo")) {
						map.put("searchCol", columnArr[Integer.parseInt(strValue)]);
						req.setAttribute(strKey, strValue);
					} else if(strKey.equals("searchVal")) {
						map.put(strKey, strValue);
						req.setAttribute(strKey, strValue);
					}
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	public Map<String, Object> scrollMap(String uri, String[] columnArr, int offset) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("orderCol", columnArr[0]);
			map.put("orderVal", "desc");
			map.put("limit", 10);
			map.put("offset", offset);
			
			if(uri != null && !uri.isEmpty()) {
				uri = uri.substring(1, uri.length());
				uri = URLDecoder.decode(uri, "UTF-8");
				String [] uriArr = uri.split("&");
				for(int i = 0; i < uriArr.length; i++) {
					String [] itemArr = uriArr[i].split("=");
					String strKey = itemArr[0];
					String strValue = itemArr[1];
					System.out.println(strKey+"/"+strValue);
					if(strKey.equals("orderNo")) {
						map.put("orderCol", columnArr[Integer.parseInt(strValue)]);
					} else if(strKey.equals("orderVal")) {
						map.put(strKey, strValue);
					} else if(strKey.equals("searchNo")) {
						map.put("searchCol", columnArr[Integer.parseInt(strValue)]);
					} else if(strKey.equals("searchVal")) {
						map.put(strKey, strValue);
					}
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	
}
