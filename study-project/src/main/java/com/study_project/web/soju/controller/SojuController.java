package com.study_project.web.soju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.study_project.web.soju.model.Soju;
import com.study_project.web.soju.model.SojuComment;
import com.study_project.web.soju.service.SojuCommentService;
import com.study_project.web.soju.service.SojuService;
import com.study_project.web.user.model.User;
import com.study_project.web.util.FileUtil;
import com.study_project.web.util.Pager;


@Controller
@RequestMapping("/soju")
public class SojuController {
	
	private static final Logger logger = LoggerFactory.getLogger(SojuController.class);
	
	@Autowired
	private SojuService sojuService;
	
	@Autowired
	private SojuCommentService sojuCommentService;
	
	//글목록
	@RequestMapping(value="soju.html", method = RequestMethod.GET)
	public String sojuList (HttpSession session, Model model,
			@RequestParam(value="pageNo", defaultValue = "0", required = false) int pageNo,
			@RequestParam(value="blockNo", defaultValue = "0", required = false) int blockNo,
			@RequestParam(value="searchCol", required = false) String searchCol,
			@RequestParam(value="searchVal", required = false) String searchVal) throws Exception {
		logger.info("[ welcome soju ]");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("pageNo", (int)(pageNo * Pager.PAGE_SIZE));
		paramMap.put("pageSize", Pager.PAGE_SIZE);
		
		paramMap.put("searchCol", searchCol);
		paramMap.put("searchVal", searchVal);
		
		List<Soju> sojuList = sojuService.selectSojuList(paramMap);
		
		for (Soju soju : sojuList) {
			String fileName = soju.getThumbnail();
			System.out.println("파일이름 = " + fileName);
			logger.info(soju.toString());
		}
		
		int totalRecord = sojuService.count(paramMap);
		int totalPage = (int)Math.ceil((double)totalRecord / Pager.PAGE_SIZE);
		int totalBlock = (int)Math.ceil((double)totalPage / Pager.PAGE_PER_BLOCK);
		
		model.addAttribute("selectPage", pageNo);
		model.addAttribute("selectBlock", blockNo);
		
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalBlock", totalBlock);
		
		model.addAttribute("searchCol", searchCol);
		model.addAttribute("searchVal", searchVal);
		
		model.addAttribute("sojuList", sojuList);
		return "/soju/sojuList";
	}
	
	//상세보기 입력폼전환
	@RequestMapping(value="/{idx}", method = RequestMethod.GET)
	public String detailForm (@PathVariable("idx") Integer idx, Model model, HttpSession session) throws Exception {
		logger.info("[ welcome sojuDetailForm ]");
		User user = (User)session.getAttribute("user");
//		if (user == null) {
//			String loginAdvice = "로그인 후 이용하실 수 있습니다. 로그인 해주세요.";
//			model.addAttribute("loginAdvice", loginAdvice);
//			return "/user/login";
//		}
		String loginUserCheck = user.getName();
		String sojuLike = "N";
		sojuLike = sojuService.sojuLikeSelect(idx, session);
		Soju soju = sojuService.getSoju(idx);
		List<Soju> sojuFileList = sojuService.selectSojuFile(idx);
		List<SojuComment> sojuCommentList = sojuCommentService.selectSojuCommentList(idx);
		Integer sojuCommentCount = sojuCommentService.count(idx);
		
		model.addAttribute("sojuLike", sojuLike);
		model.addAttribute("sojuCommentCount", sojuCommentCount);
		model.addAttribute("sojuCommentList", sojuCommentList);
		model.addAttribute("soju", soju);
		model.addAttribute("sojuFile",sojuFileList);
		model.addAttribute("loginUserCheck", loginUserCheck);
		return "/soju/sojuDetail";
	}
	
	@RequestMapping(value="/test.html", method = RequestMethod.GET)
	public String test () {
		return "/soju/note";
	}
	
	//드래그 페이지전환
	@RequestMapping(value="/dragAndDrop.html", method = RequestMethod.GET)
	public String dragAndDrop (HttpSession session, Model model) throws Exception {
		return "/soju/test";
	}
	
	
	//글쓰기로 페이지전환
	@RequestMapping(value="/board", method = RequestMethod.GET)
	public String insertForm (HttpSession session, Model model) throws Exception {
		logger.info("[ welcome sojuReg ]");
		return "/soju/sojuReg";
	}
	
	//수정하기로 페이지전환
	@RequestMapping(value="/board/{idx}", method = RequestMethod.GET)
	public String modifyForm (@PathVariable(value="idx") Integer idx, Model model) throws Exception {
		logger.info("[ wecome sojuModifyForm ]");
		Soju soju = sojuService.getSoju(idx);
		model.addAttribute("soju", soju);
		return "/soju/sojuReg";
	}
	
