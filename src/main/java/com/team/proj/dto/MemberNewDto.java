package com.team.proj.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.sql.Date;
@Getter
@Setter
@ToString
public class MemberNewDto {
    private String name; //이름
    private String email; //이메일
    private String password; //비밀번호
    private String phoneNumber; //핸드폰번호
    private Date birthdate; //생년월일
    private String address; //주소
    private String gender; //성별
    private String address_Detail; //주소

}
