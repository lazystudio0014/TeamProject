package com.team.proj.service.memberLogin;

import com.team.proj.domain.memberLogin.MemberLogin;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemberLoginServiceImplTest {

    @Autowired
    MemberLoginService service;
    @Test
    void getLogin() {
        int i = service.check("kimasj88@hanmail.net","1234");
        System.out.println("service check : "+i);
    }
}