package test.vault.test_management.services;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.Test;

public interface TestService {
	public List<Test> getAllTestsWithQuestions(int adminID);

	public CodingQuestion getCodingQuestion(int questionId);

	public McqQuestion getMcqQuestion(int questionId);

	int editedCodingQuestion(CodingQuestion codingquestion, int questionid)
			throws SerialException, IOException, SQLException;

	int editMcqQuestion(McqQuestion mcqQuestion, int question_Id);

	int updateStatus(String status, int testId);

	void editDetailsOfTest(Test testDetails, int testId);

	Test getTestById(int testId);

	List<Integer> getQuestionsId(int count);

	List<Integer> getCodingQuestionsId(int count);

	void updateTestForNewQuestions(int testId, List<Integer> ids);

}
