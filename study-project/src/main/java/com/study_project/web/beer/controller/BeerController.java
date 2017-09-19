package com.study_project.web.beer.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study_project.web.beer.model.Beer;
import com.study_project.web.beer.service.BeerService;

@Controller
@RequestMapping("/beer")
public class BeerController {
	
	private static final Logger logger = LoggerFactory.getLogger(BeerController.class);
	
	@Autowired
	private BeerService beerService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String list(Model model) throws Exception{
		List<Beer> list=beerService.getBeerList();
		model.addAttribute("list", list);
		return "beer/beerList";
	}
	
	@RequestMapping(value = "/{idx}", method=RequestMethod.GET)
	public String detail(@PathVariable("idx") Integer idx, Model model) throws Exception{
		Beer beer=beerService.getBeerOne(idx);
		model.addAttribute("beer", beer);
		return "beer/beerDetail";
	}
	
	@RequestMapping(value = "/board", method=RequestMethod.GET)
	public String writeForm() throws Exception{
		return "beer/beerReg";
	}
	
	@RequestMapping(value = "/board", method=RequestMethod.POST)
	public String doWrite(Beer beer 
//			,@RequestParam("mediaFile") List<MultipartFile> files
			) throws Exception{
		beerService.writeBeer(beer);
		logger.info("[ beerReg toString ] " + beer.toString());
		return "redirect:/beer";
	}
	
	//PUT과 PATCH차이 PUT은 전체데이터 수정 (즉  insert문이랑 비슷) PATCH는 부분데이터 수정
	@RequestMapping(value = "/board/{idx}", method=RequestMethod.PATCH)
	public String doModify(@PathVariable("idx") Integer idx, Beer beer) throws Exception{
		beerService.modifyBeer(beer);
		return "redirect:/beer";
	}
	
	@RequestMapping(value = "/board/{idx}", method=RequestMethod.DELETE)
	public String doRemove(@PathVariable("idx") Integer idx) throws Exception{
		beerService.removeBeer(idx);
		return "redirect:/beer";
	}
}
