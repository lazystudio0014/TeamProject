package com.team.proj.service;

import com.team.proj.dto.CreateMemberDto;
import com.team.proj.entity.Member;
import com.team.proj.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class CreateMemberSerivceImpl implements CreateMemberSerivce {
    private final MemberRepository memberRepository;
    @Override
    public Member createMember(CreateMemberDto createMemberDto) {
        String address = createMemberDto.getAddress() + " " + createMemberDto.getAddress_Detail();

        Member member = new Member();
        member.setEmail(createMemberDto.getEmail());
        member.setNickname(createMemberDto.getNickname());
        member.setPassword(createMemberDto.getPassword());
        member.setPhonenumber(createMemberDto.getPhonenumber());
        member.setBirthdate(createMemberDto.getBirthdate());
        member.setName(createMemberDto.getName());
        member.setGender(createMemberDto.getGender());
        member.setAddress(address);
        member.setRdate(LocalDateTime.now());
        member.setUdate(LocalDateTime.now());

        return memberRepository.save(member);
    }
    @Override
    public String findMemberByEmail(String email){
        return memberRepository.findByEmail(email);
    }
    @Override
    public boolean checkEmailExists(String email) {
        String existingEmail = memberRepository.findByEmail(email);
        return existingEmail != null;
    }
    @Override
    public void save(Member newMember){
        memberRepository.save(newMember);
    }
}
