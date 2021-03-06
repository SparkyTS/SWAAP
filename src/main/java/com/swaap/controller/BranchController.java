package com.swaap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.swaap.model.BranchVO;
import com.swaap.model.CityVO;
import com.swaap.service.BranchService;
import com.swaap.service.CityService;
import com.swaap.service.StateService;

@Controller
public class BranchController {
	@Autowired
	StateService stateService;
	
	@Autowired
	CityService cityService;
	
	@Autowired
	BranchService branchService;
	
	@RequestMapping(value="mall/addBranch", method=RequestMethod.GET)
	public ModelAndView addBranch(Model model)
	{
		List StateList=this.stateService.searchState();
		List CityList=this.cityService.searchCity();
		model.addAttribute("stateList",StateList);
		model.addAttribute("cityList",CityList);
		model.addAttribute("branchVO", new BranchVO());
		return new ModelAndView("mall/addBranch");
	}
	
	@RequestMapping(value="mall/saveBranch", method=RequestMethod.POST)
	public ModelAndView saveBranch(@ModelAttribute BranchVO branchVO)
	{
		branchVO.setStatus(true);
		this.branchService.insertBranch(branchVO);
		return new ModelAndView("redirect:mall/viewBranch");
	}
	
	@RequestMapping(value="mall/viewBranch", method=RequestMethod.GET)
	public ModelAndView viewBranch(@ModelAttribute BranchVO branchVO)
	{
		List branchList=this.branchService.searchBranch();
		return new ModelAndView("mall/viewBranch","branchList",branchList);
	}
	
	@RequestMapping(value="mall/deleteBranch", method=RequestMethod.GET)
	public ModelAndView deleteBranch(@ModelAttribute BranchVO branchVO, @RequestParam int findById)
	{
		branchVO.setId(findById);
		List branchList=this.branchService.editBranch(branchVO);
		BranchVO foundBranchVO=(BranchVO)branchList.get(0);
		foundBranchVO.setStatus(false);
		this.branchService.insertBranch(foundBranchVO);
		return new ModelAndView("redirect:mall/viewBranch");
	}
	
	@RequestMapping(value="mall/updateBranch", method=RequestMethod.GET)
	public ModelAndView updateBranch(@ModelAttribute BranchVO branchVO, @RequestParam int findById, Model model)
	{
		branchVO.setId(findById);
		List branchList=this.branchService.editBranch(branchVO);
		List StateList=this.stateService.searchState();
		List CityList=this.cityService.searchCity();
		model.addAttribute("branchVO",(BranchVO)branchList.get(0));
		model.addAttribute("stateList",StateList);
		model.addAttribute("cityList",CityList);
		return new ModelAndView("mall/addBranch");
	}
}
