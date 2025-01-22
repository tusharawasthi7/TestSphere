package test.vault.userdashboard.services;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.vault.dashboard.entities.Test;
import test.vault.userdashboard.repository.UserDashboardDao;

@Service
public class UserDashBoardServiceImplementation implements UserDashBoardService {

	@Autowired
	UserDashboardDao userDashBoardDao;

	@Override
	public List<Test> fetchAllRunningTest(int userID) {
		return userDashBoardDao.getAllRunningTest(userID);
	}

	@Override
	public List<Test> fetchAllCloseTest() {
		return userDashBoardDao.getAllCloseTest();
	}

	@Override
	public List<Test> getAllUpcomingTest(int userId) {
		return userDashBoardDao.getAllUpcomingTestForUser(userId);
	}

	@Override
	public HashSet<Integer> getTestGivenByUser(int userID) {
		return userDashBoardDao.getAllGivenTestByUser(userID);
	}

}
