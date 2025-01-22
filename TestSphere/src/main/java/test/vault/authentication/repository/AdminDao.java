package test.vault.authentication.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import test.vault.authentication.entities.Admin;
import test.vault.authentication.entities.Role;

public interface AdminDao {
	int insertAdmin(Admin admin);

	List<Admin> getAllAdmins();

	List<Admin> getAllAdmin(int roleId);

	// Map<String, Object> getPasswordCredentials(String name);
	Optional<Admin> getAdminData(String username);

	List<Role> getAllRoles();

	void changeAuthority(int adminId);

	boolean isUsernameUnique(String username);

}
