package test.vault.test_management.services;

import test.vault.test_management.entities.Exam;

public interface StartTestService {

	void insertTestScore(Exam exam);

	int nuberOfQuestions(int testId);
}
