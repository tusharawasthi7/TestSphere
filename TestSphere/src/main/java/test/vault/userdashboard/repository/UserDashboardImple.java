package test.vault.userdashboard.repository;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import test.vault.dashboard.entities.Test;

@Repository
public class UserDashboardImple implements UserDashboardDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<Test> getAllRunningTest(int userID) {
		String GET_ALL_RUNNING_TESTS = "\r\n"
				+ "SELECT c.Catalog_Name, t.Test_id,t.Number_of_Questions,t.Start_Time,t.End_Time,t.Admin_ID,t.list_of_questions,t.test_name,t.status,t.date,l.level_name,ty.type_name\r\n"
				+ "        									 				FROM \r\n"
				+ "        													    Test t\r\n"
				+ "        						                                     JOIN \r\n"
				+ "        						                                     level l ON t.level = l.level_id\r\n"
				+ "        						                                    JOIN \r\n"
				+ "        						                                      type ty ON t.type = ty.type_id\r\n"
				+ "        						                                    \r\n"
				+ "		   				   				        JOIN \r\n"
				+ "		   				   					    exam_Catalog c ON t.Catalog_ID = c.Catalog_id \r\n"
				+ "		   		JOIN user u ON NOT JSON_CONTAINS(u.registered_test, CAST(t.test_id AS JSON), '$')\r\n"
				+ "		   		WHERE u.user_id = ? && t.status=1 order by t.test_id desc;";
		return jdbcTemplate.query(GET_ALL_RUNNING_TESTS, new UserDashboardRowMapper(), userID);

	}

	@Override
	public List<Test> getAllCloseTest() {
		String GET_ALL_CLOSED_TESTS = "\r\n"
				+ "SELECT c.Catalog_Name, t.Test_id,t.Number_of_Questions,t.Start_Time,t.End_Time,t.Admin_ID,t.list_of_questions,t.test_name,t.status,t.date,l.level_name,ty.type_name\r\n"
				+ "        									 				FROM \r\n"
				+ "        													    Test t\r\n"
				+ "        						                                     JOIN \r\n"
				+ "        						                                     level l ON t.level = l.level_id\r\n"
				+ "        						                                    JOIN \r\n"
				+ "        						                                      type ty ON t.type = ty.type_id\r\n"
				+ "        						                                    \r\n"
				+ "		   				   				        JOIN \r\n"
				+ "		   				   					    exam_Catalog c ON t.Catalog_ID = c.Catalog_id WHERE t.status=0 order by t.test_id desc;\r\n";
		return jdbcTemplate.query(GET_ALL_CLOSED_TESTS, new UserDashboardRowMapper());
	}

	@Override
	public List<Test> getAllUpcomingTestForUser(int userID) {
		String GET_ALL_UPCOMING_TEST = "SELECT c.Catalog_Name, t.Test_id,t.Number_of_Questions,t.Start_Time,t.End_Time,t.Admin_ID,t.list_of_questions,t.test_name,t.status,t.date,l.level_name,ty.type_name\r\n"
				+ "        									 				FROM Test t JOIN level l ON t.level = l.level_id\r\n"
				+ "        						                                    JOIN type ty ON t.type = ty.type_id\r\n"
				+ "																	JOIN exam_Catalog c ON t.Catalog_ID = c.Catalog_id \r\n"
				+ "																	JOIN user u ON JSON_CONTAINS(u.registered_test, CAST(t.test_id AS JSON), '$')\r\n"
				+ "																	WHERE u.user_id = ? order by t.start_time asc";

		return jdbcTemplate.query(GET_ALL_UPCOMING_TEST, new UserDashboardRowMapper(), userID);

	}

	@Override
	public HashSet<Integer> getAllGivenTestByUser(int userID) {
		String queryToFetchTestID = "SELECT test_id FROM exams WHERE user_id=?";
		List<Integer> listOFTestID = jdbcTemplate.query(queryToFetchTestID, new AlreadyGivenTestRowMapper(), userID);
		HashSet<Integer> testID = new HashSet<Integer>(listOFTestID);
		return testID;

	}

}
