package test.vault.utility;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionValidation {

	public static boolean isAdminSessionValid(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		boolean sessionCheck = false;
		if (session != null && session.getAttribute("adminID") != null)
			sessionCheck = true;

		return sessionCheck;
	}

	public static boolean isUserSessionValid(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		boolean sessionCheck = false;
		if (session != null && session.getAttribute("userID") != null)
			sessionCheck = true;

		return sessionCheck;
	}

}
