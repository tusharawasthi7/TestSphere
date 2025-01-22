package test.vault.reporting.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import test.vault.reporting.entities.Exam;

public class ExamRowMapper implements RowMapper<Exam> {

	@Override
	public Exam mapRow(ResultSet rs, int rowNum) throws SQLException {
		int examID = rs.getInt("exam_id");
		int userID = rs.getInt("user_id");
		String date = rs.getString("date");
		int score = rs.getInt("score");
		int status = rs.getInt("status");
		String userName = rs.getString("name");
		String testName = rs.getString("test_Name");
		String level = rs.getString("level_name");
		String type = rs.getString("type_name");

		return new Exam(examID, userID, date, score, status, userName, testName, level, type);

	}
}
