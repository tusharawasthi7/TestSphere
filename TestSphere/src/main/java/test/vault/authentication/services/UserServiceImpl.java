package test.vault.authentication.services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.vault.authentication.entities.User;
import test.vault.authentication.repository.UserDao;
import test.vault.utility.utils;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public int registerUser(User user) {
		System.out.println("\n User data:" + user);
		String pwdSalt = utils.generatedSalt();
		String originalPwd = user.getPassword();
		String modifiedPassword = originalPwd + pwdSalt;

		String pwdHash = utils.generatePwdHash(modifiedPassword);

		user.setPwdSalt(pwdSalt);
		user.setPwdHash(pwdHash);

		return userDao.insertUser(user);
	}

	@Override
	public List<User> fetchAllUsers() {
		return userDao.getAllUsers();
	}

	@Override
	public boolean doesUserExists(String username, String password) {
		Map<String, Object> pwdCredentials = userDao.getPasswordCredentials(username);

		String pwdSaltFromDb = (String) pwdCredentials.get("pwd_salt");
		String pwdHashFromDb = (String) pwdCredentials.get("pwd_hash");

		System.out.println("\n pwdSaltFromDb :" + pwdSaltFromDb);
		System.out.println("\n pwdHashFromDb :" + pwdHashFromDb);

		// matching of hashes
		String modifiedPassword = password + pwdSaltFromDb;
		String newHash = utils.generatePwdHash(modifiedPassword);

		return newHash.equals(pwdHashFromDb);
	}

	@Override
	public User fetchSingleUser(String userName) {
		return userDao.fetchSingleUser(userName);
	}

	@Override
	public boolean isUsernameUnique(String username) {
		return userDao.isUsernameUnique(username);
	}

}