	//글쓰기 로직 수행
	@RequestMapping(value="/board", method = RequestMethod.POST)
	public String insert (HttpSession session, Soju soju
			, HttpServletRequest request, HttpServletResponse response
			, @RequestParam("file") MultipartFile multipart) throws Exception {
		logger.info("[ welcome sojuReg logic ]");
		FileUtil fileUtil = new FileUtil();
		try{
			if (! (request instanceof MultipartHttpServletRequest)) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Expected multipart requeest");
				return null;
			}
			String thumbnailO_name = multipart.getOriginalFilename();
			String thumbnailS_name = fileUtil.makeServerFileName(fileUtil.getStrNowTime(), thumbnailO_name);
			soju.setThumbnail(thumbnailS_name);
			Integer insertSojuResult = sojuService.insertSoju(soju);
			if (insertSojuResult == 1) {
				fileUtil.uploadFile(multipart, fileUtil.SojuThumbnailPath, thumbnailS_name);
			}
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			for (String fileName : multipartRequest.getFileMap().keySet()) {
				for (MultipartFile file : multipartRequest.getFiles(fileName)) {
					String O_name = file.getOriginalFilename();
					if (file.getSize() != 0) {
						if (O_name == thumbnailO_name) continue;
						//시간+파일이름 이름을 만듬
						String transFileName = fileUtil.makeServerFileName(fileUtil.getStrNowTime(), O_name);
						soju.setOriginal_name(O_name);
						soju.setTrans_name(transFileName);
						soju.setFile_path(fileUtil.SojuproductImagePath);
						soju.setFile_size(file.getSize());
						soju.setSoju_idx(soju.getIdx());
						soju.setContent_type(fileUtil.fileTypeTrans(O_name));
						fileUtil.uploadFile(file, fileUtil.SojuproductImagePath, transFileName);
						sojuService.insertSojuFile(soju);
					}
					
				}
			}
			logger.info("[ sojuReg toString ] " + soju.toString());
		} catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/soju/soju.html";
	}
	
	@RequestMapping(value="/board/{idx}", method = RequestMethod.PATCH)
	public String modify (@PathVariable("idx") Integer idx, Soju soju) throws Exception {
		sojuService.updateSoju(soju);
		return "redirect:/soju/soju.html";
	}
	
	//삭제 로직 수행
	@RequestMapping(value="/board/{idx}", method = RequestMethod.DELETE)
	public String delete (@PathVariable("idx") Integer idx, Soju soju1) throws Exception {
		logger.info("[ welcome sojuDelete ]");
		FileUtil fileUtil = new FileUtil();
		
		List<Soju> sojuFileList = sojuService.selectSojuFile(idx);
		
		if (idx != null) {
			boolean fileDelete = false;
			//썸네일 이미지 삭제
			Soju sojuDetail = sojuService.getSoju(idx);
			soju1.setThumbnail(sojuDetail.getThumbnail());
			boolean thumbnailDelete = fileUtil.deleteFile(fileUtil.SojuThumbnailPath, soju1.getThumbnail());
			if (thumbnailDelete == true) {
				//상품소개(다중) 삭제
				for (Soju soju : sojuFileList) {
					logger.info("logger file idx tostring = " + sojuFileList.get(0).getFile_idx());
					fileDelete =fileUtil.deleteFile(fileUtil.SojuproductImagePath, soju.getTrans_name());
				}
			}
			if (fileDelete == true) {
				sojuService.deleteSoju(idx);
			}
		}
		return "redirect:/soju/soju.html";
	}
	
	//상품평 입력
	@RequestMapping(value="/board/{idx}/comment", method = RequestMethod.POST)
	public String commentInsert (@PathVariable("idx") Integer idx,Model model, SojuComment sojuComment,HttpSession session) throws Exception {
		logger.info(" [ welcome soju Insert Comment ] ");
		try {
			User user = (User)session.getAttribute("user");
			sojuComment.setId(user.getName());
			if (user.getName() == null) {
				return "/user/login.html";
			}
			sojuComment.setSoju_idx(idx);
			sojuCommentService.insertSojuComment(sojuComment);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		return detailForm(idx,model,session);
		return "redirect:/soju/{idx}";
	}
	
	//상품평 삭제
	@RequestMapping(value="/board/{idx}/comment/{commentidx}", method = RequestMethod.POST)
	public String commentDelete (@PathVariable("idx") Integer idx
			, @PathVariable("commentidx") Integer commentidx, Model model, HttpSession session) throws Exception {
		logger.info(" [ welcome soju Delete Comment ] ");
		SojuComment sojuComment = new SojuComment();
		sojuComment.setIdx(commentidx);
		sojuComment.setSoju_idx(idx);
		sojuCommentService.deleteSojuComment(sojuComment);
		
//		return detailForm(idx,model,session);
		return "redirect:/soju/{idx}";
	}
	
	@RequestMapping(value="/board/{idx}/comment/{commentidx}/modify/", method = RequestMethod.POST)
	public String commentModify (@PathVariable("idx") Integer idx
			, @PathVariable("commentidx") Integer commentidx
			, @RequestParam("edit") String edit
			, Model model, HttpSession session, SojuComment sojuComment) throws Exception {
		logger.info(" [ welcome soju Modify Comment ] ");
		logger.info(" [ SojuComment Model > ]" + sojuComment);
		sojuComment.setContents(edit);
		sojuComment.setIdx(commentidx);
		sojuComment.setSoju_idx(idx);
		sojuCommentService.updateSojuComment(sojuComment);
		
//		return detailForm(idx,model,session);
		return "redirect:/soju/{idx}";
	}
	
	
	
}
