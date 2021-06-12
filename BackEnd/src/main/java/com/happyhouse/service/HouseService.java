package com.happyhouse.service;

import java.util.List;

import com.happyhouse.vo.Baseaddress;
import com.happyhouse.vo.Housedeal;
import com.happyhouse.vo.Houseinfo;

public interface HouseService {

    public List<String> citySearch(String city);
    public List<String> gugunSearch(String gugun);
    public List<Housedeal> dongSearch(String dong);
    public List<Houseinfo> houseSearch();
    public List<Housedeal> nameSearch(String name);
    public List<Houseinfo> aptSearch(String name);
	public List<Baseaddress> locationDongSearch(String dong);
	public List<Houseinfo> locationAptSearch(String dong);

}
