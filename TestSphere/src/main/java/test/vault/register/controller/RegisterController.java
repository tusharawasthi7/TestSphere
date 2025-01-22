package test.vault.register.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import test.vault.register.services.RegisterService;
import test.vault.utility.SessionValidation;

@Controller
public class RegisterController {
	@Autowired
	private RegisterService registerService;

	@GetMapping("/registerService/{testID}")
	public ModelAndView registerForTest(ModelAndView model, @PathVariable int testID, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		// session validaton
		boolean checkSession = SessionValidation.isUserSessionValid(request);
		if (checkSession == false)
			return new ModelAndView("redirect:/user/login");
		int userID = (Integer) request.getSession().getAttribute("userID");
		registerService.registerUserForTest(testID, userID);
		redirectAttributes.addFlashAttribute("popupMessage", "Registered  Successfully");
		return new ModelAndView("redirect:/user/dashboard");
	}

}
