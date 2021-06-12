package com.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.dao.HouseDao;
import com.happyhouse.vo.Baseaddress;
import com.happyhouse.vo.Housedeal;
import com.happyhouse.vo.Houseinfo;

@Service
public class HouseServiceImpl implements HouseService {

    @Autowired
    HouseDao dao;

    @Override
    public List<String> citySearch(String city) {
        return dao.citySearch(city);
    }

    @Override
    public List<String> gugunSearch(String gugun) {
        return dao.gugunSearch(gugun);
    }

    @Override
    public List<Housedeal> dongSearch(String dong) {
        return dao.dongSearch(dong);
    }

    @Override
    public List<Houseinfo> houseSearch() {
        return dao.houseSearch();
    }

    @Override
    public List<Housedeal> nameSearch(String name) {
        return dao.nameSearch(name);
    }

    @Override
    public List<Houseinfo> aptSearch(String name) {
        return dao.aptSearch(name);
    }

	@Override
	public List<Baseaddress> locationDongSearch(String dong) {
		
		return dao.locationDongSearch(dong);
	}
	@Override
	public List<Houseinfo> locationAptSearch(String dong) {
		
		return dao.locationAptSearch(dong);
	}

}
