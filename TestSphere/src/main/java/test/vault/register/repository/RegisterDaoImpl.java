package test.vault.register.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import jakarta.servlet.http.HttpServletRequest;

@Repository
public class RegisterDaoImpl implements RegisterDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void registerUserForTest(int testID, int userID) {

		String Register_FOR_TEST_IF_NOT_REGISTERED = "update user set registered_test=Json_Array_append(if(registered_test is null, Json_array(),registered_test),'$',?)\r\n"
				+ "where user_id=?;";
		jdbcTemplate.update(Register_FOR_TEST_IF_NOT_REGISTERED, testID, userID);

	}

}
