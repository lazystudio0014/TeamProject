package com.team.proj.service;

import com.team.proj.domain.MemberLogin;
import com.team.proj.repository.MemberLoginRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import static com.team.proj.service.MemberLoginConst.*;

@RequiredArgsConstructor
@Service

public class MemberLoginServiceImpl implements MemberLoginService {
    private final MemberLoginRepository memberLoginRepository;
    @Override
    public int check(String email, String pwd) {
        MemberLogin memberLogin = memberLoginRepository.findByEmail(email);
        if (memberLogin == null) {
            return NO_ID;
        }else {
            String dbPwd = memberLogin.getPwd();
            if (dbPwd != null) dbPwd = dbPwd.trim();

            if (!dbPwd.equals(pwd)) {
                return NO_PWD;
            } else {
                return YES_ID_PWD;
            }
        }
    }

    @Override
    public MemberLogin getLogin(String email) {
        MemberLogin memberLogin = memberLoginRepository.findByEmail(email);
        memberLogin.setPwd("");

        return memberLogin;
    }
}
