package com.quiz.lesson06;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {
	
	//즐겨찾기 화면 
	@GetMapping("/quiz01/add_favorite_view")
	public String favorite_view() {
		return "/lesson06/quiz01/addFavorite";
		
	}
	
	@PostMapping("/quiz01/add_favorite")
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		
	}
	

}
