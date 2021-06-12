package com.happyhouse.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserAccount {

    private String user_id;
    private String user_pw;
    private String user_name;
    private String user_email;
    private String user_phone;
    private String user_address;
    private String user_point;
    private String joindate;
    private String logindate;

}
