package com.quiz.lesson06.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingDAO {

	public List<Booking> selectBookingList();
	
	public int deleteBooking(int id);
	
	public void insertBooking(
			@Param("name") String name,
			@Param("date") Date date,
			@Param("day") int day,
			@Param("headcount") int headcount,
			@Param("phoneNumber") String phoneNumber);
	
	public Booking selectLastestCheckBooking( // 리스트로 받고 나중에 하나 빼도 되긴 함.
			@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber);
}
