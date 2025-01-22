package test.vault.authentication.services;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.vault.authentication.entities.Admin;
import test.vault.authentication.repository.AdminDao;
import test.vault.utility.utils;

@Service
public class AuthenticationAdminServiceImpl implements AuthenticationAdminService {

	@Autowired
	AdminDao adminDao;

	@Override
	public int registerAdmin(Admin admin) throws SerialException, IOException, SQLException {

		System.out.println("\n Admin Data : " + admin);

		// Generate random salt of 10 characters
		String pwdSalt = utils.generatedSalt();
		String originalPwd = admin.getPassword();

		// Concatenating salt with original pwd
		String modifiedPassword = pwdSalt + originalPwd;

		// Generating hash of modified password
		String pwdHash = utils.generatePwdHash(modifiedPassword);

		// setting the newly generated salt and hash in customer object
		admin.setPwdSalt(pwdSalt);
		admin.setPwdHash(pwdHash);

		// authority

		int role = admin.getRole().getRoleId();

		// If the user is a customer, he/she is authorised for tasks
		if (role == 3) {
			admin.setAuthorized(true);
		}

		// If the user is a subadmin they have to br authorized for their tasks
		else if (role == 2) {
			admin.setAuthorized(false);
		}

		return adminDao.insertAdmin(admin);
	}

	@Override
	public List<Admin> fetchAllAdmins() {
		return adminDao.getAllAdmins();
	}

	@Override
	public List<Admin> fetchAllAdmin(int roleId) {
		return adminDao.getAllAdmin(roleId);
	}

	@Override
	public void modifyAuthority(int adminId) {
		adminDao.changeAuthority(adminId);

	}

	@Override
	public boolean matchPassword(String passwordFromUi, Admin admin) {
		String pwdSaltFromDb = admin.getPwdSalt();
		String pwdHashFromDb = admin.getPwdHash();

		String modifiedPassword = pwdSaltFromDb + passwordFromUi;
		String newHash = utils.generatePwdHash(modifiedPassword);

		System.out.println(newHash);
		System.out.println(pwdHashFromDb);
		return newHash.equals(pwdHashFromDb);
	}

	@Override
	public Optional<Admin> fetchAdminDetails(String username) {
		return adminDao.getAdminData(username);
	}

	@Override
	public boolean isUsernameUnique(String username) {
		return adminDao.isUsernameUnique(username);
	}
}
