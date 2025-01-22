package test.vault.test_management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.Test;
import test.vault.test_management.services.AdminService;
import test.vault.test_management.services.TestServiceImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

@Controller
public class UpdateTestController {

	@Autowired
	private TestServiceImpl testService;
	@Autowired
	private AdminService adminService;

	@GetMapping("/addExtraQuestion")
	public String addExtraQuestionOnUpdate(@RequestParam("testId") int testId, Model model) {
		Test test = testService.getTestById(testId);

		model.addAttribute("testId", testId);
		model.addAttribute("listOfIdsOfQuestion", test.getListOfIdsOfQuestion());
		model.addAttribute("type", test.getType());
		return "addExtraQuestionOnUpdate";
	}

	@SuppressWarnings("unused")
	@GetMapping("/updateTest")
	public String getAllTests(HttpServletRequest request, Model model) {
		String adminIdParam = (Integer) request.getSession().getAttribute("adminID") + "";

		if (adminIdParam != null) {
			try {
				int adminID = Integer.parseInt(adminIdParam);
				request.setAttribute("adminID", adminID);
				// Retrieve the tests as usual
				List<Test> tests = testService.getAllTestsWithQuestions(adminID);
				request.setAttribute("listOfTests", tests);

				// model.addAttribute("popupMessage","Test updates successfully");
				return "updateTest";
			} catch (NumberFormatException e) {
				// Handle the case where adminID is not a valid integer
				e.printStackTrace();
				return "index";
			}
		} else {
			return "redirect:/admin/login"; // If adminID is not provided, redirect to login
		}

	}

	@PostMapping("/editCodingQuestion")
	public String submitQuestion(@RequestParam("idOfQuestion") int questionId,
			@RequestParam("image") MultipartFile image, @RequestParam("option") List<String> options,
			@RequestParam("correct") List<Integer> correctOptions, HttpSession session, HttpServletRequest request)
			throws IOException, SerialException, SQLException {

		byte[] imageBytes = image.getBytes();
		CodingQuestion codingQuestion = new CodingQuestion(imageBytes, options, correctOptions);
		testService.editedCodingQuestion(codingQuestion, questionId);

		return handleNextQuestion(session, request);
	}

	@PostMapping("/editMcqQuestion")
	public String addMcqQuestions(@RequestParam("idOfQuestion") int questionId,
			@RequestParam("title") String questionTitle, @RequestParam("option") List<String> options,
			@RequestParam("correct") List<Integer> correctOptions, HttpSession session, HttpServletRequest request) {

		McqQuestion mcqQuestion = new McqQuestion(questionTitle, options, correctOptions);
		testService.editMcqQuestion(mcqQuestion, questionId);

		return handleNextQuestion(session, request);
	}

	@PostMapping("/updateTestStatus")
	public String updateTestStatus(@RequestParam int testId, @RequestParam String status) {
		testService.updateStatus(status, testId);
		return "redirect:/updateTest";
	}

	@GetMapping("/receiveUpdate")
	public String receiveUpdate(@RequestParam(name = "testId") int testId,
			@RequestParam(name = "catalogId") String catalogId, @RequestParam List<String> listOfIdsQuestions,
			HttpServletRequest request) {

		request.setAttribute("testId", testId);
		List<Integer> cleanedList = new ArrayList<>();
		for (String item : listOfIdsQuestions) {
			cleanedList.add(Integer.parseInt(item.replaceAll("[\\[\\],]", "").trim()));
		}

		request.setAttribute("remainingQuestionIds", cleanedList);
		request.setAttribute("catalogId", catalogId);

		if (catalogId.equals("2")) {
			request.setAttribute("type", "coding");
		} else {
			request.setAttribute("type", "mcq");
		}
		return "editTestDetails";
	}

	@GetMapping("/updateTestQuestions")
	public String updateTestQuestions(@RequestParam String catalogId, @RequestParam List<String> listOfIdsQuestions,
			HttpServletRequest request) {

		List<Integer> cleanedList = new ArrayList<>();
		for (String item : listOfIdsQuestions) {
			cleanedList.add(Integer.parseInt(item.replaceAll("[\\[\\],]", "").trim()));
		}

		HttpSession session = request.getSession();
		session.setAttribute("remainingQuestionIds", cleanedList);
		session.setAttribute("catalogId", catalogId);

		return loadQuestion(cleanedList.get(0), catalogId, request);
	}

