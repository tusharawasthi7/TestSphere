package test.vault.authentication.repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import test.vault.authentication.entities.Admin;
import test.vault.authentication.entities.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int insertUser(User user) {

		final String INSERT_QUERY = "INSERT INTO user (Name, pwd_salt, pwd_hash,Email_id,Phone_No) VALUES (?,?,?,?,?)";

		return jdbcTemplate.update(INSERT_QUERY, user.getName(), user.getPwdSalt(), user.getPwdHash(),
				user.getEmailId(), user.getPhoneNo());
	}

	@Override
	public List<User> getAllUsers() {
		final String GET_ALL_USERS = "SELECT * FROM user";
		return jdbcTemplate.query(GET_ALL_USERS, new UserRowMapper());
	}

	@Override
	public Map<String, Object> getPasswordCredentials(String Name) {
		final String GET_PWD_CREDENTIALS = "SELECT pwd_salt,pwd_hash FROM user WHERE Name = ?";

		return jdbcTemplate.queryForMap(GET_PWD_CREDENTIALS, Name);
	}

	@Override
	public User fetchSingleUser(String userName) {
		User user = null;
		final String GET_USER = "SELECT * FROM USER WHERE name = ?";

		try {
			user = jdbcTemplate.queryForObject(GET_USER, new UserRowMapper(), userName);
		} catch (DataAccessException dataAccessException) {
			dataAccessException.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean isUsernameUnique(String username) {
		String GET_QUERY = "SELECT COUNT(*) FROM user WHERE Name = ?";
		@SuppressWarnings("deprecation")
		Integer count = jdbcTemplate.queryForObject(GET_QUERY, new Object[] { username }, Integer.class);
		return count == 0; // Returns true if username is unique, false otherwise
	}

}
