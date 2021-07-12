package proj21_movie.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import proj21_movie.dto.Member;
import proj21_movie.dto.Withdrawal;
import proj21_movie.mapper.MemberMapper;
import proj21_movie.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	static final Log log = LogFactory.getLog(MemberServiceImpl.class);

	@Autowired
	private MemberMapper mapper;

	@Override
	public List<Member> getLists() {
		List<Member> list = mapper.selectMemberByAll();
		log.debug("service - getLists() > " + list.size());
		return list;
	}

	@Override
	public Member getMember(String memEmail) {
		log.debug("service - getMember() > " + memEmail);
		return mapper.selectMemberByEmail(memEmail);
	}

	@Override
	public int registerMember(Member member) {
		log.debug("service - registerMember() > " + member);
		return mapper.insertMember(member);
	}

	@Override
	public int modifyMember(Member member) {
		log.debug("service - modifyMember() > " + member);
		return mapper.updateMember(member);
	}

	@Override
	public int removeMember(String memEmail) {
		log.debug("service - removeMember() > " + memEmail);
		return mapper.deleteMember(memEmail);
	}

	@Override
	public Member selectMemberBymemEmail(String memEmail) {
		log.debug("service - removeMember() > " + memEmail);
		return mapper.selectMemberByEmail(memEmail);
	}

	// 로그인
	@Override
	public Member memberLogin(Member member) throws Exception {
		log.debug("service - memberLogin() > " + member);
		return mapper.memberLogin(member);
	}

	// 아이디 중복확인
	@Override
	public int idCheck(String memEmail) throws Exception {
		log.debug("service - idCheck() > " + memEmail);
		return mapper.idCheck(memEmail);
	}

	// 아이디찾기
	@Override
	public Member findId(Member member) {
		log.debug("service - findId() > " + member);
		return mapper.findId(member);
	}

	// 비밀번호 찾기
	@Override
	public String selectMember(Member member) {
		log.debug("service - selectMember() > " + member);
		return mapper.selectMember(member);
	}

	// 비밀번호 변경
	@Override
	public int pwUpdate_M(Member member) {
		log.debug("service - pwUpdate_M() > " + member);
		return mapper.pwUpdate_M(member);
	}

	// 패스워드 체크
	@Override
	public Member checkIDPW(Member member) throws Exception {
		log.debug("service - checkIDPW() > " + member);
		member.matchPassword(member.getMemPasswd());
		return mapper.checkIDPW(member);
	}

	// 회원 탈퇴
	@Override
	public void withdrawal(Member member) throws Exception {
		log.debug("service - pwUpdate_M() > " + member);
		mapper.withdrawal(member);
	}

	// 회원수정
	@Override
	public void update(Member member) throws Exception {
		log.debug("service - update() > " + member);
		mapper.update(member);
	}

}