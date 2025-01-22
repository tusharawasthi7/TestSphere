package test.vault.authentication.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import test.vault.authentication.entities.Admin;
import test.vault.authentication.entities.Role;

public class AdminRowMapper implements RowMapper<Admin> {

	@Override
	public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
		// `id`, `full_name`, `mobile`, `email`, `username`, `password`

		int id = rs.getInt("id");
		String fullName = rs.getString("full_name");
		String mobile = rs.getString("mobile");
		String email = rs.getString("email");
		String username = rs.getString("username");
		String pwdSalt = rs.getString("pwd_salt");
		String pwdHash = rs.getString("pwd_hash");

//
//        // Convert Blob to Multipart file - 200000 bytes
//        byte[] imageBytes = profilePic.getBytes(1, (int) profilePic.length());
//        ByteArrayMultipartFile profileImage = new ByteArrayMultipartFile(imageBytes, "image.png", "image/png");

		boolean isAuthorized = rs.getBoolean("authorized");
		int roleId = rs.getInt("role_id");

		Role role = new Role();
		role.setRoleId(roleId);

		return new Admin(id, fullName, mobile, email, username, pwdSalt, pwdHash, isAuthorized, role);
	}
}
