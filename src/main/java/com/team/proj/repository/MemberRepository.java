package com.team.proj.repository;

import com.team.proj.entity.Member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.data.repository.query.Param;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {
    @Query("SELECT m.email FROM Member m WHERE m.email= :email")
    String findByEmail(@Param("email") String email);
}
