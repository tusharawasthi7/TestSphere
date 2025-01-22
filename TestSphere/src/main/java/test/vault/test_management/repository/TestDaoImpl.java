package test.vault.test_management.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.Test;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.sql.rowset.serial.SerialException;

@Repository
public class TestDaoImpl implements TestDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings("deprecation")
	@Override
	public List<Test> findAllTestsWithQuestions(int adminID) {
		String GET_SQL = "SELECT Catalog_ID,Test_id, list_of_questions,Status,type,test_name,Number_of_Questions FROM test WHERE Admin_ID=?";

		return jdbcTemplate.query(GET_SQL, new Object[] { adminID }, (rs, rowNum) -> {
			Test test = new Test();
			test.setName(rs.getString("test_name"));
			test.setNoOfQuestion(rs.getInt("Number_of_Questions"));
			test.setCatalogId(rs.getInt("Catalog_ID"));
			test.setTestId(rs.getInt("test_id"));
			test.setStatus(rs.getString("Status"));
			String jsonArray = rs.getString("list_of_questions");
			String type = rs.getString("type");
			test.setType(type);
			List<Integer> questionIds = parseJsonArray(jsonArray);
			Collections.sort(questionIds);
			test.setListOfIdsOfQuestion(questionIds);
			return test;
		});
	}

	private List<Integer> parseJsonArray(String jsonArray) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			return objectMapper.readValue(jsonArray, new TypeReference<List<Integer>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
			return List.of();
		}
	}

	@SuppressWarnings("deprecation")
	@Override
	public CodingQuestion getCodingQuestion(int questionId) {
		String GET_SQL = "SELECT image, options, correct_answers FROM coding_question WHERE question_id = ?";
		return jdbcTemplate.queryForObject(GET_SQL, new Object[] { questionId }, (rs, rowNum) -> {
			byte[] image = rs.getBytes("image");
			String options = rs.getString("options");
			String correctAnswers = rs.getString("correct_answers");
			options = options.replace("[", "").replace("]", "").trim();
			correctAnswers = correctAnswers.replace("[", "").replace("]", "").trim();
			List<String> optionsList = Arrays.asList(options.split("\\s*,\\s*"));
			List<Integer> correctAnswersList = Arrays.stream(correctAnswers.split("\\s*,\\s*")).map(Integer::parseInt)
					.collect(Collectors.toList());
			return new CodingQuestion(image, optionsList, correctAnswersList);
		});
	}

	@SuppressWarnings("deprecation")
	@Override
	public McqQuestion getMcqQuestion(int questionId) {
		String GET_SQL = "SELECT question_title, options, correct_answers FROM mcqquestions WHERE question_id = ?";
		return jdbcTemplate.queryForObject(GET_SQL, new Object[] { questionId }, (rs, rowNum) -> {
			String questionTitle = rs.getString("question_title");
			String options = rs.getString("options");
			String correctAnswers = rs.getString("correct_answers");
			options = options.replace("[", "").replace("]", "").trim();
			correctAnswers = correctAnswers.replace("[", "").replace("]", "").trim();
			List<String> optionsList = Arrays.asList(options.split("\\s*,\\s*"));
			List<Integer> correctAnswersList = Arrays.stream(correctAnswers.split("\\s*,\\s*")).map(Integer::parseInt)
					.collect(Collectors.toList());
			return new McqQuestion(questionTitle, optionsList, correctAnswersList);
		});
	}

	@Override
	public int insertEditedCodingQuestion(CodingQuestion codingQuestion, int questionid)
			throws IOException, SerialException, SQLException {
		int result = 0;
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String optionsJson = objectMapper.writeValueAsString(codingQuestion.getOptions());
			String correctAnswersJson = objectMapper.writeValueAsString(codingQuestion.getCorrectAnswer());
			final String INSERT_QUERY = "UPDATE coding_question SET  image=? ,options=? ,correct_answers=? WHERE question_id=?";
			result = jdbcTemplate.update(INSERT_QUERY, codingQuestion.getImage(), optionsJson, correctAnswersJson,
					questionid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int editMcqQuestion(McqQuestion mcqQuestion, int question_Id) {
		int result = 0;

		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String optionsJson = objectMapper.writeValueAsString(mcqQuestion.getOptions());
			String correctAnswersJson = objectMapper.writeValueAsString(mcqQuestion.getCorrectAnswer());
			String UPDATE_QUERY = "UPDATE mcqquestions SET  question_title=?, options=?, correct_answers=? WHERE question_id=?";
			result = jdbcTemplate.update(UPDATE_QUERY, mcqQuestion.getQuestionTitle(), optionsJson, correctAnswersJson,
					question_Id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int updateStatus(String status, int testId) {
		String newStatus = "Closed".equals(status) ? "0" : "1";
		String updateQuery = "UPDATE test SET Status= ? WHERE Test_id = ?";
		int updated = jdbcTemplate.update(updateQuery, newStatus, testId);
		return updated > 0 ? 1 : 0;
	}

	@Override
	public void editDetailsOfTest(Test testDetails, int testId) {
		String UPDATE_TEST = "Update test SET Start_Time=?,End_Time=?,test_name=?,level=?,total_time=?,Date=? WHERE Test_id=?";
		java.util.Date editDate = testDetails.getCreationDate();
		java.sql.Date sqlEditDate = new java.sql.Date(editDate.getTime());
		int testLevel;
		if (testDetails.getLevel().toLowerCase().equals("beginner")) {
			testLevel = 1;
		} else if (testDetails.getLevel().toLowerCase().equals("intermediate")) {
			testLevel = 2;
		} else {
			testLevel = 3;
		}
		jdbcTemplate.update(UPDATE_TEST, testDetails.getStartDate(), testDetails.getEndDate(),
				testDetails.getDescription(), testLevel, testDetails.getTotalTime(), sqlEditDate, testId);

	}

	@SuppressWarnings("deprecation")
	@Override
	public Test getTestById(int testId) {
		String GET_QUERY = "SELECT type, list_of_questions FROM test WHERE Test_id = ?";
		return jdbcTemplate.queryForObject(GET_QUERY, new Object[] { testId }, (rs, rowNum) -> {
			String type = rs.getString("type");
			String list_of_questions = rs.getString("list_of_questions").replaceAll("[\\[\\] \"]", "");
			// Remove square brackets and quotes
			List<Integer> list_of_questionsAll = Arrays.stream(list_of_questions.split("\\s*,\\s*"))
					.map(Integer::parseInt).collect(Collectors.toList());
			// Create and return Test object
			Test test = new Test();
			test.setType(type);
			test.setListOfIdsOfQuestion(list_of_questionsAll);
			return test;
		});
	}

	@Override
	public List<Integer> getQuestionIds(int count) {
		String GET_QUERY = "SELECT question_id FROM mcqquestions ORDER BY question_id DESC LIMIT ?";
		List<Integer> ids = jdbcTemplate.queryForList(GET_QUERY, new Object[] { count }, Integer.class);
		return ids;
	}

	@Override
	public void updateTestForNewQuestions(int testId, List<Integer> ids) {
		String UPDATE_QUERY = "UPDATE test SET list_of_questions=?,Number_of_questions=? WHERE Test_id=?";

		String jsonIds = "";
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			jsonIds = objectMapper.writeValueAsString(ids);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		jdbcTemplate.update(UPDATE_QUERY, jsonIds, ids.size(), testId);

	}

	@Override
	public List<Integer> getCodingQuestionIds(int count) {
		String GET_QUERY = "SELECT question_id FROM coding_question ORDER BY question_id DESC LIMIT ?";
		@SuppressWarnings("deprecation")
		List<Integer> ids = jdbcTemplate.queryForList(GET_QUERY, new Object[] { count }, Integer.class);
		return ids;
	}

}
