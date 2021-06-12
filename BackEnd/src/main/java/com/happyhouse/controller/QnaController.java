package com.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.happyhouse.service.QnaService;
import com.happyhouse.vo.BoardComment;
import com.happyhouse.vo.Qnaboard;
import com.happyhouse.vo.SubComment;

@RestController
public class QnaController {

    @Autowired
    QnaService service;

    @GetMapping("qna")
    public ResponseEntity<List<Qnaboard>> qnaSearchAll() {

        List<Qnaboard> list = service.qnaSearchAll();

        if (list == null || list.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(list, HttpStatus.OK);

    }

    @GetMapping("qna/{qid}")
    public ResponseEntity<Qnaboard> qnaSearchAll(@PathVariable String qid) {

        Qnaboard qna = service.qnaSearchOne(qid);

        if (qna == null)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(qna, HttpStatus.OK);

    }

    @PostMapping("qna")
    public ResponseEntity<Integer> qnaQuestion(@RequestBody Qnaboard qna) {
    	System.out.println(qna);
        int result = service.qnaQuestion(qna);

        if (result == 0)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(result, HttpStatus.OK);

    }

    @PutMapping("qna")
    public ResponseEntity<Integer> qnaUpdate(@RequestBody Qnaboard qna) {
    	
        int result = service.qnaUpdate(qna);

        if (result == 0)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(result, HttpStatus.OK);

    }

    @PutMapping("qanswer")
    public ResponseEntity<Integer> qnaAnswer(@RequestBody Qnaboard qna) {

        int result = service.qnaAnswer(qna);

        if (result == 0)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(result, HttpStatus.OK);

    }

    @DeleteMapping("qna/{qid}")
    public ResponseEntity<Integer> qnaDelete(@PathVariable String qid) {
    	
        int result = service.qnaDelete(qid);

        if (result == 0)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(result, HttpStatus.OK);

    }
    @GetMapping("comment/{qid}")
    public ResponseEntity<List<BoardComment>> commentSearchOne(@PathVariable String qid) {

    	List<BoardComment> list = service.commentSearchOne(qid);

    	if (list == null || list.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(list, HttpStatus.OK);

    }
    @PostMapping("comment")
    public ResponseEntity<Integer> commentAdd(@RequestBody BoardComment comment) {
        int result = service.commentAdd(comment);

        if (result == 0)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(result, HttpStatus.OK);

    }
    @DeleteMapping("comment/{cid}")
    public ResponseEntity<Integer> commentDelete(@PathVariable String cid) {

        int result = service.commentDelete(cid);

        if (result == 0)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(result, HttpStatus.OK);

    }
    @GetMapping("subcomment/{qid}/{cid}")
    public ResponseEntity<List<SubComment>> subcommentSearchOne(@PathVariable String qid,@PathVariable String cid) {
    	System.out.println(qid + " "+ cid);
    	List<SubComment> list = service.subcommentSearchOne(qid,cid);
    	

    	if (list == null || list.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(list, HttpStatus.OK);

    }
    @PostMapping("subcomment")
    public ResponseEntity<Integer> subcommentAdd(@RequestBody SubComment comment) {
        int result = service.subcommentAdd(comment);

        if (result == 0)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(result, HttpStatus.OK);

    }
    @DeleteMapping("subcomment/{sid}")
    public ResponseEntity<Integer> subcommentDelete(@PathVariable String sid) {

        int result = service.subcommentDelete(sid);

        if (result == 0)
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        return new ResponseEntity<>(result, HttpStatus.OK);

    }

}
