package test.vault.authentication.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import test.vault.authentication.entities.User;
import test.vault.authentication.services.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	@GetMapping("/openLoginPage")
	public String openLoginPage() {
		return "user/login";
	}

	@GetMapping("/openRegistrationPage")
	public String openRegistrationPage() {
		return "user/registration";
	}

	@PostMapping("/login")
	public ModelAndView login(@RequestParam String username, @RequestParam String password, ModelAndView mView,
			HttpSession session) {

		mView.setViewName("user/login");

		String destination = "user/login";
		String message = "Login Failed!Please check your credentials";
		User user = userService.fetchSingleUser(username);
		if (user != null) {
			if (userService.doesUserExists(username, password)) {
				session.setAttribute("userID", user.getId());
				session.setAttribute("userName", user.getName());
				session.setAttribute("email", user.getEmailId());
				session.setAttribute("phoneNo", user.getPhoneNo());
				return new ModelAndView("redirect:/user/dashboard");
			}
		}
		mView.setViewName(destination);
		mView.addObject("message", message);
		return mView;
	}

	@PostMapping("/registration")
	public ModelAndView userRegistration(@ModelAttribute User user, ModelAndView mView) {

		mView.setViewName("user/registration");

		if (!userService.isUsernameUnique(user.getName())) {
			mView.addObject("message", "Username already exists. Please choose a different username.");
			mView.addObject("status", "error");
			return mView;
		}

		String message = validateUser(user);
		if (!message.isEmpty()) {
			mView.addObject("message", message);
			return mView;
		}

		int result = userService.registerUser(user);
		if (result > 0) {
			message = "Registration Successful. Please login to continue.";
			mView.setViewName("user/login");
		} else {
			message = "Registration failed. Please try again.";
		}

		mView.addObject("message", message);
		return mView;
	}

	private String validateUser(User user) {
		if (user.getName() == null || user.getName().isEmpty()) {
			return "Name is required.";
		}
		if (user.getPassword() == null || user.getPassword().length() < 8) {
			return "Password must be at least 8 characters long.";
		}
		if (user.getEmailId() == null || !user.getEmailId().matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
			return "Invalid email address.";
		}
		if (user.getPhoneNo() == null || !user.getPhoneNo().matches("\\d{10}")) {
			return "Phone number must be a valid 10-digit number.";
		}
		return "";
	}

}
