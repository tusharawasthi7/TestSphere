package test.vault.reporting.repository;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import test.vault.reporting.entities.Certificate;
import test.vault.reporting.entities.Exam;

@Repository
public class ExamDaoImpl implements ExamDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Exam> getExamsByTestId(int testId) {
		final String SELECT_QUERY = "SELECT e.exam_ID,e.user_ID,e.date,e.score,e.status,u.Name,t.test_name,l.level_name,ty.type_name from exams e\r\n"
				+ "																		join test t on e.Test_id=t.Test_id\r\n"
				+ "                                                                        join level l on l.level_id= t.level\r\n"
				+ "                                                                        join type ty on ty.type_id=t.type\r\n"
				+ "                                                                        JOIN user u on u.user_id=e.user_id\r\n"
				+ "                                                                        where t.test_id=?;";
		return jdbcTemplate.query(SELECT_QUERY, new Object[] { testId }, new ExamRowMapper());
	}

	@Override
	public List<Exam> getCompletedExamsByUserID(int userId) {

		final String GET_COMPLETED_EXAMS_QUERY = "SELECT e.exam_ID,e.user_ID,e.date,e.score,e.status,u.Name,t.test_name,l.level_name,ty.type_name from exams e\r\n"
				+ "																		join test t on e.Test_id=t.Test_id\r\n"
				+ "                                                                        join level l on l.level_id= t.level\r\n"
				+ "                                                                        join type ty on ty.type_id=t.type\r\n"
				+ "                                                                        JOIN user u on u.user_id=e.user_id\r\n"
				+ "                                                                        where e.user_id=?;";
		return jdbcTemplate.query(GET_COMPLETED_EXAMS_QUERY, new Object[] { userId }, new ExamRowMapper());

	}

	@Override
	public Integer getNumberOfQuestions(int examID) {
		String GET_NUMBER_OFQUESTION = "\r\n" + "SELECT t.number_of_questions\r\n" + "FROM exams e\r\n"
				+ "JOIN test t ON e.test_id = t.test_id\r\n" + "WHERE e.exam_id = ?;";
		return jdbcTemplate.queryForObject(GET_NUMBER_OFQUESTION, new Object[] { examID }, Integer.class);
	}

	@Override
	public Certificate certificateForUser(int examID) {
		final String GET_Certificate_QUERY = "SELECT e.Score,u.Name,t.test_name,t.Number_of_questions from exams e\r\n"
				+ "																		join test t on e.Test_id=t.Test_id\r\n"
				+ "                                                                        JOIN user u on u.user_id=e.user_id\r\n"
				+ "                                                                        where e.exam_id=?;";
		return jdbcTemplate.queryForObject(GET_Certificate_QUERY, new Object[] { examID }, new CertificateRowMapper());
	}
}
