package com.quiz.lesson06.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Favorite;

@Repository
public interface FavoriteDAO {

	
	public void insertFavorite(
			@Param("name") String name, 
			@Param("url") String url);
	
	public List<Favorite> selectFavorite();
	
	public List<Favorite> getFavoriteByUrl(String url); // null이거나 객체가 있거나
	
	public int deleteFavoriteById(int id);
}
