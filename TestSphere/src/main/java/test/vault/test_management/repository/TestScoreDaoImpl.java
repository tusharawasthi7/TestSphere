package test.vault.test_management.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import test.vault.test_management.entities.Exam;

@Repository
public class TestScoreDaoImpl implements TestScoreDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbctemplate() {
		return jdbcTemplate;
	}

	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbcTemplate = jdbctemplate;
	}

	@Override
	public void insertScore(Exam exam) {
		String INSERT_QUERY = "INSERT INTO exams(Test_id,Date,Score,Status,user_id) VALUES(?,?,?,?,?)";
		java.util.Date startDate = exam.getDate();
		java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
		jdbcTemplate.update(INSERT_QUERY, exam.getTestId(), sqlStartDate, exam.getScore(), exam.isStatus(),
				exam.getUserID());

	}

	@Override
	public int getNumberOfQuestion(int testId) {
		String GET_QUERY = "SELECT Number_of_Questions FROM test WHERE Test_id=?";
		return jdbcTemplate.queryForObject(GET_QUERY,new Object[]{testId},Integer.class);
		
	}

}
