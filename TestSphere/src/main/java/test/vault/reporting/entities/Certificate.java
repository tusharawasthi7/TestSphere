
package test.vault.reporting.entities;

public class Certificate {
	String userName;
	String testName;
	int score;
	int numberOfQuestion;
	int certificateNumber;

	public Certificate(String userName, String testName, int score, int numberOfQuestion) {
		super();
		this.userName = userName;
		this.testName = testName;
		this.score = score;
		this.numberOfQuestion = numberOfQuestion;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getNumberOfQuestion() {
		return numberOfQuestion;
	}

	public void setNumberOfQuestion(int numberOfQuestion) {
		this.numberOfQuestion = numberOfQuestion;
	}

	public int getCertificateNumber() {
		return certificateNumber;
	}

	public void setCertificateNumber(int certificateNumber) {
		this.certificateNumber = certificateNumber;
	}

	@Override
	public String toString() {
		return "Certificate [userName=" + userName + ", testName=" + testName + ", score=" + score
				+ ", numberOfQuestion=" + numberOfQuestion + "]";
	}

}
