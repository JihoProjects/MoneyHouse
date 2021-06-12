package com.happyhouse.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class SubComment {
	private String sid;
	private String qid;
	private String cid;
	private String comment;
	private String userid;
	
}
