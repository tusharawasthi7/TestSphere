package test.vault.test_management.entities;

import java.util.List;

public class McqQuestion {

	private int id;
	private String questionTitle;
	private List<String> options;
	private List<Integer> correctAnswer;

	public McqQuestion() {
		super();
	}

	public McqQuestion(int id, String questionTitle, List<String> options, List<Integer> correctAnswer) {
		super();
		this.id = id;
		this.questionTitle = questionTitle;
		this.options = options;
		this.correctAnswer = correctAnswer;
	}

	public McqQuestion(String questionTitle, List<String> options, List<Integer> correct_options) {
		super();
		this.questionTitle = questionTitle;
		this.options = options;
		this.correctAnswer = correct_options;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public List<String> getOptions() {
		return options;
	}

	public void setOptions(List<String> options) {
		this.options = options;
	}

	public List<Integer> getCorrectAnswer() {
		return correctAnswer;
	}

	@Override
	public String toString() {
		return "McqQuestion [questionTitle=" + questionTitle + ", options=" + options + ", correctAnswer="
				+ correctAnswer + "]";
	}

	public void setCorrectAnswer(List<Integer> correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public int getId() {
		return id;
	}

}
