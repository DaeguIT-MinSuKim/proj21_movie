package proj21_movie.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj21_movie.service.MemberService;

@RestController
@RequestMapping("/api")
public class RestWithdrawalController {
	static final Log log = LogFactory.getLog(RestWithdrawalController.class);

	@Autowired
	private MemberService service;

	@ResponseBody
	@RequestMapping(value = "withdrawal", method = RequestMethod.GET)
	public String userDelete(@RequestParam String memEmail, HttpSession session) throws Exception {
		service.removeMember(memEmail);
		service.userDelete(memEmail, session);
		return "redirect:/main";
	}

}
