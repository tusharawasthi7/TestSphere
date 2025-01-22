package test.vault.dashboard.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import test.vault.dashboard.entities.Test;

public class TestRowMapper implements RowMapper<Test> {

	@Override
	public Test mapRow(ResultSet rs, int rowNum) throws SQLException {

		String catalogName = rs.getString("Catalog_Name");
		int testId = rs.getInt("Test_id");
		int noOfQuestions = rs.getInt("Number_of_Questions");
		String startTime = rs.getString("Start_Time");
		String endTime = rs.getString("End_Time");
		int adminID = rs.getInt("admin_ID");
		String name = rs.getString("test_Name");
		int status = rs.getInt("status");
		String date = rs.getString("Date");
		String list_of_questions = rs.getString("list_of_questions");
		String level = rs.getString("level_name");
		String type = rs.getString("type_name");

		return new Test(catalogName, testId, noOfQuestions, startTime, endTime, adminID, name, status, date,
				list_of_questions, level, type);

	}

}
