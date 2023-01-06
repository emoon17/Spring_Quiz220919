package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;
@RequestMapping("/lesson06/quiz03")
@Controller
public class BookingController {

	
	@Autowired
	private BookingBO bookingBO;
	
	//메인화면(view) 보기
	@GetMapping("/booking_main_view")
	public String bookingMain() {
		return "lesson06/quiz03/bookingMain";
	}
	
	//목록화면(view) 보기
	@GetMapping("/booking_list_view")
	public String bookingList(Model model) {
		
		
		//select
		List<Booking> bookingList = bookingBO.getBookingList();
		//model에 담기
		model.addAttribute("bookingList", bookingList);
		//응답 값 내리기
		return "lesson06/quiz03/bookingList";
	}
	
	// 삭제하기 - ajax통신
	@ResponseBody
	@DeleteMapping("/delete_booking")
	public Map<String, Integer> deleteBooking(
			@RequestParam("id") int id){
		
		Map<String, Integer> result = new HashMap<>();
		//delete -row가 0 이상 // 성공 0 이하 실패
		int row = bookingBO.deleteBooking(id);
		if(row > 0) {
			result.put("result", 1);
		} else {
			result.put("result", 500);
		}
		
		
		//응답값내리기 
		return result;
		
	}
}
