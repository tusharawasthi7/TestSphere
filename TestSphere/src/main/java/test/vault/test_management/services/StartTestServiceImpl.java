package test.vault.test_management.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.vault.test_management.entities.Exam;
import test.vault.test_management.repository.TestScoreDao;

@Service
public class StartTestServiceImpl implements StartTestService {

	@Autowired
	TestScoreDao testScoreDao;

	@Override
	public void insertTestScore(Exam exam) {

		testScoreDao.insertScore(exam);
	}

	@Override
	public int nuberOfQuestions(int testId) {
		
		return testScoreDao.getNumberOfQuestion(testId) ;
	}

}
