package com.team.proj.entity;

import com.team.proj.dto.MemberNewDto;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import java.time.LocalDateTime;

@Entity
@Table(name = "members")
@Getter
@Setter
@ToString
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long  seq;         //회원 번호

    @Column(unique = true)
    private String email;       //이메일 + id

    @Column(nullable = false)
    private String nickName; //사용자 닉네임

    @Column(nullable = false)
    private String password;    //비번

    @Column(nullable = false)
    private LocalDateTime createDate;   //가입날짜

    @Column(nullable = false)
    private String phoneNumber;         //핸드폰 번호

    @Column(nullable = false)
    private Date birthdate;             //생년월일

    @Column(nullable = false)
    private String name;                //이름

    @Column(nullable = false)
    private String gender;                //성별

    @Column(nullable = false)
    private String address;              //주소

    public static Member createid(MemberNewDto memberNewDto){
        Member member = new Member();

        String address = memberNewDto.getAddress()+ " " +memberNewDto.getAddress_Detail();

        member.setName(memberNewDto.getName());
        member.setBirthdate(memberNewDto.getBirthdate());
        member.setAddress(address);
        member.setEmail(memberNewDto.getEmail());
        member.setNickName(memberNewDto.getNickName());
        member.setPassword(memberNewDto.getPassword());
        member.setGender(memberNewDto.getGender());
        member.setPhoneNumber(memberNewDto.getPhoneNumber());

        LocalDateTime localDateTime = LocalDateTime.now();
        member.setCreateDate(localDateTime);
        return member;
    }
}
