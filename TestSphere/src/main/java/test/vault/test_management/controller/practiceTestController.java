package test.vault.test_management.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.Test;
import test.vault.test_management.services.PracticeTestServiceImpl;

@Controller
@RequestMapping("/user")
public class practiceTestController {

	@Autowired
	private PracticeTestServiceImpl practiceTestService;

	@GetMapping("/practiceTest")
	public String openPracticeTest() {
		return "practiceTest";
	}

	@GetMapping("/registerService/{testId}")
	public String viewTest(@PathVariable("testId") int testId, HttpServletRequest request, Model model) {
		Test test = practiceTestService.getTestById(testId);
		test.getType();
		List<Integer> cleanedList = test.getListOfIdsOfQuestion();

		if (test.getType().equals("2")) {
			List<CodingQuestion> codingQuestions = practiceTestService.getAllCodingPracticeQuestion(cleanedList);
			model.addAttribute("codingQuestions", codingQuestions);
			return "codingQuestionsPractice";
		} else {
			List<McqQuestion> mcqQuestions = practiceTestService.getAllMcqPracticeQuestion(cleanedList);
			model.addAttribute("mcqQuestions", mcqQuestions);
			return "mcqQuestionsPractice";
		}
	}

	@GetMapping("/allClosedTest")
	public String openClosedTestList(HttpServletRequest request) {
		List<Test> tests = practiceTestService.getAllTestsWithQuestions();
		request.setAttribute("listOfTests", tests);
		for (int i = 0; i < tests.size(); i++) {
			System.out.println(tests.get(i).getListOfIdsOfQuestion());
		}
		return "allClosedTests";
	}

	//
	@GetMapping("/allStartTest")
	public String openStartTestList(HttpServletRequest request) {
		List<Test> tests = practiceTestService.getAllTestsWithQuestions();
		request.setAttribute("listOfTests", tests);
		for (int i = 0; i < tests.size(); i++) {
			System.out.println(tests.get(i).getListOfIdsOfQuestion());
		}
		return "startTest";
	}

//
	@GetMapping("/questionPractice")
	public String getAllTests(HttpServletRequest request, @RequestParam(name = "idPracticeTest") int catalogId) {
		List<Test> tests = practiceTestService.getAllTestsWithQuestions();
		List<Test> codingTests = new ArrayList<>();
		List<Test> mcqTests = new ArrayList<>();
		for (int i = 0; i < tests.size(); i++) {
			if (tests.get(i).getType().toLowerCase().equals("1")) {
				System.out.println(tests.get(i).getType().toLowerCase() + "type");
				mcqTests.add(tests.get(i));
			} else {
				System.out.println(tests.get(i).getType().toLowerCase() + "type");
				codingTests.add(tests.get(i));
			}
		}

		if (catalogId == 2) {
			request.setAttribute("listOfTests", codingTests);
			return "codingQuestionsListForPractice";
		} else {
			request.setAttribute("listOfTests", mcqTests);
			return "mcqQuestionsListForPractice";
		}
	}

	@PostMapping("/codingPracticeQuestions")
	public String openCodingQuestion(@RequestParam(name = "listOfIdsQuestions") List<String> listOfIdsQuestions,
			Model model) {
		List<Integer> cleanedList = new ArrayList<>();
		for (String item : listOfIdsQuestions) {
			cleanedList.add(Integer.parseInt(item.replaceAll("[\\[\\] ,]", "").trim()));
		}

		List<CodingQuestion> codingQuestions = practiceTestService.getAllCodingPracticeQuestion(cleanedList);
		model.addAttribute("codingQuestions", codingQuestions);
		return "codingQuestionsPractice";
	}

	//
	@PostMapping("/startCodingTest")
	public String openCodingTest(@RequestParam(name = "listOfIdsQuestions") List<String> listOfIdsQuestions,
			Model model) {
		List<Integer> cleanedList = new ArrayList<>();
		for (String item : listOfIdsQuestions) {
			cleanedList.add(Integer.parseInt(item.replaceAll("[\\[\\] ,]", "").trim()));
		}
		List<CodingQuestion> codingQuestions = practiceTestService.getAllCodingPracticeQuestion(cleanedList);
		model.addAttribute("codingQuestions", codingQuestions);
		return "startCodingTest";
	}

//
	@PostMapping("/mcqPracticeQuestions")
	public String openMcqQuestion(@RequestParam(name = "listOfIdsQuestions") List<String> listOfIdsQuestions,
			Model model) {
		List<Integer> cleanedList = new ArrayList<>();
		for (String item : listOfIdsQuestions) {
			cleanedList.add(Integer.parseInt(item.replaceAll("[\\[\\],]", "").trim()));
		}
		List<McqQuestion> mcqQuestions = practiceTestService.getAllMcqPracticeQuestion(cleanedList);
		model.addAttribute("mcqQuestions", mcqQuestions);
		return "mcqQuestionsPractice";
	}

}
