package com.happyhouse.service;

import java.util.List;
import java.util.Map;

import com.happyhouse.vo.BoardComment;
import com.happyhouse.vo.Qnaboard;
import com.happyhouse.vo.SubComment;

public interface QnaService {

    /**
     * QnA 전체 목록
     */
    public List<Qnaboard> qnaSearchAll();

    /**
     * QnA 상세 보기
     * @param qid - QnA Primary Key
     */
    public Qnaboard qnaSearchOne(String qid);

    /**
     * QnA 질문 등록
     * @param qna - RequestBody
     */
    public int qnaQuestion(Qnaboard qna);

    /**
     * QnA 질문 수정
     * @param qna - RequestBody
     */
    public int qnaUpdate(Qnaboard qna);

    /**
     * QnA 답변 등록 (Admin 계정만 사용 가능)
     * @param map - { qid: "QnA 글 번호", qans: "답변 내용" }
     */
    public int qnaAnswer(Qnaboard qna);

    /**
     * QnA 글 삭제
     * @param qid - QnA Primary Key
     */
    public int qnaDelete(String qid);
    /**
     * 덧글 검색
     * @param qid - QnA Primary Key
     */
	public List<BoardComment> commentSearchOne(String qid);

	public int commentAdd(BoardComment comment);

	public List<SubComment> subcommentSearchOne(String qid, String cid);

	public int subcommentAdd(SubComment comment);

	public int commentDelete(String cid);

	public int subcommentDelete(String sid);

}
