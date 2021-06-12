package com.happyhouse.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BoardComment {

	private String cid;
	private String qid;
	private String comment;
	private String userid;
}
