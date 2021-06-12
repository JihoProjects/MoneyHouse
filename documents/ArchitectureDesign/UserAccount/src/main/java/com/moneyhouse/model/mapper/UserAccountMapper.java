package com.moneyhouse.model.mapper;

import java.util.List;
import java.util.Map;

import com.moneyhouse.model.UserAccount;

/**
 * <h3>USER MAPPER(DAO)</h3>
 * 
 * <ul>
 *   <li>로그인</li>
 *   <li>회원가입</li>
 *   <li>비밀번호 찾기</li>
 *   <li>회원탈퇴</li>
 * </ul>
 * 
 * @author 김지호 jihogrammer@gmail.com
 */
public interface UserAccountMapper {

    /**
     * 사용자 로그인(UPDATE)
     * 
     * <p>마지막 로그인 일시를 갱신합니다.
     * 
     * @param map - {user_id, user_pw}
     * @return 0: 로그인 실패 / 1: 로그인 성공
     */
    public int userLogin(Map<String, String> map);

    /**
     * 사용자 조회
     * 
     * @param map - {key, value}
     * @return - 사용자 정보
     */
    public UserAccount userSearchOne(Map<String, String> map);

    /**
     * 사용자 회원가입(INSERT)
     * 
     * @param user - 회원가입 할 사용자의 정보
     * @return - 0: 회원가입 실패 / 1: 회원가입 성공
     */
    public int userJoin(UserAccount user);

    /**
     * 회원정보 수정
     * @param user
     * @return
     */
    public int userUpdate(UserAccount user);

    /**
     * 사용자 비밀번호 찾기(SELECT)
     * 
     * <p>추후 javax.mail 패키지를 사용하여 이메일 인증을 구현합니다.
     * 
     * @param map - {user_id, user_email}
     * @return - 비밀번호를 찾을 사용자의 이메일 주소(Service에서 처리)
     */
    public String userFind(Map<String, String> map);

    /**
     * 사용자 회원탈퇴(DELETE)
     * 
     * @param map - {user_id, user_pw}
     * @return - 0: 회원탈퇴 실패 / 1: 회원탈퇴 성공
     */
    public int userDelete(Map<String, String> map);

    /**
     * [관리자용] 회원 목록
     * @return 회원리스트
     */
    public List<UserAccount> userSearchAll();

}
