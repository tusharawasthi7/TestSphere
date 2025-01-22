package test.vault.authentication.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.vault.authentication.entities.ExamCatalog;
import test.vault.authentication.services.ExamCatalogService;



@Controller
public class ExamCatalogController {

    @Autowired
    private ExamCatalogService examCatalogService;

    // Display the form to assign exams
    @GetMapping("/exam/assign_exam")
    public String showAssignExamForm() {
        return "exam/assign_exam"; // Refers to assign_exam.jsp
    }

    // Handle form submission
    @PostMapping("/exam/assign_exam")
    public String assignExam(@RequestParam String catalogName,
                             @RequestParam String language,
                             @RequestParam(required = false, defaultValue = "false") boolean isMcq,
                             @RequestParam(required = false, defaultValue = "false") boolean isCoding,
                             Model model) {
        // Save to database
        ExamCatalog examCatalog = examCatalogService.assignExamType(catalogName, language, isMcq, isCoding);

        // Add attributes to the model
        model.addAttribute("examCatalog", examCatalog);

        model.addAttribute("adminsList", "Catalog created succesfully");
        // Redirect to success page
        return "exam/assign_success"; // Refers to assign_success.jsp
    }
}
