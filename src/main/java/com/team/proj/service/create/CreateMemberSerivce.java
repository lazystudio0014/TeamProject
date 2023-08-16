package com.team.proj.service.create;

import com.team.proj.dto.create.CreateMemberDto;
import com.team.proj.entity.Member;

public interface CreateMemberSerivce {
    Member createMember(CreateMemberDto createMemberDto);
    String findMemberByEmail(String email);
    boolean checkEmailExists(String email);
    void save(Member newMember);
}
