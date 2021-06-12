package com.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.happyhouse.service.HouseService;
import com.happyhouse.vo.Baseaddress;
import com.happyhouse.vo.Housedeal;
import com.happyhouse.vo.Houseinfo;

@RestController
public class HouseController {
	//jeus
    @Autowired
    HouseService service;

    @GetMapping(value = "citySearch/{city}")
    public ResponseEntity<List<String>> citySearch(@PathVariable String city) {
    	
        List<String> list = service.citySearch(city);

        if (list == null || list.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(list, HttpStatus.OK);

    }

    @GetMapping(value = "gugunSearch/{gugun}")
    public ResponseEntity<List<String>> gugunSearch(@PathVariable String gugun) {

        List<String> list = service.gugunSearch(gugun);

        if (list == null || list.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(list, HttpStatus.OK);

    }

    @GetMapping(value = "dongSearch/{dong}")
    public ResponseEntity<List<Housedeal>> dongSearch(@PathVariable String dong) {

        List<Housedeal> list = service.dongSearch(dong);

        if (list == null || list.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(list, HttpStatus.OK);

    }

    @GetMapping(value = "nameSearch/{name}")
    public ResponseEntity<List<Housedeal>> nameSearch(@PathVariable String name) {
        List<Housedeal> list = service.nameSearch("%"+name+"%");

        if (list == null || list.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        

        return new ResponseEntity<>(list, HttpStatus.OK);

    }

    @GetMapping(value = "houseSearch")
    public ResponseEntity<List<Houseinfo>> houseSearch() {

        List<Houseinfo> list = service.houseSearch();

        if (list == null || list.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(list, HttpStatus.OK);

    }
    @GetMapping(value = "locationDongSearch/{dong}")
    public ResponseEntity<List<Baseaddress>> locationDongSearch(@PathVariable String dong) {
    	System.out.println(123);
        List<Baseaddress> list = service.locationDongSearch(dong);

        if (list == null || list.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(list, HttpStatus.OK);

    }
	    @GetMapping(value = "locationAptSearch/{dong}")
	    public ResponseEntity<List<Houseinfo>> locationAptSearch(@PathVariable String dong) {
	
	        List<Houseinfo> list = service.locationAptSearch(dong);
	
	        if (list == null || list.isEmpty())
	            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	
	        return new ResponseEntity<>(list, HttpStatus.OK);
	
	    }
}
