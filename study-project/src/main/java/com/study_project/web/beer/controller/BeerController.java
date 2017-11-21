package com.study_project.web.beer.controller;

import java.util.List;

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

import com.study_project.web.beer.model.Beer;
import com.study_project.web.beer.model.Comment;
import com.study_project.web.beer.model.Like;
import com.study_project.web.beer.service.BeerCommentService;
import com.study_project.web.beer.service.BeerLikeService;
import com.study_project.web.beer.service.BeerService;
import com.study_project.web.user.model.User;

@Controller
@RequestMapping("/beer")
public class BeerController {

	private static final Logger logger = LoggerFactory.getLogger(BeerController.class);

	@Autowired
	private BeerService beerService;
	@Autowired
	private BeerCommentService beerCommentService;
	@Autowired
	private BeerLikeService beerLikeService;

	@RequestMapping(value = "/test", method=RequestMethod.GET)
	public String test(
			) throws Exception{
		return "beer/test";
	}
	@RequestMapping(value = "/test2", method=RequestMethod.GET)
	public String test2(
			) throws Exception{
		return "beer/test2";
	}
	//리스트폼
	@RequestMapping(method=RequestMethod.GET)
	public String list(Model model
			,@RequestParam(value="keyfield", required=false) String keyfield
			,@RequestParam(value="search", required=false) String search
			,@RequestParam(value="pageNo", required=false, defaultValue="1") int pageNo
			,Beer beer
			) throws Exception{
		int totalBeer= (int)Math.ceil((double)beerService.totalBeerCount(beer)/5);
		//		int nameoji= beerService.totalBeerCount(beer)%5;
		//		if(nameoji != 0){
		//			totalBeer=totalBeer+1;
		//		}
		System.out.println("검색어:"+search);
		System.out.println("키필드:"+keyfield);
		System.out.println("현재번호:"+pageNo);
		System.out.println("총번호:"+totalBeer);
		model.addAttribute("totalBeer", totalBeer);
		//		List<Beer> list=beerService.getBeerList(search, keyfield, pageNo);
		List<Beer> list=beerService.getBeerList(beer);
		model.addAttribute("list", list);
		return "beer/beerList";
	}

	//상세페이지폼
	@RequestMapping(value = "/{idx}", method=RequestMethod.GET)
	public String detail(@PathVariable("idx") Integer idx, Model model, HttpSession session) throws Exception{
		User user=(User) session.getAttribute("user");
		Like like=new Like();
		Beer beer=beerService.getBeerOne(idx);
		List<Beer> bf=beerService.getBeerFiles(idx);
		List<Comment> comment=beerCommentService.getCommentList(idx);
		if(user!=null||like.getLike_status()==null){
		like=beerLikeService.getLikeOne(idx, user.getIdx());
		model.addAttribute("like", like);
		}
		model.addAttribute("beer", beer);
		model.addAttribute("bf", bf);
		model.addAttribute("comment", comment);
		
		logger.info("[ 비어정보 ] " + beer.toString());
		logger.info("[ 댓글정보 ] " + comment.toString());
		
		return "beer/beerDetail";
	}

	//글쓰기폼
	@RequestMapping(value = "/board", method=RequestMethod.GET)
	public String writeForm() throws Exception{
		return "beer/beerReg";
	}

	//글쓰기로직
	@RequestMapping(value = "/board", method=RequestMethod.POST)
	public String doWrite(Beer beer 
			, HttpSession session
			//			요청파라미터와 매개변수 이름이 같으면 @RequestParam생략가능
			, MultipartFile thumbnail
			, @RequestParam("media") List<MultipartFile> media
			) throws Exception{
		logger.info("[ welcome beerReg logic ]");
		//자바정규표현식
		//		String title=beer.getTitle();
		//		String ban=title.replaceAll("<[^>]*>", "");
		//		beer.setTitle(ban);
		User user=(User) session.getAttribute("user");
		beer.setUser_id(user.getIdx());
		if(thumbnail.isEmpty()&&media.isEmpty()){
			System.out.println("여기는 글만 있을경우1");
			beerService.writeBeer(beer);
		}
		if(thumbnail.isEmpty()==false||thumbnail.isEmpty()==false&&media.isEmpty()){
			System.out.println("여기는 글+단일 업로드만 있을경우");
			beerService.fileBeer(beer, thumbnail, session);
		}
		if(media.isEmpty()==false){
			System.out.println("여기는 글+다중 업로드만 있을경우");
			beerService.filesBeer(beer, media, session);
		}
		logger.info("[ beerReg toString ] " + beer.toString());
		//html태그막기 자바정규식 필요함
		return "redirect:/beer";
	}

	//글수정폼
	@RequestMapping(value = "/board/{idx}", method=RequestMethod.GET)
	public String modifyForm(@PathVariable("idx") Integer idx, Model model) throws Exception{
		Beer beer=beerService.getBeerOne(idx);
		model.addAttribute("beer", beer);
		return "beer/beerReg";
	}

	//글수정로직
	//PUT과 PATCH차이 PUT은 전체데이터 수정 (즉  insert문이랑 비슷) PATCH는 부분데이터 수정
	@RequestMapping(value = "/board/{idx}", method=RequestMethod.PATCH)
	public String doModify(@PathVariable("idx") Integer idx, Beer beer) throws Exception{
		beerService.modifyBeer(beer);
		logger.info("[ beerReg toString ] " + beer.toString());
		return "redirect:/beer/{idx}";
	}

	//글삭제로직
	//서버에서 삭제 미구현, db에서 삭제만 가능 다중파일에 경우 db에 cesdade 걸어놔서 일괄 삭제댐
	@RequestMapping(value = "/board/{idx}", method=RequestMethod.DELETE)
	public String doRemove(@PathVariable("idx") Integer idx,HttpSession session) throws Exception{
		beerService.removeBeer(idx, session);
		return "redirect:/beer";
	}

	//글검색로직
	//	@RequestMapping(value = "/search/{search}", method=RequestMethod.GET)
	//	public String search(Model model, @PathVariable(value="search") String search) throws Exception{
	//		List<Beer> list=beerService.searchList(search);
	//		model.addAttribute("list", list);
	//		return "beer/beerList";
	//	}
}
