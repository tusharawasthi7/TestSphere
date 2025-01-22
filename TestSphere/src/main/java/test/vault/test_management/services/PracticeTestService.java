package test.vault.test_management.services;

import java.util.List;

import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.Test;

public interface PracticeTestService {

	public List<Test> getAllTestsWithQuestions();

	public List<CodingQuestion> getAllCodingPracticeQuestion(List<Integer> questionId);

	public List<McqQuestion> getAllMcqPracticeQuestion(List<Integer> questionId);

	public Test getTestById(int testId);

}
