package test.vault.authentication.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import test.vault.authentication.entities.Admin;
import test.vault.authentication.services.AuthenticationAdminService;
import test.vault.authentication.services.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	Admin admin;
	
	

	@Autowired
	AuthenticationAdminService authenticationAdminService;

	@GetMapping("/openLoginPage")
	public String openLoginPage() {
		return "admin/login";
	}

	@GetMapping("/openRegistrationPage")
	public String openRegistrationPage() {
		return "admin/registration";
	}

	@PostMapping("/login")
	public ModelAndView login(@RequestParam String username, @RequestParam String password, ModelAndView mView,
			HttpSession session) {

		System.out.println("\n Username : " + username);
		System.out.println("\n password : " + password);

		// In case login
		String destination = "admin/dashboard";
		String message = "Login successful";

		Optional<Admin> optAdmin = authenticationAdminService.fetchAdminDetails(username);

		if (optAdmin.isEmpty()) {

			System.out.println("Admin is empty");
			mView.setViewName("admin/login");
			mView.addObject("message", "Please check your credentials");
			return mView;
		}

		admin = optAdmin.get();
		boolean checkPassword = authenticationAdminService.matchPassword(password, admin);

		if (checkPassword) {
			int roleId = admin.getRole().getRoleId();
			boolean authorizationStatus = admin.getAuthorized();

			if (roleId == 1) {
				destination = "super_admin/dashboard";
				mView.addObject("admin", admin);
				message = "You have successfully logged in";
			} else if (roleId == 2) {
				if (authorizationStatus) {
					session.setAttribute("adminID", admin.getId());
					session.setAttribute("adminName", admin.getUsername());
					session.setAttribute("email", admin.getEmail());
					session.setAttribute("phoneNo", admin.getMobile());
					session.setAttribute("role", admin.getRole().getRoleId());
					return new ModelAndView("redirect:dashboard");
				} else {
					destination = "admin/login";
					message = "Your authorization is pending for approval...";
				}
			}
		}

		else {
			destination = "admin/login";
			message = "Please check your credentials";

		}
		// Directing the user to the page with data
		mView.setViewName(destination);
		mView.addObject("message", message);

		return mView;

	}

	@PostMapping("/registration")
	public ModelAndView registerAdmin(@ModelAttribute("admin") Admin admin) {
		ModelAndView mView = new ModelAndView("admin/registration");
		StringBuilder errorMessage = new StringBuilder();

		
		if (!authenticationAdminService.isUsernameUnique(admin.getUsername())) {
			mView.addObject("message", "Sub Admin already exists. Please choose a different admin name.");
			mView.addObject("status", "error");
			return mView;
		}

		
		// Manual validation for each field
		if (admin.getFullName() == null || admin.getFullName().trim().isEmpty()) {
			errorMessage.append("Full Name is required.<br>");
		} else if (admin.getFullName().length() < 3 || admin.getFullName().length() > 50) {
			errorMessage.append("Full Name must be between 3 and 50 characters.<br>");
		}

		if (admin.getMobile() == null || !admin.getMobile().matches("^[0-9]{10}$")) {
			errorMessage.append("Mobile number must be a valid 10-digit number.<br>");
		}

		if (admin.getEmail() == null || !admin.getEmail().matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {
			errorMessage.append("Email is not valid.<br>");
		}

		if (admin.getUsername() == null || admin.getUsername().trim().isEmpty()) {
			errorMessage.append("Username is required.<br>");
		} else if (admin.getUsername().length() < 3 || admin.getUsername().length() > 20) {
			errorMessage.append("Username must be between 3 and 20 characters.<br>");
		}

		if (admin.getPassword() == null || admin.getPassword().length() < 6) {
			errorMessage.append("Password must be at least 6 characters long.<br>");
		}

		if (admin.getRole() == null) {
			errorMessage.append("Role is required.<br>");
		}

		// Check if there are any errors
		if (errorMessage.length() > 0) {
			mView.addObject("errorMessage", errorMessage.toString());
			return mView; // Return to the registration page with errors
		}

		String message;
		String destination;

		try {
			int result = authenticationAdminService.registerAdmin(admin);
			if (result > 0) {
				message = "Registration Successful. Please login to continue.";
				destination = "admin/login";
			} else {
				message = "Registration failed. Please try again.";
				destination = "admin/registration";
			}
		} catch (Exception e) {
			message = "An error occurred during registration. Please try again.";
			destination = "admin/registration";
			e.printStackTrace();
		}

		mView.setViewName(destination);
		mView.addObject("message", message);
		return mView;
	}

	@GetMapping("/changeAuth/{adminId}")
	public String changeAuth(@PathVariable int adminId) {

		authenticationAdminService.modifyAuthority(adminId);

		return "redirect:/superadmin/openViewSubAdminsPage";
	}
}
