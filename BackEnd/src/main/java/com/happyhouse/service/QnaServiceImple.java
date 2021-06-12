package com.happyhouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.dao.QnaDao;
import com.happyhouse.vo.BoardComment;
import com.happyhouse.vo.Qnaboard;
import com.happyhouse.vo.SubComment;

@Service
public class QnaServiceImple implements QnaService {

    @Autowired
    QnaDao dao;

    @Override
    public List<Qnaboard> qnaSearchAll() {
        return dao.qnaSearchAll();
    }

    @Override
    public Qnaboard qnaSearchOne(String qid) {
        return dao.qnaSearchOne(qid);
    }

    @Override
    public int qnaQuestion(Qnaboard qna) {

        Map<String, String> map = new HashMap<String, String>();

        map.put("qque", qna.getQque());
        map.put("quserid", qna.getQuserid());

        return dao.qnaQuestion(map);

    }

    @Override
    public int qnaUpdate(Qnaboard qna) {

        // 이미 답변이 달린 글의 경우 질문 수정 불가능 처리
       // if (qna.getQans().length() > 0) return 0;

        Map<String, String> map = new HashMap<String, String>();

        map.put("qid", qna.getQid());
        map.put("qque", qna.getQque());

        return dao.qnaUpdate(map);

    }

    @Override
    public int qnaAnswer(Qnaboard qna) {

        Map<String, String> map = new HashMap<String, String>();

        map.put("qans", qna.getQans());
        map.put("qid", qna.getQid());

        return dao.qnaAnswer(map);

    }

    @Override
    public int qnaDelete(String qid) {
        return dao.qnaDelete(qid);
    }

	@Override
	public List<BoardComment> commentSearchOne(String qid) {
		
		return dao.commentSearchOne(qid);
	}

	@Override
	public int commentAdd(BoardComment comment) {
		
		return dao.commentAdd(comment);
	}

	@Override
	public List<SubComment> subcommentSearchOne(String qid ,String cid) {
		 Map<String, String> map = new HashMap<String, String>();
		   map.put("qid", qid);
	        map.put("cid", cid);

		return dao.subcommentSearchOne(map);
	}

	@Override
	public int subcommentAdd(SubComment comment) {
		// TODO Auto-generated method stub
		return dao.subcommentAdd(comment);
	}

	@Override
	public int commentDelete(String cid) {
		// TODO Auto-generated method stub
		return dao.commentDelete(cid);
	}

	@Override
	public int subcommentDelete(String sid) {
		// TODO Auto-generated method stub
		return dao.subcommentDelete(sid);
	}

}
