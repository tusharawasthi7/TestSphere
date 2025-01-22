package test.vault.test_management.services;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import test.vault.test_management.entities.Catalog;
import test.vault.test_management.entities.CodingQuestion;
import test.vault.test_management.entities.McqQuestion;
import test.vault.test_management.entities.SubjectiveQuestion;
import test.vault.test_management.entities.Test;

public interface AdminService {

	int insertCodingQuestion(CodingQuestion codingquestion) throws SerialException, IOException, SQLException;

	int insertSubjectQuestion(SubjectiveQuestion subjectiveQuestion);

	int insertMcqQuestion(McqQuestion mcqQuestion);

	void insertAllIdsIntoTest(int count);

	void insertCodingQuestionsAllIdsIntoTest(int count);

	void insertDetailsOfTest(Test testDetails);

	List<Catalog> getCatalogDetails();

}
