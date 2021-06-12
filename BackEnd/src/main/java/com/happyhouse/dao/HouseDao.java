package com.happyhouse.dao;

import java.util.List;

import com.happyhouse.vo.Baseaddress;
import com.happyhouse.vo.Housedeal;
import com.happyhouse.vo.Houseinfo;

public interface HouseDao {

    public List<String> citySearch(String sido_name);
    public List<String> gugunSearch(String gugun);
    public List<Housedeal> dongSearch(String dong);
    public List<Houseinfo> houseSearch();
    public List<Housedeal> nameSearch(String aptname);
    public List<Houseinfo> aptSearch(String name);
	public List<Baseaddress> locationDongSearch(String dong);
	public List<Houseinfo> locationAptSearch(String dong);

}
