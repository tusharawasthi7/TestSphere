
package test.vault.test_management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import test.vault.test_management.entities.Catalog;
import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.SubjectiveQuestion;
import test.vault.test_management.entities.Test;
import test.vault.test_management.services.AdminService;
import test.vault.utility.SessionValidation;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class addTestController {

	@Autowired
	private AdminService adminService;

	private int totalQuestions = 0;
	private int currentQuestionIndex = 1;

	@GetMapping("/addCodingTest")
	public String openCodingAddTestPage(HttpServletRequest request, Model model) {
		// session validation
		boolean checkSession = SessionValidation.isAdminSessionValid(request);
		if (checkSession == false)
			return "redirect:/admin/login";

		List<Catalog> catalogs = adminService.getCatalogDetails();
		model.addAttribute("catalogs", catalogs);
		return "/getQuestionCountForm";
	}

	@GetMapping("/addQuestions")
	public String showQuestionCountForm() {
		return "/questionCountForm";
	}

	@GetMapping("/setQuestionCount")
	public String openMcqAddTestPage(Model model) {
		List<Catalog> catalogs = adminService.getCatalogDetails();
		model.addAttribute("catalogs", catalogs);
		return "questionCountForm";
	}

	@PostMapping("/setQuestion")
	public String setQuestionCount(@RequestParam(name = "questionCount") int questionCount,
			@RequestParam(name = "startDate") String startDate, @RequestParam(name = "endDate") String endDate,
			@RequestParam(name = "description") String description, @RequestParam(name = "level") String level,
			@RequestParam(name = "type") String type, @RequestParam(name = "catalogId") int catalogId,
			@RequestParam(name = "time") int time, HttpSession session, HttpServletRequest request) {
		session.setAttribute("questionCount", questionCount);
		session.setAttribute("currentQuestion", 1);

		System.out.println("Time" + time);

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startSqlDate = null;
		Date endSQlDate = null;
		Date date = new Date();
		String str = dateFormat.format(date);
		Date creationDate = null;
		try {
			startSqlDate = dateFormat.parse(startDate);
			endSQlDate = dateFormat.parse(endDate);
			creationDate = dateFormat.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// Print catalogId and questionCount

		int adminID = (Integer) request.getSession().getAttribute("adminID");

		Test testDetails = new Test(catalogId, description, startSqlDate, endSQlDate, level, adminID, type,
				creationDate, questionCount, time);
		addDetailsOfMcqTest(testDetails);
		return "redirect:/addMcqQuestion";
	}

	public void addDetailsOfMcqTest(Test testDetails) {
		adminService.insertDetailsOfTest(testDetails);
	}

	@PostMapping("/addMcqQuestion")
	public String addMcqQuestions(@RequestParam(name = "title") String questionTitle,
			@RequestParam(name = "option") List<String> options,
			@RequestParam(name = "correct") List<Integer> correctOptions, HttpSession session,
			RedirectAttributes redirectAttributes) {

		adminService.insertMcqQuestion(new McqQuestion(questionTitle, options, correctOptions));

		int currentQuestion = (int) session.getAttribute("currentQuestion");
		int questionCount = (int) session.getAttribute("questionCount");

		if (currentQuestion < questionCount) {
			session.setAttribute("currentQuestion", currentQuestion + 1);
			return "redirect:/addMcqQuestion";
		} else {
			redirectAttributes.addFlashAttribute("popupMessage", "Test Created Successfully");
			// session.invalidate();
			addQuestionSetToTest(questionCount);
			return "redirect:/admin/dashboard"; // i have changed here
		}
	}

	public void addQuestionSetToTest(int count) {
		adminService.insertAllIdsIntoTest(count);
	}

	@GetMapping("/addMcqQuestion")
	public String showMcqForm(HttpSession session) {
		Integer currentQuestion = (Integer) session.getAttribute("currentQuestion");
		if (currentQuestion == null) {
			return "redirect:/addQuestions";
		}
		return "/singleQuestionForm";
	}

	@PostMapping("/setCoddingQuestionCount")
	public String setCoddingQuestionCount(@RequestParam("questionCount") int totalQuestions,

			@RequestParam(name = "startDate") String startDate,

			@RequestParam(name = "endDate") String endDate,

			@RequestParam(name = "description") String description,

			@RequestParam(name = "level") String level,

			@RequestParam(name = "type") String type,

			@RequestParam(name = "time") int time,

			@RequestParam(name = "catalogId") int catalogId, HttpSession session, HttpServletRequest request) {
		this.totalQuestions = totalQuestions;
		this.currentQuestionIndex = 1; // Reset index for new series of questions

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = dateFormat.format(date);
		Date startSqlDate = null;
		Date endSqlDate = null;
		Date creationDate = null;
		try {
			startSqlDate = dateFormat.parse(startDate);
			endSqlDate = dateFormat.parse(endDate);
			creationDate = dateFormat.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// Print catalogId and totalQuestions

		int adminID = (Integer) request.getSession().getAttribute("adminID");

		Test testDetails = new Test(catalogId, description, startSqlDate, endSqlDate, level, adminID, type,
				creationDate, totalQuestions, time);
		addDetailsOfMcqTest(testDetails);
		return "addCodingQuestionForm";
	}

	// Display the form to add a coding question
	@GetMapping("/addCodingQuestionForm")
	public String showQuestionForm(Model model) {
		model.addAttribute("currentQuestionIndex", currentQuestionIndex);
		model.addAttribute("totalQuestions", totalQuestions);
		return "addCodingQuestionForm";
	}

	// Handle submission of each coding question
	@PostMapping("/submitQuestion")
	public String submitQuestion(@RequestPart("image") MultipartFile image,
			@RequestParam("option") List<String> options, @RequestParam("correct") List<Integer> correctOptions,
			RedirectAttributes redirectAttributes, HttpServletRequest request) throws IOException, SQLException {
		// Save the question data to the database
		byte[] imageBytes = image.getBytes();
		CodingQuestion codingQuestion = new CodingQuestion(imageBytes, options, correctOptions);
		adminService.insertCodingQuestion(codingQuestion);

		// Increment the question index
		currentQuestionIndex++;

		int adminID = (Integer) request.getSession(false).getAttribute("adminID");
		System.out.println(adminID + "ADmin id");
		// Check if all questions are entered
		if (currentQuestionIndex > totalQuestions) {
			addCodingQuestionSetToTest(totalQuestions);
			redirectAttributes.addFlashAttribute("popupMessage", "Test Created Successfully");
			return "redirect:/admin/dashboard"; // Redirect to the home page after completing all questions
		}

		// Redirect to the same form for the next question
		return "addCodingQuestionForm";
	}

	public void addCodingQuestionSetToTest(int count) {
		adminService.insertCodingQuestionsAllIdsIntoTest(count);
	}

}
