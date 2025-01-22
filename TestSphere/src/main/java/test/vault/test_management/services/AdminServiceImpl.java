package test.vault.test_management.services;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.vault.test_management.entities.Catalog;
import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.SubjectiveQuestion;
import test.vault.test_management.entities.Test;
import test.vault.test_management.repository.QuestionDao;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	QuestionDao questionDao;

	@Override
	public int insertCodingQuestion(CodingQuestion codingquestion) throws SerialException, IOException, SQLException {
		return questionDao.insertCodingQuestion(codingquestion);
	}

	@Override
	public int insertSubjectQuestion(SubjectiveQuestion subjectiveQuestion) {
		return questionDao.insertSubjectQuestion(subjectiveQuestion);
	}

	@Override
	public int insertMcqQuestion(McqQuestion mcqQuestion) {
		return questionDao.insertMcqQuestion(mcqQuestion);
	}

	@Override
	public void insertAllIdsIntoTest(int count) {

		questionDao.insertQuestionTestIds(count);
	}

	@Override
	public void insertCodingQuestionsAllIdsIntoTest(int count) {
		questionDao.insertCodingQuestionTestIds(count);

	}

	@Override
	public void insertDetailsOfTest(Test testDetails) {
		questionDao.addTestDetails(testDetails);

	}

	@Override
	public List<Catalog> getCatalogDetails() {
		return questionDao.getCatalogDetails();
	}

}
