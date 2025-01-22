package test.vault.completedexams.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import test.vault.dashboard.services.TestService;
import test.vault.reporting.entities.Exam;
import test.vault.reporting.services.ExamService;
import test.vault.utility.SessionValidation;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CompletedExamController {

	@Autowired
	private ExamService examService;
	@Autowired
	TestService testService;

	@GetMapping("/user/completedTest")
	public String viewReport(Model model, HttpServletRequest request) {
		if (!SessionValidation.isUserSessionValid(request))
			return "redirect:/user/login";
		int userID = (Integer) request.getSession().getAttribute("userID");
		List<Exam> completedExams = examService.getExamsByUserId(userID);
		List<Integer> listOfNumberOfQuestions = new ArrayList<>();
		for (Exam exam : completedExams) {
			int numberOfQuestions = examService.getNumberOfQuestions(exam.getExamId());
			listOfNumberOfQuestions.add(numberOfQuestions);
		}

		for (Exam exam : completedExams)
			System.out.println(exam.toString());

		model.addAttribute("completedExams", completedExams);
		model.addAttribute("listOfNumberOfQuestions", listOfNumberOfQuestions);
		return "completedExamForUser";
	}

}
