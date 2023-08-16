package com.team.proj.service;

import com.team.proj.domain.MemberLogin;

public interface MemberLoginService {
    int check(String email, String pwd);

    MemberLogin getLogin(String email);

}
