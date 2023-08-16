package com.team.proj.service.memberLogin;

import com.team.proj.domain.memberLogin.MemberLogin;
import com.team.proj.repository.memberLogin.MemberLoginRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import static com.team.proj.service.memberLogin.MemberLoginConst.*;

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
            String dbPwd = memberLogin.getPassword();
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
        memberLogin.setPassword("");

        return memberLogin;
    }
}
