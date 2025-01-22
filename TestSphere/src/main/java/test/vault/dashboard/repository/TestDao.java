package test.vault.dashboard.repository;

import java.util.List;

import test.vault.dashboard.entities.Test;

public interface TestDao {
	List<Test> getAllRunningTestByAdminID(int adminId);

	List<Test> getAllCloseTestByAdminID(int adminId);

}
