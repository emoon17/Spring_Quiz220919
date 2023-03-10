package com.quiz.lesson06;

import java.util.Date;
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
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id){
		
		Map<String, Object> result = new HashMap<>();
		//delete -row가 0 이상 // 성공 0 이하 실패
		int row = bookingBO.deleteBooking(id);
		if(row > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
		}
		
		
		//응답값내리기 
		return result;
		
	}
	
	// insert view보기
	@GetMapping("/add_booking_view")
	public String booking_view() {
		return "lesson06/quiz03/addBooking";
	}
	
	// insert하기 -axax 통신
	@ResponseBody
	@PostMapping("/add_booking")
	public Map<String, Object> addBooking(
			@RequestParam("name") String name,
			@RequestParam("headcount") int headcount,
			@RequestParam("day") int day,
			@RequestParam("date") Date date,
			@RequestParam("phoneNumber") String phoneNumber){
		
		
		//db insert
		bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		//응답값 내리기
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	// AJAX 예약확인  alert띄우기 - 젤 최신 것만 가져오기 
	@ResponseBody
	@PostMapping("/check_booking")
	public Map<String, Object> checkBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber
			){
		
		//select - 최신 예약 정보 한 건 
		Booking booking = bookingBO.getLastestCheckBooking(name, phoneNumber);
		
		//응답 값 내리기
		Map<String, Object> result = new HashMap<>();
		if (booking != null) {
			// 성공이면
			result.put("booking", booking); // 객체 통으로 집어 넣을 수 있음 (model 대신 사용)
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		
		return result;
		
		
	}
	
	
}
