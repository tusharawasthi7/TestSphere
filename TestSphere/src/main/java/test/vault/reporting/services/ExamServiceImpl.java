package test.vault.reporting.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import test.vault.reporting.entities.Certificate;
import test.vault.reporting.entities.Exam;
import test.vault.reporting.repository.ExamDao;

@Service
public class ExamServiceImpl implements ExamService {

	@Autowired
	private ExamDao examDao;

	@Override
	public List<Exam> getExamsByTestId(int testId) {
		return examDao.getExamsByTestId(testId);
	}

	@Override
	public List<Exam> getExamsByUserId(int userID) {
		return examDao.getCompletedExamsByUserID(userID);
	}

	@Override
	public Integer getNumberOfQuestions(int examID) {

		return examDao.getNumberOfQuestions(examID);
	}

	@Override
	public Certificate certificateForUser(int examID) {
		Certificate certificate = examDao.certificateForUser(examID);
		certificate.setCertificateNumber(examID);
		return certificate;
	}
}
