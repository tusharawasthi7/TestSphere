package test.vault.userdashboard.repository;

import java.util.HashSet;
import java.util.List;

import test.vault.dashboard.entities.Test;

public interface UserDashboardDao {
	List<Test> getAllCloseTest();

	List<Test> getAllUpcomingTestForUser(int userId);

	List<Test> getAllRunningTest(int userID);

	public HashSet<Integer> getAllGivenTestByUser(int userID);
}
