package test.vault.admintest.repository;

import java.util.List;

import test.vault.dashboard.entities.Test;

public interface TestHistoryDao {
	List<Test> getTestByAdminId(int adminId);

}
