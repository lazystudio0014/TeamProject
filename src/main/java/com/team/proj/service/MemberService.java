package com.team.proj.service;

import com.team.proj.repository.MemberRepository;
import com.team.proj.entity.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;

    public String findMemberByEmail(String email){
        return memberRepository.findByEmail(email);
    }

    public void save(Member newMember){
        memberRepository.save(newMember);
    }

    public boolean checkEmailExists(String email) {
        String existingEmail = memberRepository.findByEmail(email);
        return existingEmail != null;
    }
}
