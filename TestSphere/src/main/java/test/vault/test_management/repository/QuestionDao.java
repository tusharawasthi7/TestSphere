package test.vault.test_management.repository;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import test.vault.test_management.entities.Catalog;
import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.SubjectiveQuestion;
import test.vault.test_management.entities.Test;

public interface QuestionDao {

	int insertCodingQuestion(CodingQuestion codingQuestion) throws IOException, SerialException, SQLException;

	int insertSubjectQuestion(SubjectiveQuestion subjectiveQuestion);

	int insertMcqQuestion(McqQuestion mcqQuestion);

	void insertQuestionTestIds(int count);

	void insertCodingQuestionTestIds(int count);

	void addTestDetails(Test testDetails);

	List<Catalog> getCatalogDetails();

}
