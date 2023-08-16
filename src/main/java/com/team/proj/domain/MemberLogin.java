package com.team.proj.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="MEMBER_LOGIN")
@AllArgsConstructor
@NoArgsConstructor
@Data
@SequenceGenerator(name="MEMBER_LOGIN_SEQ_GENERATOR", sequenceName="MEMBER_LOGIN_SEQ" , initialValue=1, allocationSize=1)
public class MemberLogin extends CommonEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="MEMBER_LOGIN_SEQ_GENERATOR")//Oracle
    private long seq;
    private String name;
    private String email;
    private String pwd;
    private String phone;
}
