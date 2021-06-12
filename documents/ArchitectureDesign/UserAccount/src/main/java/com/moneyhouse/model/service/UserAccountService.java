package com.moneyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.moneyhouse.model.UserAccount;

/**
 * <h3>USER SERVICE</h3>
 * 
 * <ul>
 *   <li>로그인</li>
 *   <li>회원가입</li>
 *   <li>비밀번호 찾기</li>
 *   <li>회원탈퇴</li>
 * 
 * @author jihogrammer@gmail.com
 *
 * @see com.moneyhouse.controller.UserAccountController
 * @see com.moneyhouse.model.mapper.UserAccountMapper
 */
public interface UserAccountService {

    /**
     * 사용자 로그인(UPDATE, SELECT / PUT)
     * 
     * <p>마지막 로그인 일시를 갱신합니다.
     * 
     * @param user - 로그인 할 사용자의 정보
     * @return UserAccount - 사용자 정보
     */
    public UserAccount userLogin(UserAccount user);

    /**
     * 사용자 조회(SELECT / GET)
     * 
     * <p>user_id에 해당하는 사용자 정보를 받아옵니다.
     * 
     * @param user_id
     * @return 사용자 정보
     */
    public UserAccount userSearchOne(Map<String, String> map);
    public UserAccount userSearchOne(String user_id);

    /**
     * 사용자 회원가입(INSERT / POST)
     * 
     * @param user - 사용자 회원가입(INSERT)
     * @return - 0: 회원가입 실패 / 1: 회원가입 성공
     */
    public int userJoin(UserAccount user);

    /**
     * 비밀번호 확인
     * @param user
     * @return
     */
    public int passCheck(UserAccount user);

    /**
     * 회원정보 수정
     * @param user
     * @return
     */
    public int userUpdate(UserAccount user);

    /**
     * 사용자 비밀번호 찾기(SELECT / POST)
     * 
     * <p>POST : 사용자를 비밀번호로 검증(SELECT) 후에 email을 반환(SELECT)합니다. 
     * 
     * <p>추후 javax.mail 패키지를 사용하여 이메일 인증을 구현합니다.
     * 
     * @param user - 비밀번호 찾을 사용자의 정보(이메일 주소 또는 핸드폰 번호)
     * @return - 비밀번호를 찾을 사용자의 이메일 주소(Service에서 처리)
     */
    public String userFind(UserAccount user);

    /**
     * 사용자 회원탈퇴(DELETE / POST)
     * 
     * <p>사용자의 비밀번호를 검증(SELECT)받고,
     * 확인되면 회원탈퇴 처리(DELETE)를 수행합니다.
     * 
     * @param user - 계정을 삭제할 사용자의 정보
     * @return - 0: 회원탈퇴 실패 / 1: 회원탈퇴 성공
     */
    public int userDelete(UserAccount user);

    /**
     * [관리자용] 회원 목록
     * @return 회원리스트
     */
    public List<UserAccount> userSearch();

}
