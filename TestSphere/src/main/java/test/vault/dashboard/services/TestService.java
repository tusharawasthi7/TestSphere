package test.vault.dashboard.services;

import java.util.List;
import test.vault.dashboard.entities.Test;

public interface TestService {
	List<Test>  getAllRunningTestByAdminID(int adminId);
	List<Test>  getAllCloseTestByAdminID(int adminId);

}
