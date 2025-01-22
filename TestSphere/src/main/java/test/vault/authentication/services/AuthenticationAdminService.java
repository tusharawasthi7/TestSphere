package test.vault.authentication.services;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import javax.sql.rowset.serial.SerialException;

import test.vault.authentication.entities.Admin;

public interface AuthenticationAdminService {

	int registerAdmin(Admin admin) throws SerialException, IOException, SQLException;

	List<Admin> fetchAllAdmins();

	List<Admin> fetchAllAdmin(int roleId);

	Optional<Admin> fetchAdminDetails(String username);

	void modifyAuthority(int adminId);

	boolean matchPassword(String passwordFromUi, Admin admin);

	boolean isUsernameUnique(String username);
}
