package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	
	// 추가 -AJAX 통신 요청(모델이 전혀 없다.) 
	@ResponseBody
	@PostMapping("/add_favorite")
	public Map<String, String> addFavorite( // 여기서 String은 view화면이 아니라 내리고자하는 단어
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		
		//db insert
		favoriteBO.addFavorite(name, url);
		
			
		// 성공 값 응답 값
		Map<String, String> result = new HashMap<>();
		result.put("result", "성공");
		return result;  // jackson => JSON (키밸류로 나눠지는 String)
		
	}
	
	//http://localhost/lesson06/quiz01/after_add_favorite_view
	//목록화면
	@GetMapping("/after_add_favorite_view")
	public String afterFavorite(Model model) {
		
		//select하기
		List<Favorite> favorite = favoriteBO.getFavorite(); 
		//model에 담기
		model.addAttribute("favorite", favorite); 
		model.addAttribute("title", "즐겨 찾기 목록");

		return "lesson06/quiz01/afterAddFavorite";
	}
	
	//주소 중복확인 - AJAX 통신 요청 (model 못 씀)
	@ResponseBody
	@PostMapping("/is_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url){
		
		Map<String, Boolean> result = new HashMap<>();
		//중복확인 select
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		if (favorite != null) {
			//중복일 때 
			result.put("is_duplication", true);
		} else { 
			result.put("is_duplication", false);
		}
		//응답값 내리기
		return result;
	}
	
	// 즐겨찾기 삭제하기 - AJAX 요청(Model안됌)
	@ResponseBody
	@DeleteMapping("/delete") 
	public Map<String, Object> deleteFavorite(
			@RequestParam("id") int id
			) {
		
		//json으로 이쁘게 보이게 하려구 키, 밸류로 넣는것.
		Map<String, Object> result = new HashMap<>();
		//delete하기
		int row = favoriteBO.deleteFavoriteById(id);
		if (row > 0) {
			//성공 
			result.put("code", 1); //임의로 지은 성공 번호
			result.put("result", "성공"); 
		} else {
			//실패
			result.put("code", 500);
			result.put("result", "실패");
			result.put("error_messege", "삭제 된 행이 없습니다");
		}
		return result;
	}
	
	
	

}
