package test.vault.test_management.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import test.vault.reporting.services.ExamService;
import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.Exam;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.Test;
import test.vault.test_management.repository.TestScoreDaoImpl;
import test.vault.test_management.services.PracticeTestServiceImpl;
import test.vault.test_management.services.StartTestServiceImpl;

@Controller
public class startTestController {

	@Autowired
	private PracticeTestServiceImpl practiceTestService;
	
	@Autowired
	private StartTestServiceImpl startTestService;

	@Autowired
	private TestScoreDaoImpl testScoreDaoImpl;

	@GetMapping("/startTest/{testId}/{userID}")
	public String viewTest(@PathVariable("testId") int testId, @PathVariable("userID") int userId,
			HttpServletRequest request, Model model) {

		Test test = practiceTestService.getTestById(testId);

		List<Integer> cleanedList = test.getListOfIdsOfQuestion();

		int time = test.getTotalTime();
		if (test.getType().equals("2")) {
			List<CodingQuestion> codingQuestions = practiceTestService.getAllCodingPracticeQuestion(cleanedList);
			model.addAttribute("codingQuestions", codingQuestions);
			request.setAttribute("time", time);

			return "StartCodingTest";
		} else {
			List<McqQuestion> mcqQuestions = practiceTestService.getAllMcqPracticeQuestion(cleanedList);
			model.addAttribute("mcqQuestions", mcqQuestions);
			request.setAttribute("time", time);

			return "StartMcqTest";
		}
	}

	@PostMapping("/submitScore")
	public String submitScore(@RequestParam int totalScore, @RequestParam int userId, @RequestParam int testId) {
		System.out.println(totalScore + "score");
		System.out.println(userId + "userId");
		System.out.println(testId + "TestId");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = dateFormat.format(date);
		Date creationDate = null;
		try {
			creationDate = dateFormat.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int numberOfQuestion = startTestService.nuberOfQuestions(testId);
		int result = 0;
		if (totalScore/(numberOfQuestion*2.0)*100>=60.0)
			result = 1;
		
		Exam exam = new Exam(testId, creationDate, totalScore, result, userId);
		testScoreDaoImpl.insertScore(exam);
		return "submitedTest";
	}

}
