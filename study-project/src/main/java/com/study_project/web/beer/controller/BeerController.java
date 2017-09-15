package com.study_project.web.beer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study_project.web.beer.service.BeerService;

@Controller
@RequestMapping("/beer")
public class BeerController {
	@Autowired
	private BeerService beerService;

	@RequestMapping(method=RequestMethod.GET)
	public String list() throws Exception{
		return "beer/beerList";
	}
	
//	@RequestMapping(value = "/new", method=RequestMethod.GET)
//	public String writeForm() throws Exception{
//		return "beer/beerReg";
//	}
//	@RequestMapping(value = "/new", method=RequestMethod.POST)
//	public String write(Beer beer, Model model) throws Exception{
//		beerService.writeBeer(beer);
//		return "redirect:beer/beerList";
//	}
}
