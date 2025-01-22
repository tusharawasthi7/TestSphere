package test.vault.admintest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import test.vault.admintest.entities.Exam;
import test.vault.admintest.services.TestHistoryService;
import test.vault.dashboard.entities.Test;
import test.vault.utility.SessionValidation;

import java.util.List;

@Controller
public class TestHistoryController {

	@Autowired
	TestHistoryService testHistoryService;

	@GetMapping("/testHistory")
	public String viewReport(Model model, HttpServletRequest request) {
		boolean checkSession = SessionValidation.isAdminSessionValid(request);
		if (checkSession == false)
			return "redirect:/admin/login";

		// getting session if not already created
		int adminID = (Integer) request.getSession(false).getAttribute("adminID");
		List<Test> testHistory = testHistoryService.getTestHistoryByAdminId(adminID);
		model.addAttribute("testHistory", testHistory);
		return "testHistory";
	}
}
