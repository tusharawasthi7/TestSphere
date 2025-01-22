package test.vault.reporting.repository;

import java.util.List;

import test.vault.reporting.entities.Certificate;
import test.vault.reporting.entities.Exam;

public interface ExamDao {
	List<Exam> getExamsByTestId(int testId);

	List<Exam> getCompletedExamsByUserID(int userId);

	Integer getNumberOfQuestions(int examID);

	Certificate certificateForUser(int examID);
}
