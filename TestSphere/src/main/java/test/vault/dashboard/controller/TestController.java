package test.vault.dashboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import test.vault.dashboard.entities.Test;
import test.vault.dashboard.services.TestService;
import test.vault.utility.SessionValidation;

import java.util.List;

@Controller
public class TestController {
	@Autowired
	TestService testService;

	@GetMapping("/admin/dashboard")
	public String openHomePage(Model model, HttpServletRequest request) {
		// session validation
		boolean checkSession = SessionValidation.isAdminSessionValid(request);
		if (checkSession == false)
			return "redirect:/admin/login";
		// After updatading db write query to fetch only running test and close test

		int adminID = (Integer) request.getSession().getAttribute("adminID");
		List<Test> allRunningTestByAdminID = testService.getAllRunningTestByAdminID(adminID);
		List<Test> allCloseTestByAdminID = testService.getAllCloseTestByAdminID(adminID);

		String adminName = (String) request.getSession().getAttribute("adminName");
		String email = (String) request.getSession().getAttribute("email");
		String phoneNo = (String) request.getSession().getAttribute("phoneNo");
		Integer role = (Integer) request.getSession().getAttribute("role");
		int totalTest = allRunningTestByAdminID.size() + allCloseTestByAdminID.size();
		model.addAttribute("adminID", adminID);
		model.addAttribute("adminName", adminName);
		model.addAttribute("email", email);
		model.addAttribute("phoneNo", phoneNo);
		model.addAttribute("role", role);
		model.addAttribute("totalTest", totalTest);
		model.addAttribute("allRunningTestByAdminID", allRunningTestByAdminID);
		model.addAttribute("allCloseTestByAdminID", allCloseTestByAdminID);
		return "index";
	}

	@GetMapping("adminlogout")
	public String logout(HttpServletRequest request) {
		System.out.println("Admin Logout url hit");
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:admin/login";
	}
}
