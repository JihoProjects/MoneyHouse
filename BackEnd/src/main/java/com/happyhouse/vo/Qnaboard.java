package com.happyhouse.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Qnaboard {

    /**
     * <h3>QnA 게시글 번호</h3><br>
     * Primary Key
     */
    private String qid;

    /**
     * <h3>QnA 게시글 작성날짜</h3><br>
     * INSERT 시 sysdate 입력<br>
     * SELECT 시 String으로 매핑 
     */
    private String qdate;

    /**
     * <h3>QnA 답변</h3><br>
     * admin만 작성 가능
     */
    private String qans;

    /**
     * <h3>QnA 질문</h3><br>
     * 로그인 한 사용자만 가능
     */
    private String qque;

    /**
     * <h3>QnA User</h3><br>
     * Foreign Key
     */
    private String quserid;
    
    private String qarea;

}
