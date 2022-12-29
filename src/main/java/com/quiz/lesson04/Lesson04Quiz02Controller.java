package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {

	@Autowired
	private RealtorBO realtorBO;
	
	// 입력 form URL : http://localhost/lesson04/quiz02/add_realtor_view
	@GetMapping("/add_realtor_view")
	public String quiz02() {
		return "/lesson04/addRealtor";
	}
	
	//action URL : http://localhost/lesson04/quiz02/add_realtor
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model) {
		
		//db insert
		realtorBO.addRealtor(realtor);
		//db select(방금 가입 된 사람)
		Realtor realtor1 = realtorBO.getLastRealtor(realtor.getId());
		//view와 매핑하기 위한 model주머니 사용
		model.addAttribute("result", realtor1);
		model.addAttribute("title", "공인중개사 정보");
		// view 응답 (jsp)
		return "lesson04/afterRealtor";
	}
	
}
