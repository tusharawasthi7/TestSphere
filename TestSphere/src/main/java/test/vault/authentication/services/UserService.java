package test.vault.authentication.services;

import java.util.List;

import test.vault.authentication.entities.User;

public interface UserService {

	int registerUser(User user);

	List<User> fetchAllUsers();

	boolean doesUserExists(String username, String Password);

	User fetchSingleUser(String userName);

	boolean isUsernameUnique(String username);
}
