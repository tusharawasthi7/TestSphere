package test.vault.test_management.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.Test;
import test.vault.test_management.repository.PracticeTestDaoImpl;
import test.vault.test_management.repository.TestDaoImpl;

@Service
public class PracticeTestServiceImpl implements PracticeTestService {

	@Autowired
	private PracticeTestDaoImpl practiceTestRepository;

	@Override
	public List<CodingQuestion> getAllCodingPracticeQuestion(List<Integer> questionId) {
		return practiceTestRepository.getCodingPracticeQuestion(questionId);
	}

	@Override
	public List<McqQuestion> getAllMcqPracticeQuestion(List<Integer> questionId) {
		return practiceTestRepository.getMcqPracticeQuestion(questionId);
	}

	@Override
	public List<Test> getAllTestsWithQuestions() {
		return practiceTestRepository.findAllTestsWithQuestions();
	}

	@Override
	public Test getTestById(int testId) {
		return practiceTestRepository.getTestById(testId);
	}

}
