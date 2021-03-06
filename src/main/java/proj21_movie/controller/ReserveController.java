package proj21_movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_movie.service.MovieService;
import proj21_movie.service.TheaterService;

@Controller
public class ReserveController {
	
	@Autowired
	private MovieService movService;
	
	@Autowired
	private TheaterService thtService;
	
	@RequestMapping("/reserve")
	public String reserve(Model model) {
		model.addAttribute("getMovieList", movService.getMovieBoxOfficeLists());
		model.addAttribute("getTheaterList", thtService.getLists());
		
		return "reserve/reserve";
	}
	
	@RequestMapping("/seat")
	public String seat() {
		return "reserve/seat";
	}
	
	@RequestMapping("/payment")
	public String payment() {
		return "reserve/payment";
	}
	
	@RequestMapping("/resultpay")
	public String result() {
		return "reserve/resultpay";
	}
	
	
}
