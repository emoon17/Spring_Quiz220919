package com.quiz.lesson06;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/lesson06/quiz03")
@Controller
public class BookingController {

	//메인 보기
	@GetMapping("/booking_main_view")
	public String bookingMain() {
		return "lesson06/quiz03/bookingMain";
	}
}
