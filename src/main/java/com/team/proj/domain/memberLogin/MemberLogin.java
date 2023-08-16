package com.team.proj.domain.memberLogin;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.sql.Date;


@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@EqualsAndHashCode(callSuper=false)
//@SequenceGenerator(name = "GEN_MEMBERS_SEQ", sequenceName = "MEMBERS_SEQ", initialValue = 1,allocationSize = 1)
@Table(name = "MEMBERS")
public class MemberLogin extends CommonEntity{
    @Id
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GEN_MEMBERS_SEQ")
    //private long seq;
    private String email;
    //private String nickname;
    private String password;
    private String name;
    /*private String phonenumber;
    private Date birthdate;

    private char gender;
    private String address;*/
}
