package test.vault.test_management.entities;

import java.util.Date;

public class Exam {

	private int examId;
	private int testId;
	private Date date;
	private int score;
	private int status;
	private int userID;

	public Exam(int testId, Date date, int score, int status, int userID) {
		super();
		this.testId = testId;
		this.date = date;
		this.score = score;
		this.status = status;
		this.userID = userID;
	}

	public Exam(int examId, int testId, Date date, int score, int status, int userID) {
		super();
		this.examId = examId;
		this.testId = testId;
		this.date = date;
		this.score = score;
		this.status = status;
		this.userID = userID;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public int getTestId() {
		return testId;
	}

	public void setTestId(int testId) {
		this.testId = testId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int isStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	@Override
	public String toString() {
		return "Exam [examId=" + examId + ", testId=" + testId + ", date=" + date + ", score=" + score + ", status="
				+ status + ", userID=" + userID + "]";
	}

}
