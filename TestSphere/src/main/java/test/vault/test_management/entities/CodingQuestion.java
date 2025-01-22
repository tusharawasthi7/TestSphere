package test.vault.test_management.entities;

import java.util.Arrays;
import java.util.List;

public class CodingQuestion {

	private int id;

	private byte[] image;
	private List<String> options;
	private List<Integer> correctAnswer;

	public CodingQuestion() {
	}

	public CodingQuestion(int id, byte[] image, List<String> options, List<Integer> correctAnswer) {
		super();
		this.id = id;
		this.image = image;
		this.options = options;
		this.correctAnswer = correctAnswer;
	}

	public CodingQuestion(byte[] imageblob, List<String> options, List<Integer> correctAnswer) {
		super();
		this.image = imageblob;
		this.options = options;
		this.correctAnswer = correctAnswer;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
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

	public void setCorrectAnswer(List<Integer> correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "CodingQuestion [id=" + id + ", image=" + Arrays.toString(image) + ", options=" + options
				+ ", correctAnswer=" + correctAnswer + "]";
	}

}
