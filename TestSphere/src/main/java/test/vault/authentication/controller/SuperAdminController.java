package test.vault.authentication.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import test.vault.authentication.entities.Admin;
import test.vault.authentication.services.AuthenticationAdminService;

@Controller
@RequestMapping("/superadmin")
public class SuperAdminController {

	@Autowired
	AuthenticationAdminService adminService;

	@GetMapping("/openViewSubAdminsPage")
	public String openViewSubAdminsPage(Model model, RedirectAttributes redirectAttributes) {

		List<Admin> adminsList = adminService.fetchAllAdmin(2);

		model.addAttribute("adminsList", adminsList);
//		redirectAttributes.addFlashAttribute("popupMessage", "Registration for Successfull");

		return "super_admin/view_sub_admins";

	}

}
