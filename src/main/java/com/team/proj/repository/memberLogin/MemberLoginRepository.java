package com.team.proj.repository.memberLogin;

import org.springframework.data.jpa.repository.JpaRepository;
import com.team.proj.domain.memberLogin.MemberLogin;
public interface MemberLoginRepository extends JpaRepository<MemberLogin, Long> {
    MemberLogin findByEmail(String email);
}
