package com.team.proj.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.time.LocalDateTime;

@Entity
@Table(name = "MEMBERS")
@AllArgsConstructor
@NoArgsConstructor
@Data
@SequenceGenerator(name="MEMBERS_SEQ_GENERATOR", sequenceName="MEMBERS_SEQ" , initialValue=1, allocationSize=1)
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="MEMBERS_SEQ_GENERATOR")
    @Column(name = "MEMBERS_SEQ")
    private long seq;         //회원 번호
    private String email;       //이메일 + id
    private String nickname; //사용자 닉네임
    private String password;    //비번
    private String phonenumber;         //핸드폰 번호
    private Date birthdate;             //생년월일
    private String name;                //이름
    private String gender;                //성별
    private String address;              //주소
    private LocalDateTime createdate;   //가입날짜
}
