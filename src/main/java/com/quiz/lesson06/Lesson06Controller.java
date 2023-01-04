package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;
@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Controller {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	//즐겨찾기 화면 
	// http://localhost/lesson06/quiz01/add_favorite_view
	@GetMapping("/add_favorite_view")
	public String favorite_view() {
		return "lesson06/quiz01/addFavorite";
		
	}
	
	// 추가
	@ResponseBody
	@PostMapping("/add_favorite")
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		
		//db insert
		favoriteBO.addFavorite(name, url);
		
		return "성공";
		
	}
	
	//목록화면
	@GetMapping("/after_add_favorite_view")
	public String afterFavorite(Model model) {
		
		List<Favorite> favorite = favoriteBO.getFavorite(); //model에 담기
		model.addAttribute("favorite", favorite); 
		model.addAttribute("title", "즐겨 찾기 목록");

		return "lesson06/quiz01/afterAddFavorite";
}

}
