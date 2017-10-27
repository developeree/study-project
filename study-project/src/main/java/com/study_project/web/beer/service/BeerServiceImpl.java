package com.study_project.web.beer.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.study_project.web.beer.model.Beer;
import com.study_project.web.mapper.sqlMap.BeerDao;

@Service
public class BeerServiceImpl implements BeerService{
	@Autowired
	private BeerDao beerDao;

	//	@Override
	//	public List<Beer> getBeerList(String search, String keyfield, int pageNo) throws Exception{
	//		pageNo=(pageNo-1)*5;
	//		return beerDao.readBeerList(search, keyfield, pageNo);
	//	}


	@Override
	public List<Beer> getBeerList(Beer beer) throws Exception{
		return beerDao.readBeerList(beer);
	}


	@Override
	public Beer getBeerOne(Integer idx) throws Exception{
		return beerDao.readBeerOne(idx);
	}

	@Override
	public void writeBeer(Beer beer) throws Exception{
		//		beerDao.createMediaFile(beer);
		beerDao.createBeer(beer);
	}

	@Override
	public void modifyBeer(Beer beer) throws Exception{
		beerDao.updateBeer(beer);
	}

	@Override
	public void removeBeer(Integer idx) throws Exception{
		beerDao.deleteBeer(idx);
	}

	//	@Override
	//	public List<Beer> searchList(String search,String keyfield) throws Exception{
	//		return beerDao.searchBeer(search,keyfield);
	//	}

	//	@Override
	//	public int totalBeerCount(String search,String keyfield) throws Exception{
	//		return beerDao.totalBeerCount(search, keyfield);
	//	}

	@Override
	public int totalBeerCount(Beer beer) throws Exception{
		return beerDao.totalBeerCount(beer);
	}


	@Override
	public void fileBeer(Beer beer,  MultipartFile thumbnail, HttpSession session) throws Exception {
		//서버경로
		String root_path = session.getServletContext().getRealPath("/"); 
		String attach_path = "files/";

		//지정경로
		//        String save_path = "D:/Leejh/study_project_files/"; 

		//      단일업로드
		String filename = thumbnail.getOriginalFilename();
		//익플이나 엣지는 c:\바탕화면\111.jpg 이런식으로 풀경로 가져와서 짤라서 가져와야댐 시벌 \한개로 안짤리고 \\해야 짤림허허허허..
		int lastIndex = filename.lastIndexOf("\\");
		String cutname = filename.substring(lastIndex+1);
		System.out.println("파일명: "+filename);
		System.out.println("짜른명: "+cutname);
		File f = new File(root_path+attach_path+cutname);
		//		File f = new File(save_path+filename);
		System.out.println("루트: "+f);
		try {
			thumbnail.transferTo(f);
			if(filename!=null){
				beer.setThumb(cutname);
				beerDao.createBeer(beer);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}


	@Override
	public void filesBeer(Beer beer, List<MultipartFile> media, HttpSession session) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());

		//		지정경로
		String save_path = "D:/Leejh/study_project_files/"; 
		//    다중업로드
		for(int i=0; i<media.size(); i++){
			String filename = media.get(i).getOriginalFilename();
			String contentType=media.get(i).getContentType();
			Long fileSize=media.get(i).getSize();
			//익플이나 엣지는 c:\바탕화면\111.jpg 이런식으로 풀경로 가져와서 짤라서 가져와야댐 시벌 \한개로 안짤리고 \\해야 짤림허허허허..
			int lastIndex = filename.lastIndexOf("\\");
			String transName = filename.substring(lastIndex+1);
			System.out.println("파일명: "+filename);
			System.out.println("짜른명: "+transName);
			System.out.println("파일타입: "+contentType);
			System.out.println("파일크기: "+fileSize);
			System.out.println("글번호: "+beer.getIdx());
			System.out.println("현재시간: "+strToday);
			File f = new File(save_path+strToday+"_"+filename);
			String filePath=f.getAbsolutePath();
			System.out.println("루트: "+f);
			try {
				media.get(i).transferTo(f);
				if(filename!=null){
					beer.setOriginal_name(filename);
					beer.setTrans_name(transName);
					beer.setContent_type(contentType);
					beer.setFile_size(fileSize);
					beer.setFile_path(filePath);
					beer.setBeer_id(beer.getIdx());
					beerDao.createMediaFile(beer);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
