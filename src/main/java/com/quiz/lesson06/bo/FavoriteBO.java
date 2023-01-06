package com.quiz.lesson06.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.FavoriteDAO;
import com.quiz.lesson06.model.Favorite;

@Service
public class FavoriteBO {

	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public void addFavorite(String name, String url) {
		favoriteDAO.insertFavorite(name, url);
	}
	
	public List<Favorite> getFavorite(){
		return favoriteDAO.selectFavorite();
	}
	
	public Favorite getFavoriteByUrl(String url){ // 하나의 객체를 가져오는 형태로 요청
		List<Favorite> favoriteList =  favoriteDAO.getFavoriteByUrl(url);
		//1.리스트가 비어있는지 아닌지 확인
		// 안 비어 있으면 임의로 0번째꺼를 응답값으로 내려줄게
		
		
		if (favoriteList.isEmpty() == false) {
			//리스트가 채워져 있을 때
			return favoriteList.get(0);
		} 
			// 비어있는 경우
		return null;
	}
	
	public int deleteFavoriteById(int id) {
		return favoriteDAO.deleteFavoriteById(id);
	}
	
}
