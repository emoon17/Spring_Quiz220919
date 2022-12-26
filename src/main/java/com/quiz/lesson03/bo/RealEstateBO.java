package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	public RealEstateDAO realEstateDAO;

	public RealEstate getRealEstateById(int id) {

		return realEstateDAO.selectRealEstate(id);
	}

	// input : controller 넘겨준 rentPrice
	// output : List<RentEstate> => 컨트롤러한테 넘김

	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) {
		return realEstateDAO.selectRealEstateListByRentPrice(rentPrice);
	}

	// input: controller가 넘겨준 area, price
	// output : List<RealEstate> => 컨트롤러한테 넘김
	public List<RealEstate> getRealEstateListByAreaAndPrice(int area, int price) {
		return realEstateDAO.selectRealEstateListByAreaAndPrice(area, price);
	}

	// input : real_estate객체
	// output : 성공한 행의 갯수
	public int addRealEstate(RealEstate realEstate) {
		return realEstateDAO.insertRealEstate(realEstate);
	}
	
	public int addRealEstateAsField(
			int realtorId, String address, int area,
			String type, int price, Integer rentPrice) {
		return realEstateDAO.insertRealEstateAsField(realtorId, address, area, type, price, rentPrice);
		
	}

}
