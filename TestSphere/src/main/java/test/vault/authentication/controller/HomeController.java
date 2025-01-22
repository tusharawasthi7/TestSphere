package test.vault.authentication.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/HomePage")
	public String home() {
		return "homepage"; // Refers to the home page JSP
	}

	@GetMapping("/user/login")
	public String userLogin() {
		return "user/login"; // Refers to userlogin.jsp
	}

	@GetMapping("/admin/login")
	public String adminLogin() {
		return "admin/login"; // Refers to admin.jsp
	}
}
