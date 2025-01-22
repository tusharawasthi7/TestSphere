package test.vault.dashboard.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.vault.dashboard.entities.Test;
import test.vault.dashboard.repository.TestDao;

@Service
public class TestServiceImplementation implements TestService {

	@Autowired
	TestDao testDao;
	@Override
	public List<Test> getAllRunningTestByAdminID(int adminId) {
		return testDao.getAllRunningTestByAdminID(adminId);
	}

	@Override
	public List<Test> getAllCloseTestByAdminID(int adminId) {
		return testDao.getAllCloseTestByAdminID(adminId);

	}
}
