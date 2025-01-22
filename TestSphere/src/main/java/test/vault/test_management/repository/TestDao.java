package test.vault.test_management.repository;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.Test;

public interface TestDao {

	public List<Test> findAllTestsWithQuestions(int adminID);

	public CodingQuestion getCodingQuestion(int questionId);

	public McqQuestion getMcqQuestion(int questionId);

	int insertEditedCodingQuestion(CodingQuestion codingQuestion, int questionid)
			throws IOException, SerialException, SQLException;

	int editMcqQuestion(McqQuestion mcqQuestion, int question_Id);

	int updateStatus(String status, int testId);

	void editDetailsOfTest(Test testDetails, int testId);

	Test getTestById(int testId);

	List<Integer> getQuestionIds(int count);

	List<Integer> getCodingQuestionIds(int count);

	void updateTestForNewQuestions(int testId, List<Integer> ids);
}
