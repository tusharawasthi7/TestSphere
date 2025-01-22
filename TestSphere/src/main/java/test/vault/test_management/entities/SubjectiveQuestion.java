package test.vault.test_management.entities;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

public class SubjectiveQuestion {

	private int id;

	private String QuestionTitle;

	public SubjectiveQuestion(String questionTitle) {
		super();
		QuestionTitle = questionTitle;
	}

	public int getId() {
		return id;
	}

	public String getQuestionTitle() {
		return QuestionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		QuestionTitle = questionTitle;
	}

}
