package com.happyhouse.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * 페이지 이동 담당 Controller
 * @author jihogrammer@gmail.com
 */
@Controller
@CrossOrigin("*") // prevent CORS
public class HomeController {
	
    /**
     * 메인 페이지로 이동
     */
    @GetMapping("/")
    public String home() {
        return "index";
    }

    /**
     * 회원가입 페이지로 이동
     */
    @GetMapping("join")
    public String join() {
        return "join";
    }

    /**
     * 실거래가 검색 페이지로 이동
     * search/deal
     */
    @GetMapping("deal")
    public String deal() {
        return "deal";
    }

    /**
     * 아파트 검색 페이지로 이동
     */
    @GetMapping("apt")
    public String apt() {
        return "apt";
    }

    /**
     * QnA 페이지로 이동
     */
    @GetMapping("qnalist")
    public String qnalist() {
        return "qnalist";
    }

    @GetMapping("qnainput")
    public String qnainput() {
        return "qnainput";
    }
    
    
    
//    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
//    public ModelAndView login(HttpServletRequest req, ModelAndView mv) {
//		String id = req.getParameter("id");
//		String pw = req.getParameter("pw");
//		Map<String, String> map = new HashMap<>();
//		map.put("id",id);
//		map.put("pw",pw);
//		
//		Useraccount res = uservice.login(map);
//		
//		//System.out.println(id);
//		if(res != null) {
//			HttpSession session = req.getSession();
//			
//			session.setAttribute("id", id);
//			
//	
//		}
//		mv.setViewName("redirect:/");
//		return mv;
//	}
//    
//    
//	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView logout(HttpServletRequest req, ModelAndView mv) {
//		HttpSession session = req.getSession();
//		session.invalidate();
//		
//		System.out.println("logout");
//		
//		//mv.addObject(attributeValue)
//		mv.setViewName("redirect:/");
//		return mv;
//	}
//
//	@GetMapping("/user/findPass")
//	public String findpass(){
//		
//		return "findPass";
//		
//	}
	
	/*
	 * @PostMapping(value = "/user/findPass") public Useraccount
	 * passSearch(@RequestBody Useraccount user) { String id = user.getId(); String
	 * name = user.getName(); String phone = user.getPhone();
	 * 
	 * System.out.println(id + " "+ name + " " + phone);
	 * 
	 * //Useraccount user = new Useraccount(id,name,phone);
	 * 
	 * user = uservice.selectPass(user);
	 * 
	 * System.out.println(user.getPassword());
	 * 
	 * //v.setViewName("redirect:/"); return user; }
	 */
}
