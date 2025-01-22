package test.vault.test_management.repository;

import java.util.List;

import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.Test;

public interface PracticeTestDao {

	public List<Test> findAllTestsWithQuestions();

	public List<CodingQuestion> getCodingPracticeQuestion(List<Integer> questionId);

	public List<McqQuestion> getMcqPracticeQuestion(List<Integer> questionId);

	public Test getTestById(int testId);

}
