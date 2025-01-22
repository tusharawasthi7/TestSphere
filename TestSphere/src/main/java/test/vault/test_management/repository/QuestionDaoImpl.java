package test.vault.test_management.repository;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.rowset.serial.SerialException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import test.vault.test_management.entities.Catalog;
import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.SubjectiveQuestion;
import test.vault.test_management.entities.Test;

@Repository
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbctemplate() {
		return jdbcTemplate;
	}

	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbcTemplate = jdbctemplate;
	}

	@Override
	public int insertCodingQuestion(CodingQuestion codingQuestion) throws IOException, SerialException, SQLException {
		int result = 0;
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String optionsJson = objectMapper.writeValueAsString(codingQuestion.getOptions());
			String correctAnswersJson = objectMapper.writeValueAsString(codingQuestion.getCorrectAnswer());

			final String INSERT_QUERY = "INSERT INTO coding_question( image, options, correct_answers) VALUES (?,?,?)";

			result = jdbcTemplate.update(INSERT_QUERY, codingQuestion.getImage(), optionsJson, correctAnswersJson);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertSubjectQuestion(SubjectiveQuestion subjectiveQuestion) {
		final String INSERT_QUERY = "INSERT INTO subjective_question(catalog_id,test_id,question_title ) VALUES(?,?,?) ";
		return jdbcTemplate.update(INSERT_QUERY, 2, 2, subjectiveQuestion.getQuestionTitle());
	}

	@Override
	public int insertMcqQuestion(McqQuestion mcqQuestion) {
		int result = 0;

		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String optionsJson = objectMapper.writeValueAsString(mcqQuestion.getOptions());
			String correctAnswersJson = objectMapper.writeValueAsString(mcqQuestion.getCorrectAnswer());
			String INSERT_QUERY = "INSERT INTO mcqquestions( question_title, options, correct_answers) VALUES ( ?, ?, ?)";
			result = jdbcTemplate.update(INSERT_QUERY, mcqQuestion.getQuestionTitle(), optionsJson, correctAnswersJson);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@SuppressWarnings("deprecation")
	public void insertQuestionTestIds(int count) {
		try {
			String fetchLastTestId = "SELECT Test_id FROM test ORDER BY Test_id DESC LIMIT 1";
			int lastInsertedId = jdbcTemplate.queryForObject(fetchLastTestId, Integer.class);
			String fetchQuery = "SELECT question_id FROM mcqquestions ORDER BY question_id DESC LIMIT ?";
			List<Integer> ids = jdbcTemplate.queryForList(fetchQuery, new Object[] { count }, Integer.class);
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonIds = objectMapper.writeValueAsString(ids);
			String insertQuery = "UPDATE test SET  list_of_questions = ? WHERE Test_id = ?";
			jdbcTemplate.update(insertQuery, jsonIds, lastInsertedId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Error storing IDs in the test table");
		}
	}

	@Override
	public void insertCodingQuestionTestIds(int count) {
		try {
			String fetchLastTestId = "SELECT Test_id FROM test ORDER BY Test_id DESC LIMIT 1";
			int lastInsertedId = jdbcTemplate.queryForObject(fetchLastTestId, Integer.class);
			String fetchQuery = "SELECT question_id FROM coding_question ORDER BY question_id DESC LIMIT ?";
			@SuppressWarnings("deprecation")
			List<Integer> ids = jdbcTemplate.queryForList(fetchQuery, new Object[] { count }, Integer.class);
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonIds = objectMapper.writeValueAsString(ids);
			String insertQuery = "UPDATE test SET  list_of_questions = ? WHERE Test_id = ?";
			jdbcTemplate.update(insertQuery, jsonIds, lastInsertedId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Error storing IDs in the test table");
		}
	}

	@Override
	public void addTestDetails(Test testDetails) {
		String INSERT_QUERY = "INSERT INTO test(Catalog_ID,Admin_ID,Start_Time,End_Time,test_name,Status,Type,level,Number_of_Questions,Date,total_time) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		java.util.Date startDate = testDetails.getStartDate();
		java.util.Date endDate = testDetails.getEndDate();
		java.util.Date creationDate = testDetails.getCreationDate();
		java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
		java.sql.Date sqlEndDate = new java.sql.Date(endDate.getTime());
		java.sql.Date sqlCreationDate = new java.sql.Date(creationDate.getTime());
		int testLevel;
		if (testDetails.getLevel().toLowerCase().equals("beginner")) {
			testLevel = 1;
		} else if (testDetails.getLevel().toLowerCase().equals("intermediate")) {
			testLevel = 2;
		} else {
			testLevel = 3;
		}

		int testType;
		System.out.println(testDetails.getType().toLowerCase());
		if (testDetails.getType().toLowerCase().equals("mcq")) {
			testType = 1;
		} else {
			testType = 2;
		}
		jdbcTemplate.update(INSERT_QUERY, testDetails.getCatalogId(), testDetails.getAdminId(), sqlStartDate,
				sqlEndDate, testDetails.getDescription(), 1, testType, testLevel, testDetails.getNoOfQuestion(),
				sqlCreationDate, testDetails.getTotalTime());

	}

	@Override
	public List<Catalog> getCatalogDetails() {
		String GET_QUERY = "SELECT catalog_id, catalog_name,is_mcq,is_coding FROM exam_catalog";
		List<Catalog> catalogs = new ArrayList<>();
		jdbcTemplate.query(GET_QUERY, new RowMapper<Void>() {
			@Override
			public Void mapRow(ResultSet rs, int rowNum) throws SQLException {
				// Create a new Catalog object for each row
				Catalog catalog = new Catalog();
				catalog.setCataLogId(rs.getInt("catalog_id"));
				catalog.setCatalogNames(rs.getString("catalog_name"));
				catalog.setMcq(rs.getBoolean("is_mcq"));
				catalog.setCoding(rs.getBoolean("is_coding"));
				catalogs.add(catalog);
				return null;
			}
		});
		return catalogs;
	}
}
