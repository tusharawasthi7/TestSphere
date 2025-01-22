package test.vault.authentication.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import test.vault.authentication.entities.User;

public class UserRowMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		int id = rs.getInt("user_id");
		String name = rs.getString("name");
		String password = rs.getString("password");
		String emailId = rs.getString("email_id");
		String phoneNo = rs.getString("phone_no");

		return new User(id, name, password, emailId, phoneNo);
	}
}
