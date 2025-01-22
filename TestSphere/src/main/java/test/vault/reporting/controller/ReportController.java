package test.vault.reporting.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
 
import jakarta.servlet.http.HttpServletRequest;
import test.vault.reporting.entities.Certificate;
import test.vault.reporting.entities.Exam;
import test.vault.reporting.services.ExamService;

import test.vault.utility.SessionValidation;
 
import java.util.ArrayList;
import java.util.List;
 
@Controller
public class ReportController {
 
	@Autowired
	private ExamService examService;
	
	
 
	@GetMapping("/viewReport/{testID}")
 
	public String viewReport(Model model, @PathVariable int testID, HttpServletRequest request) {
		// session validation
		boolean checkSession = SessionValidation.isAdminSessionValid(request);
		if (checkSession == false)
			return "redirect:/admin/login";
		List<Exam> exams = examService.getExamsByTestId(testID);
		List<Integer> noOfQuestion=new ArrayList<Integer>();
		for(Exam exam:exams)
		{
			noOfQuestion.add(examService.getNumberOfQuestions(exam.getExamId()));
		}
		for(Exam exam:exams)
		{
			System.out.println(exam+"---------------------------->"+(examService.getNumberOfQuestions(exam.getExamId())));
		}

		model.addAttribute("noOfQuestion",noOfQuestion);
		model.addAttribute("exams", exams);
		return "viewExam";
	}
 
	@GetMapping("/certificate/{examID}")
	public String certificate(Model model, @PathVariable int examID) {
		Certificate myCertificate = examService.certificateForUser(examID);
		model.addAttribute("Certificate", myCertificate);
		return "certificate";
	}
}