	@PostMapping("/updateTestDetails")
	public String updateTestDetails(@RequestParam(name = "startDate") String startDate,
			@RequestParam(name = "endDate") String endDate, @RequestParam(name = "description") String description,
			@RequestParam(name = "level") String level, @RequestParam(name = "type") String type,
			@RequestParam(name = "testId") int testId, @RequestParam String catalogId,
			@RequestParam List<String> listOfIdsQuestions, @RequestParam int time, HttpServletRequest request) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startSqlDate = null;
		Date endSqlDate = null;
		Date date = new Date();
		String str = dateFormat.format(date);
		Date editedDate = null;
		try {
			startSqlDate = dateFormat.parse(startDate);
			endSqlDate = dateFormat.parse(endDate);
			editedDate = dateFormat.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Test testDetails = new Test(description, startSqlDate, endSqlDate, level, type, editedDate, time);
		testService.editDetailsOfTest(testDetails, testId);

		List<Integer> cleanedList = new ArrayList<>();
		for (String item : listOfIdsQuestions) {
			cleanedList.add(Integer.parseInt(item.replaceAll("[\\[\\],]", "").trim()));
		}

		HttpSession session = request.getSession();
		session.setAttribute("remainingQuestionIds", cleanedList);
		session.setAttribute("catalogId", catalogId);

		return loadQuestion(cleanedList.get(0), catalogId, request);
	}

	private String handleNextQuestion(HttpSession session, HttpServletRequest request) {
		@SuppressWarnings("unchecked")
		List<Integer> remainingQuestionIds = (List<Integer>) session.getAttribute("remainingQuestionIds");
		String catalogId = (String) session.getAttribute("catalogId");

		remainingQuestionIds.remove(0);

		if (remainingQuestionIds.isEmpty()) {
			session.removeAttribute("remainingQuestionIds");
			session.removeAttribute("catalogId");
			return "redirect:/updateTest";
		}

		return loadQuestion(remainingQuestionIds.get(0), catalogId, request);
	}

	private String loadQuestion(int questionId, String catalogId, HttpServletRequest request) {
		System.out.println(catalogId);
		if (catalogId.equals("2")) {
			CodingQuestion codingQuestion = testService.getCodingQuestion(questionId);
			String base64Image = Base64.getEncoder().encodeToString(codingQuestion.getImage());
			request.setAttribute("IdOfQuestion", questionId);
			request.setAttribute("image", base64Image);
			request.setAttribute("Options", codingQuestion.getOptions());
			request.setAttribute("CorrectOption", codingQuestion.getCorrectAnswer());
			return "editCodingTestQuestion";
		} else {
			McqQuestion mcqQuestion = testService.getMcqQuestion(questionId);
			request.setAttribute("IdOfQuestion", questionId);
			request.setAttribute("title", mcqQuestion.getQuestionTitle());
			request.setAttribute("Options", mcqQuestion.getOptions());
			request.setAttribute("CorrectOption", mcqQuestion.getCorrectAnswer());
			return "editMcqTestQuestion";
		}
	}

	@PostMapping("/processAddExtraQuestions")
	public String processAddExtraQuestions(@RequestParam("testId") int testId,
			@RequestParam("listOfIdsOfQuestion") String listOfIdsOfQuestion, @RequestParam("type") int type,
			@RequestParam("questionCount") int questionCount, Model model, HttpServletRequest request) {

		request.setAttribute("testId", testId);
		request.setAttribute("listOfIdsOfQuestion", listOfIdsOfQuestion);
		request.setAttribute("type", type);
		request.setAttribute("questionCount", questionCount);
		model.addAttribute("currentCount", 1);

		listOfIdsOfQuestion = listOfIdsOfQuestion.substring(1, listOfIdsOfQuestion.length() - 1);
		// Split the string by commas
		String[] stringArray = listOfIdsOfQuestion.split(",");
		// Convert the string array to a list of integers
		List<Integer> integerList = new ArrayList<>();
		for (String s : stringArray) {
			integerList.add(Integer.parseInt(s.trim()));
		}
		// System.out.println("List ===" + integerList);
		if (type == 1) {
			return "addExtraMcqQuestionOnUpdate";
		} else {
			return "addExtraCodingQuestionOnUpdate";
		}

	}

