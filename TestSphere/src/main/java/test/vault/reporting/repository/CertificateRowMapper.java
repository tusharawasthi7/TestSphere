package test.vault.reporting.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import test.vault.reporting.entities.Certificate;

public class CertificateRowMapper implements RowMapper<Certificate> {

	@Override
	public Certificate mapRow(ResultSet rs, int rowNum) throws SQLException {
		int score = rs.getInt("score");
		int numberOfQuestions = rs.getInt("Number_of_Questions");
		String userName = rs.getString("name");
		String testName = rs.getString("test_Name");

		System.out.println(score);

		return new Certificate(userName, testName, score, numberOfQuestions);
	}
}
