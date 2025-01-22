package test.vault.userdashboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import test.vault.dashboard.entities.Test;
import test.vault.userdashboard.services.UserDashBoardService;
import test.vault.utility.SessionValidation;

import java.util.List;

@Controller
public class UserDashBoardController {

	@Autowired
	private UserDashBoardService userDashBoardService;

	@GetMapping("/user/dashboard")

	public String viewDashBoard(Model model, HttpServletRequest request) {
		if (!SessionValidation.isUserSessionValid(request))
			return "redirect:/user/login";

		int userID = (Integer) request.getSession().getAttribute("userID");
		List<Test> runningTest = userDashBoardService.fetchAllRunningTest(userID);
		List<Test> closeTest = userDashBoardService.fetchAllCloseTest();

		String userName = (String) request.getSession().getAttribute("userName");
		String email = (String) request.getSession().getAttribute("email");
		String phoneNo = (String) request.getSession().getAttribute("phoneNo");
		int totalTest = userDashBoardService.getTestGivenByUser(userID).size();
		model.addAttribute("userID", userID);
		model.addAttribute("userName", userName);
		model.addAttribute("email", email);
		model.addAttribute("phoneNo", phoneNo);
		model.addAttribute("totalTest", totalTest);
		model.addAttribute("closeTest", closeTest);
		model.addAttribute("runningTest", runningTest);

		return "realUserDashboard";
	}

	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
		System.out.println("reached herrejhjhfdhgc");
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:user/login";
	}
}
