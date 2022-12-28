package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;



@RequestMapping("lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {

	@Autowired
	private SellerBO sellerBO;
	
	//http://localhost/lesson04/quiz01/add_seller_view
	@GetMapping("/add_seller_view")
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	//판매자 insert => 입력성공 jsp
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam(value="temperature", required=false) Double temperature) { // Double로 하면 null이 들어갈 수 있음.
		
		// db insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		// 응답값 jsp
		
		return "lesson04/afterAddSeller";
		
	}
	
	//-2)http://localhost/lesson04/quiz01/seller_info
	//-3)http://localhost/lesson04/quiz01/seller_info?id=1
	
	// db select 가장 최근 seller정보 jsp
	
	@GetMapping("/seller_info")
	public String getLastSellerView(
			@RequestParam(value="id", required=false) Integer id,
			Model model) {
		//db select
		Seller seller = null;
		if (id == null) {
			seller = sellerBO.getLastSeller();
		} else { 
			seller = sellerBO.getSellerById(id);
		}
		model.addAttribute("seller", seller);
		return "lesson04/getLastSeller";
	}
	
	
	
	
}
