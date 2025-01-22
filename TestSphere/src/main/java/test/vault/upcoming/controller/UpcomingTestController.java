package test.vault.upcoming.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import test.vault.dashboard.entities.Test;
import test.vault.userdashboard.services.UserDashBoardService;
import test.vault.utility.SessionValidation;

import java.util.HashSet;
import java.util.List;

@Controller
public class UpcomingTestController {

	@Autowired
	private UserDashBoardService userDashBoardService;

	@GetMapping("/user/upcoming")

	public String viewReport(Model model, HttpServletRequest request) {
		if (!SessionValidation.isUserSessionValid(request))
			return "redirect:/user/login";

		int userID = (Integer) request.getSession().getAttribute("userID");
		System.out.println("This is Upcoming test for user");
		List<Test> upcomingTest = userDashBoardService.getAllUpcomingTest(userID);
		HashSet<Integer> testGivenByUser = userDashBoardService.getTestGivenByUser(userID);
		model.addAttribute("upcomingTest", upcomingTest);
		model.addAttribute("testGivenByUser", testGivenByUser);
		return "upcomingTest";
	}
}
