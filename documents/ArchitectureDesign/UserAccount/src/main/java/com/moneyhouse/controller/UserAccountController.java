package com.moneyhouse.controller;

import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moneyhouse.jwt.JwtProvider;
import com.moneyhouse.model.UserAccount;
import com.moneyhouse.model.service.UserAccountService;

/**
 * <h3>USER Controller</h3>
 * 
 * <p>REST 방식으로 회원관리를 관리합니다.
 * 
 * <ul>
 *   <li>로그인</li>
 *   <li>회원가입</li>
 *   <li>비밀번호 찾기</li>
 *   <li>회원탈퇴</li>
 *   
 * <p>로그아웃은 Vue에서 처리합니다.
 * 
 * @author 김지호 jihogrammer@gmail.com
 * 
 * @see UserAccountService
 * @see com.moneyhouse.model.mapper.UserAccountMapper
 */
@RestController
@RequestMapping("/user")
public class UserAccountController {

    @Autowired
    UserAccountService service;

    @Autowired
    JwtProvider jwtUtil;

    /**
     * 필터를 거친 후 인증 여부 확인
     * 
     * @param auth
     * @see com.moneyhouse.jwt.JwtAuthenticationFilter
     * @throws URISyntaxException
     */
    @PostMapping("/auth")
    public ResponseEntity<String> userAuth(Authentication auth) throws URISyntaxException {

        System.out.println("auth 호출: " + auth);

        if (auth == null)
            return new ResponseEntity<>("fail", HttpStatus.NO_CONTENT);

        return ResponseEntity.ok().body("success");

    }

    /**
     * 사용자 로그인(UPDATE / PUT)
     * 
     * <p>마지막 로그인 일시를 갱신합니다.
     * 
     * @param user - {userid, userpw}
     * @return - 인증 토큰
     */
    @PutMapping("/login")
    public ResponseEntity<String> userLogin(@RequestBody UserAccount user) {

        // 로그인 시도
        user = service.userLogin(user);

        // 로그인 실패
        if (user == null)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        // 토큰 발급 준비
        String user_id = user.getUser_id();
        String user_name = user.getUser_name();

        // 토큰 생성
        String token = jwtUtil.createToken(user_id, user_name);

        // 토큰 발급
        return new ResponseEntity<>(token, HttpStatus.OK);

    }

    @GetMapping("/auth")
    public ResponseEntity<UserAccount> authLogin(HttpServletRequest request) {

        String token = request.getHeader("moneyhouse-token");
        System.out.println(token);

        if (token == null || token.length() == 0 || !jwtUtil.validateToken(token))
            return new ResponseEntity<>(HttpStatus.FORBIDDEN);

        String user_id = jwtUtil.getUserID(token);
        System.out.println(user_id);

        UserAccount user = service.userSearchOne(user_id);
        System.out.println(user);

        if (user == null)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(user, HttpStatus.OK);

    }

    /**
     * 사용자 조회
     * 
     * @param user_id
     * @return 사용자 정보
     */
    @PostMapping("/search")
    public ResponseEntity<UserAccount> userInfo(@RequestBody Map<String, String> map) {
        System.out.println(map.get("key"));
        System.out.println(map.get("value"));

        // 사용자 조회 시도
        UserAccount user = service.userSearchOne(map);
        System.out.println(user);

        if (user == null)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(user, HttpStatus.OK);

    }

    /**
     * 사용자 회원가입(INSERT / POST)
     * 
     * @param user - 사용자 회원가입(INSERT)
     * @return - 회원가입 성공 여부
     */
    @PostMapping("/join")
    public ResponseEntity<Boolean> userJoin(@RequestBody UserAccount user) {
        System.out.println(user);

        // 회원가입 시도
        int result = service.userJoin(user);

        if (result == 0)
            return new ResponseEntity<>(false, HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(true, HttpStatus.OK);

    }

    @PostMapping("/check")
    public ResponseEntity<Boolean> passCheck(@RequestBody UserAccount user) {

        int result = service.passCheck(user);

        if (result == 0)
            return new ResponseEntity<>(HttpStatus.FORBIDDEN);

        return new ResponseEntity<>(true, HttpStatus.OK);

    }

    @PutMapping("/update")
    public ResponseEntity<Boolean> userUpdate(@RequestBody UserAccount user) {

        int result = service.userUpdate(user);

        if (result == 0)
            return new ResponseEntity<>(HttpStatus.FORBIDDEN);

        return new ResponseEntity<>(true, HttpStatus.OK);
    }

    /**
     * (수정 중)
     * 사용자 비밀번호 찾기(SELECT / POST)
     * 
     * <p>POST : 사용자를 이메일 또는 핸드폰 번호로 검증(SELECT) 후,
     * email을 반환(SELECT)합니다. 따라서 비밀번호 노출을 막기 위해
     * POST 방식을 채택하였습니다. 
     * 
     * <p>추후 javax.mail 패키지를 사용하여 이메일 인증을 구현합니다.
     * 
     * @param user - 비밀번호 찾을 사용자의 정보(이메일 주소 또는 핸드폰 번호)
     * @return - 비밀번호를 찾을 사용자의 이메일 주소(Service에서 처리)
     */
    @PostMapping("/find")
    public ResponseEntity<String> userFind(@RequestBody UserAccount user) {

        String email = service.userFind(user);

        if (email == null)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(email, HttpStatus.OK);

    }

    /**
     * 사용자 회원탈퇴(DELETE / POST)
     * 
     * <p>사용자의 비밀번호를 검증(SELECT)받고,
     * 확인되면 회원탈퇴 처리(DELETE)를 수행합니다.
     * 
     * @param user - 계정을 삭제할 사용자의 정보
     * @return - 0: 회원탈퇴 실패 / 1: 회원탈퇴 성공
     */
    @PostMapping("/delete")
    public ResponseEntity<Integer> userDelete(@RequestBody UserAccount user) {

        int result = service.userDelete(user);

        if (result == 0)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(1, HttpStatus.OK);

    }

    @GetMapping("/")
    public ResponseEntity<List<UserAccount>> userSearch() {

        List<UserAccount> list = service.userSearch();

        if (list == null || list.size() == 0)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(list, HttpStatus.OK);

    }

}
