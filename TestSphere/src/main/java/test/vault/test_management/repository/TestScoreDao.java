package test.vault.test_management.repository;

import test.vault.test_management.entities.Exam;

public interface TestScoreDao {
	public void insertScore(Exam exam);
	public int getNumberOfQuestion(int testId);
}
