package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.WeatherBO;
import com.quiz.lesson05.model.Member;
import com.quiz.lesson05.model.WeatherHistory;

import jakarta.servlet.http.HttpServletResponse;

@RequestMapping("/lesson05/quiz")
@Controller
public class Lesson05QUizController {

	@Autowired
	private WeatherBO weatherBO;

	// http://localhost/lesson05/quiz/1
	@GetMapping("/1")
	public String quiz01() {
		return "/lesson05/quiz01";
	}

	@GetMapping("/2")
	public String quiz02(Model model) {
		List<String> musicRanking = new ArrayList<>();
		musicRanking.add("강남스타일");
		musicRanking.add("벚꽃엔딩");
		musicRanking.add("좋은날");
		musicRanking.add("거짓말");
		musicRanking.add("보고싶다");

		// model에 담기
		model.addAttribute("musicRanking", musicRanking);
		return "lesson05/quiz02";
	}

	@GetMapping("/2_1")
	public String quiz03(Model model) {
		List<Map<String, Object>> membership = new ArrayList<>();

		Map<String, Object> member = new HashMap<>();
		member.put("name", "손오공");
		member.put("phoneNumber", "010-1234-5678");
		member.put("grade", "VIP");
		member.put("point", 12040);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "저팔계");
		member.put("phoneNumber", "010-4321-1234");
		member.put("grade", "BASIC");
		member.put("point", 3420);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "사오정");
		member.put("phoneNumber", "010-8888-1111");
		member.put("grade", "GOLD");
		member.put("point", 1530);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "삼장");
		member.put("phoneNumber", "010-0000-1234");
		member.put("grade", "GOLD");
		member.put("point", 8450);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "우마왕");
		member.put("phoneNumber", "010-1111-2222");
		member.put("grade", "BASIC");
		member.put("point", 420);
		membership.add(member);
		// model에 담기.

		model.addAttribute("membership", membership);

		return "lesson05/quiz03";

	}

	@GetMapping("/3_1")
	public String quiz03_1(Model model) {
		List<Integer> candidates = new ArrayList<>();
		candidates.add(263001);
		candidates.add(173942);
		candidates.add(563057);

		// model에 담기
		model.addAttribute("candidates", candidates);
		model.addAttribute("title", "후보자 득표율");

		int totalCount = 0;
		for (int i = 0; i < candidates.size(); i++) {
			totalCount += candidates.get(i);
		}
		model.addAttribute("totalCount", totalCount);
		return "/lesson05/quiz03_1";
	}

	@GetMapping("/3_2")
	public String quiz03_2(Model model) {
		List<Map<String, Object>> cardBills = new ArrayList<>();

		Map<String, Object> cardBill = new HashMap<>();
		cardBill.put("store", "GS48");
		cardBill.put("pay", 7800);
		cardBill.put("date", "2025-09-14");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "현태백화점");
		cardBill.put("pay", 2750000);
		cardBill.put("date", "2025-09-18");
		cardBill.put("installment", "3개월");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "요촌치킨");
		cardBill.put("pay", 180000);
		cardBill.put("date", "2025-09-20");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);

		// model에 담기
		model.addAttribute("cardBills", cardBills);

		return "lesson05/quiz03_2";
	}

//	http://localhost/lesson05/quiz/4
	@GetMapping("/4")
	public String quiz04(Model model) {
		List<Member> members = new ArrayList<>();

		Member member = new Member();
		member.setName("유비");
		member.setPhoneNumber("010-1234-5678");
		member.setEmail("youbee@gmail.com");
		member.setNationality("삼국시대 촉한");
		member.setIntroduce("저는 촉의 군주 유비입니다. 삼국통일을 위해 열심히 일하겠습니다.");
		members.add(member);

		member = new Member();
		member.setName("관우");
		member.setPhoneNumber("010-1234-5678");
		member.setEmail("woo@naver.com");
		member.setNationality("삼국시대 촉한");
		member.setIntroduce("관우에요. 저는 유비형님 보다 나이는 많지만 일단 아우입니다.");
		members.add(member);

		member = new Member();
		member.setName("장비");
		member.setPhoneNumber("02-111-3333");
		member.setNationality("삼국시대 촉한");
		member.setEmail("tools@gmail.com");
		member.setIntroduce("장비라우");
		members.add(member);

		member = new Member();
		member.setName("조조");
		member.setPhoneNumber("010-0987-4321");
		member.setNationality("삼국시대 위");
		member.setEmail("jojo@gmail.com");
		member.setIntroduce("이름은 조조 자는 맹덕이라 하오");
		members.add(member);

		member = new Member();
		member.setName("주유");
		member.setPhoneNumber("010-0000-1111");
		member.setNationality("삼국시대 오");
		member.setEmail("jooyou@kakao.com");
		member.setIntroduce("주유는 주유소에서 ㅋㅋ");
		members.add(member);

		member = new Member();
		member.setName("황충");
		member.setPhoneNumber("031-432-0000");
		member.setNationality("삼국시대 촉한");
		member.setEmail("yellowbug@naver.com");
		member.setIntroduce("내 수염 좀 멋있는 듯");
		members.add(member);

		// model에 넣기
		model.addAttribute("members", members);

		return "lesson05/quiz04";

	}

	// http://localhost/lesson05/quiz/weather_history_view
	// 목록 화면
	@GetMapping("/weather_history_view")
	public String weatherHistoryView(Model model) {

		// select
		List<WeatherHistory> weatherHistoryList = weatherBO.getWeatherHistoryList();
		/* weather = weatherBO.getWeatherById(weather.getId()); */

		// Model에 담기

		model.addAttribute("weather", weatherHistoryList);
		return "lesson05/weatherHistory";
	}

	// 추가 화면
	@GetMapping("/add_weather_view")
	public String addWeatherView() {
		return "lesson05/addWeather";
	}

	// 추가 => 결과화면 목록 화면 이동(redirect)

	@PostMapping("/add_weather")
	  public String addWeather(
//			  @RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,
			  @RequestParam("date") String date, //String으로 인서트해도 DB에서는 date 타입으로 잘 저장된다.
			  @RequestParam("weather") String weather,
			  @RequestParam("microDust") String microDust,
			  @RequestParam("temperatures") double temperatures,
			  @RequestParam("precipitation") double precipitation,
			  @RequestParam("windSpeed") double windSpeed,
			  HttpServletResponse resoponse) { 
		
		// db insert
		weatherBO.addWeather(date, weather, microDust, temperatures, precipitation, windSpeed);
	  
		// 목록화면으로 리다이렉트
//	  1. response.sendRedirect("/lesson05/weather_history_view"); // 예외는 위로 던지기
		return "redirect:/lesson05/quiz/weather_history_view";
	}
}
