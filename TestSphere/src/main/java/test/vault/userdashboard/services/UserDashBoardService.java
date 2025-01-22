package test.vault.userdashboard.services;

import java.util.HashSet;
import java.util.List;
import test.vault.dashboard.entities.Test;

public interface UserDashBoardService {
	List<Test> fetchAllRunningTest(int userID);

	List<Test> fetchAllCloseTest();

	List<Test> getAllUpcomingTest(int userId);

	HashSet<Integer> getTestGivenByUser(int userID);
}
