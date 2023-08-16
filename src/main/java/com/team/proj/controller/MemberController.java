package com.team.proj.controller;

import com.team.proj.dto.MemberNewDto;
import com.team.proj.entity.Member;
import com.team.proj.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashSet;
import java.util.Set;

@Controller
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;
    @GetMapping("/form.do")
    public String createMember(Model model){
        model.addAttribute("MemberNewDto", new MemberNewDto());
        return "member/createMember";
    }
    @PostMapping("/signUp.do")
    public String newMember(MemberNewDto memberNewDto, Model model){
        String email = memberService.findMemberByEmail(memberNewDto.getEmail());
        if (email == null) {
            Member newMember = Member.createid(memberNewDto);
            memberService.save(newMember);
            return "redirect:form.do"; //나중에 로그인 화면으로 이동
        } else {
            model.addAttribute("errorMessage", "중복된 이메일입니다.");
            return "member/createMember";
        }
    }
    private Set<String> checkedEmails = new HashSet<>(); //이메일 체크 한번 했을 시 중복체크 x HashSet에 저장
    @PostMapping("/checkEmail.do")
    @ResponseBody
    public String checkEmail(String email) {
        // 이미 중복 체크한 이메일인 경우
        if (checkedEmails.contains(email)) {
            return "true";
        }

        // 중복 체크를 실제로 수행하고 결과를 캐시에 저장
        boolean isEmailExists = memberService.checkEmailExists(email);
        if (isEmailExists) {
            checkedEmails.add(email);
        }

        return String.valueOf(isEmailExists);
    }
}
