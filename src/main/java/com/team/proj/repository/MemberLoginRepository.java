package com.team.proj.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.team.proj.domain.MemberLogin;
public interface MemberLoginRepository extends JpaRepository<MemberLogin, Long> {
    MemberLogin findByEmail(String email);
}
