package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	
public class lesoon01Quiz03Controller {

	//ViewResolver - @ResponseBody 없을 때 뷰의 경로를 찾는다.
	//http://localhost/lesson01/quiz03/1
	@RequestMapping("/lesson01/quiz03/1")
	public String quiz03() {
		return "lesson01/quiz03";
	}
}