	@PostMapping("/addExtraMcqQuestion")
	public String addMcqQuestions(@RequestParam(name = "title") String questionTitle,
			@RequestParam(name = "option") List<String> options,
			@RequestParam(name = "correct") List<Integer> correctOptions, @RequestParam(name = "testId") String testId,
			@RequestParam(name = "listOfIdsOfQuestion") String listOfIdsOfQuestion,
			@RequestParam(name = "questionCount") String questionCount,
			@RequestParam(name = "currentCount") String currentCount, Model model, HttpServletRequest request) {

		// Parse inputs
		int intIdOfTest = Integer.parseInt(testId);
		int intQuestionCount = Integer.parseInt(questionCount);
		int currentCountValue = Integer.parseInt(currentCount);

		// Process the MCQ question
		adminService.insertMcqQuestion(new McqQuestion(questionTitle, options, correctOptions));

		// Update the list of questions
		listOfIdsOfQuestion = listOfIdsOfQuestion.substring(1, listOfIdsOfQuestion.length() - 1);
		String[] stringArray = listOfIdsOfQuestion.split(",");
		List<Integer> integerList = new ArrayList<>();
		for (String s : stringArray) {
			integerList.add(Integer.parseInt(s.trim()));
		}

		List<Integer> insertedQuestionIds = testService.getQuestionsId(1);
		integerList.addAll(insertedQuestionIds);

		// Check if all questions are added
		if (currentCountValue < intQuestionCount) {
			// Increment current count and reload form
			model.addAttribute("currentCount", currentCountValue + 1);
			request.setAttribute("testId", testId);
			request.setAttribute("listOfIdsOfQuestion", integerList);
			request.setAttribute("questionCount", questionCount);
			request.setAttribute("currentCount", currentCountValue + 1);
			return "addExtraMcqQuestionOnUpdate";
		} else {
			testService.updateTestForNewQuestions(intIdOfTest, integerList);
			return "redirect:admin/dashboard"; // Replace with actual completion page
		}
	}

	@PostMapping("/addExtraCodingQuestion")
	public String addCodingQuestions(@RequestPart(name = "image") MultipartFile image,
			@RequestParam(name = "option") List<String> options,
			@RequestParam(name = "correct") List<Integer> correctOptions, @RequestParam(name = "testId") String testId,
			@RequestParam(name = "listOfIdsOfQuestion") String listOfIdsOfQuestion,
			@RequestParam(name = "questionCount") String questionCount,
			@RequestParam(name = "currentCount") String currentCount, Model model, HttpServletRequest request)
			throws IOException {

		// Parse inputs
		int intIdOfTest = Integer.parseInt(testId);
		int intQuestionCount = Integer.parseInt(questionCount);
		int currentCountValue = Integer.parseInt(currentCount);

		// Process the Coding question
		byte[] imageBytes = image.getBytes();
		CodingQuestion codingQuestion = new CodingQuestion(imageBytes, options, correctOptions);
		try {
			adminService.insertCodingQuestion(codingQuestion);
		} catch (SerialException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// Update the list of question IDs
		listOfIdsOfQuestion = listOfIdsOfQuestion.substring(1, listOfIdsOfQuestion.length() - 1);
		String[] stringArray = listOfIdsOfQuestion.split(",");
		List<Integer> integerList = new ArrayList<>();
		for (String s : stringArray) {
			integerList.add(Integer.parseInt(s.trim()));
		}

		List<Integer> insertedQuestionIds = testService.getCodingQuestionsId(1);
		integerList.addAll(insertedQuestionIds);

		// Check if all questions are added
		if (currentCountValue < intQuestionCount) {
			// Increment current count and reload form
			model.addAttribute("currentCount", currentCountValue + 1);
			request.setAttribute("testId", testId);
			request.setAttribute("listOfIdsOfQuestion", integerList);
			request.setAttribute("questionCount", questionCount);
			request.setAttribute("currentCount", currentCountValue + 1);
			return "addExtraCodingQuestionOnUpdate"; // Replace with your JSP page name for the form
		} else {
			testService.updateTestForNewQuestions(intIdOfTest, integerList);
			return "redirect:admin/dashboard"; // Replace with actual completion page
		}
	}

}
