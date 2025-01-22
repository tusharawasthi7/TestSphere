package test.vault.test_management.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.Test;
import test.vault.test_management.repository.TestDaoImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDaoImpl testRepository;

	public List<Test> getAllTestsWithQuestions(int adminID) {
		return testRepository.findAllTestsWithQuestions(adminID);
	}

	@Override
	public CodingQuestion getCodingQuestion(int questionId) {

		return testRepository.getCodingQuestion(questionId);
	}

	@Override
	public McqQuestion getMcqQuestion(int questionId) {
		return testRepository.getMcqQuestion(questionId);
	}

	@Override
	public int editedCodingQuestion(CodingQuestion codingquestion, int questionid)
			throws SerialException, IOException, SQLException {

		return testRepository.insertEditedCodingQuestion(codingquestion, questionid);
	}

	@Override
	public int editMcqQuestion(McqQuestion mcqQuestion, int question_Id) {
		return testRepository.editMcqQuestion(mcqQuestion, question_Id);
	}

	@Override
	public int updateStatus(String status, int testId) {
		return testRepository.updateStatus(status, testId);
	}

	@Override
	public void editDetailsOfTest(Test testDetails, int testId) {
		testRepository.editDetailsOfTest(testDetails, testId);

	}

	@Override
	public Test getTestById(int testId) {
		return testRepository.getTestById(testId);
	}

	@Override
	public List<Integer> getQuestionsId(int count) {
		return testRepository.getQuestionIds(count);
	}

	@Override
	public void updateTestForNewQuestions(int testId, List<Integer> ids) {
		testRepository.updateTestForNewQuestions(testId, ids);

	}

	@Override
	public List<Integer> getCodingQuestionsId(int count) {
		return testRepository.getCodingQuestionIds(count);
	}

}