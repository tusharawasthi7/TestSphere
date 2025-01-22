package test.vault.register.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.vault.register.repository.RegisterDao;

@Service
public class RegisterServiceImple implements RegisterService {

	@Autowired
	RegisterDao registerDao;

	@Override
	public void registerUserForTest(int testID, int userID) {
		registerDao.registerUserForTest(testID, userID);
	}

}
