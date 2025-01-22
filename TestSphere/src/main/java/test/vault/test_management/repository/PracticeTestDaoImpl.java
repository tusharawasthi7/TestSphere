package test.vault.test_management.repository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.Test;

@Repository
public class PracticeTestDaoImpl implements PracticeTestDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbctemplate() {
		return jdbcTemplate;
	}

	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbcTemplate = jdbctemplate;
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

	@Override
	public List<Test> findAllTestsWithQuestions() {
		String GET_SQL = "SELECT list_of_questions, level, type, test_name, type FROM test WHERE Status = ?";
		@SuppressWarnings("deprecation")
		List<Test> tests = jdbcTemplate.query(GET_SQL, new Object[] { 0 }, (rs, rowNum) -> {
			String level = rs.getString("level");
			String jsonArray = rs.getString("list_of_questions");
			String description = rs.getString("test_name");
			List<Integer> questionIds = parseJsonArray(jsonArray);
			String type = rs.getString("Type");
			return new Test(level, description, type, questionIds);
		});
		return tests;
	}

	@SuppressWarnings("deprecation")
	@Override
	public Test getTestById(int testId) {
		String GET_SQL = "SELECT list_of_questions, type ,total_time FROM test WHERE Test_id = ? ";
		return jdbcTemplate.queryForObject(GET_SQL, new Object[] { testId }, (rs, rowNum) -> {
			String jsonArray = rs.getString("list_of_questions");
			List<Integer> questionIds = parseJsonArray(jsonArray);
			Collections.sort(questionIds);
			String type = rs.getString("type");
			int time = rs.getInt("total_time");
			return new Test(questionIds, type, time);
		});

	}

	@Override
	public List<CodingQuestion> getCodingPracticeQuestion(List<Integer> questionIds) {
		List<CodingQuestion> codingQuestions = new ArrayList<>();
		for (Integer questionId : questionIds) {
			String GET_SQL = "SELECT question_id, image, options, correct_answers FROM coding_question WHERE question_id = ? ";
			@SuppressWarnings("deprecation")
			List<CodingQuestion> result = jdbcTemplate.query(GET_SQL, new Object[] { questionId }, (rs, rowNum) -> {
				int id = rs.getInt("question_id");
				byte[] image = rs.getBytes("image");
				String options = rs.getString("options");
				String correctAnswers = rs.getString("correct_answers");
				options = options.replace("[", "").replace("]", "").trim();
				correctAnswers = correctAnswers.replace("[", "").replace("]", "").trim();
				List<String> optionsList = Arrays.asList(options.split("\\s*,\\s*"));
				List<Integer> correctAnswersList = Arrays.stream(correctAnswers.split("\\s*,\\s*"))
						.map(Integer::parseInt).collect(Collectors.toList());
				return new CodingQuestion(id, image, optionsList, correctAnswersList);
			});

			if (result.isEmpty()) {
				System.out.println("No CodingQuestion found for questionId: " + questionId);
			} else {
				codingQuestions.add(result.get(0));
			}
		}
		return codingQuestions;
	}

	@Override
	public List<McqQuestion> getMcqPracticeQuestion(List<Integer> questionIds) {
		List<McqQuestion> allMcqQuestions = new ArrayList<>();
		for (Integer questionId : questionIds) {
			String GET_SQL = "SELECT question_id, question_title, options, correct_answers FROM mcqquestions WHERE question_id = ? ";
			@SuppressWarnings("deprecation")
			List<McqQuestion> result = jdbcTemplate.query(GET_SQL, new Object[] { questionId }, (rs, rowNum) -> {
				int id = rs.getInt("question_id");
				String questionTitle = rs.getString("question_title");
				String options = rs.getString("options");
				String correctAnswers = rs.getString("correct_answers");
				options = options.replace("[", "").replace("]", "").trim();
				correctAnswers = correctAnswers.replace("[", "").replace("]", "").trim();
				List<String> optionsList = Arrays.asList(options.split("\\s*,\\s*"));
				List<Integer> correctAnswersList = Arrays.stream(correctAnswers.split("\\s*,\\s*"))
						.map(Integer::parseInt).collect(Collectors.toList());
				return new McqQuestion(id, questionTitle, optionsList, correctAnswersList);
			});

			if (result.isEmpty()) {
				System.out.println("No McqQuestion found for questionId: " + questionId);
			} else {
				allMcqQuestions.add(result.get(0));
			}
		}
		return allMcqQuestions;
	}

}
