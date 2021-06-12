package com.happyhouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.vo.UserAccount;
import com.happyhouse.dao.UserAccountMapper;

/**
 * <h3>USER SERVICE</h3>
 * 
 * <ul>
 *   <li>로그인</li>
 *   <li>회원가입</li>
 *   <li>비밀번호 찾기</li>
 *   <li>회원탈퇴</li>
 * </ul>
 * 
 * @author 김지호 jihogrammer@gmail.com
 * 
 * @see UserAccountMapper
 */
@Service
public class UserAccountServiceImpl implements UserAccountService {

    @Autowired
    UserAccountMapper mapper;

    // 자주 사용할 상수들 선언
    static final String ID    = "user_id";
    static final String PW    = "user_pw";
    static final String NAME  = "user_name";
    static final String MAIL  = "user_email";
    static final String PHONE = "user_phone";
    static final String ADDR  = "user_address";
    static final String POINT = "user_point";

    @Override
    public UserAccount userLogin(UserAccount user) {

        // 매개변수로 받은 데이터를 가공하여 필요한 정보만 map에 담는다.
        Map<String, String> map = new HashMap<>();

        // map에 로그인에 필요한 정보 담기
        map.put(ID, user.getUser_id());
        map.put(PW, user.getUser_pw());

        // 로그인 시도
        int result = mapper.userLogin(map);

        // 사용자가 검색되지 않았을 경우 로그인 실패
        if (result == 0) return null;

        map.clear();
        map.put("key", "user_id");
        map.put("value", user.getUser_id());

        // 로그인 성공
        return userSearchOne(map);

    }

    @Override
    public UserAccount userSearchOne(Map<String, String> map) {
        return mapper.userSearchOne(map);
    }

    @Override
    public UserAccount userSearchOne(String user_id) {
        Map<String, String> map = new HashMap<>();
        map.put("key", "user_id");
        map.put("value", user_id);
        return mapper.userSearchOne(map);
    }

    @Override
    public int userJoin(UserAccount user) {
        // INSERT만 수행하기 때문에 별다른 처리를 하지 않는다.
        return mapper.userJoin(user);
    }

    @Override
    public int passCheck(UserAccount user) {

        // 매개변수로 받은 데이터를 가공하여 필요한 정보만 map에 담는다.
        Map<String, String> map = new HashMap<>();

        // map에 로그인에 필요한 정보 담기
        map.put(ID, user.getUser_id());
        map.put(PW, user.getUser_pw());

        return mapper.userLogin(map);

    }

    @Override
    public int userUpdate(UserAccount user) {
        return mapper.userUpdate(user);
    }

    @Override
    public String userFind(UserAccount user) {
        // 추후 이메일 library를 사용하여 비밀번호 인증을 한다.
        // 사용자의 이메일을 반환받아 사용한다.

        // 매개변수로 받은 데이터를 가공하여 필요한 정보만 map에 담는다.
        Map<String, String> map = new HashMap<>();

        // 이메일 또는 핸드폰 번호를 기준으로 검색
        String key, value;
        if (user.getUser_email() == null) {
            key = MAIL;
            value = user.getUser_email();
        } else {
            key = PHONE;
            value = user.getUser_phone();
        }

        // map에 비밀번호 찾기에 필요한 정보 담기
        map.put(ID, user.getUser_id());
        map.put(key, value);

        // mapper에게 map을 전달하고 email 반환
        return mapper.userFind(map);

    }

    @Override
    public int userDelete(UserAccount user) {

        // 매개변수로 받은 데이터를 가공하여 필요한 정보만 map에 담는다.
        Map<String, String> map = new HashMap<>();

        // map에 비밀번호 찾기에 필요한 정보 담기
        map.put(ID, user.getUser_id());
        map.put(PW, user.getUser_pw());

        // mapper에게 map을 전달하고 삭제 여부 반환
        return mapper.userDelete(map);

    }

    @Override
    public List<UserAccount> userSearch() {
        return mapper.userSearchAll();
    }

}
