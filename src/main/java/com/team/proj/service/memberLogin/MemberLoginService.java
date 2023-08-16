package com.team.proj.service.memberLogin;

import com.team.proj.domain.memberLogin.MemberLogin;

public interface MemberLoginService {
    int check(String email, String pwd);

    MemberLogin getLogin(String email);



}
