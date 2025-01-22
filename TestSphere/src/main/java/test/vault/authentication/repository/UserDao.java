package test.vault.authentication.repository;

import java.util.List;
import java.util.Map;

import test.vault.authentication.entities.User;

public interface UserDao {

	int insertUser(User user);

	List<User> getAllUsers();

	Map<String, Object> getPasswordCredentials(String name);

	User fetchSingleUser(String userName);

	public boolean isUsernameUnique(String username);
}
