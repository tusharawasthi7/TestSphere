package test.vault.reporting.services;

import java.util.List;

import test.vault.reporting.entities.Certificate;
import test.vault.reporting.entities.Exam;

public interface ExamService {
	List<Exam> getExamsByTestId(int testId);

	List<Exam> getExamsByUserId(int userId);

	Integer getNumberOfQuestions(int examID);

	Certificate certificateForUser(int examID);
}
