package test.vault.reporting.entities;

public class Exam {
	private int examId;
	private int userId;
	private String Date;
	private int score;
	private int examStatus;
	private String userName;
	private String testName;
	private String level;
	private String type;

	public Exam() {
		super();
	}

	public Exam(int examId, int userId, String date, int score, int status, String userName, String testName,
			String level, String type) {
		super();
		this.examId = examId;
		this.userId = userId;
		Date = date;
		this.score = score;
		this.examStatus = status;
		this.userName = userName;
		this.testName = testName;
		this.level = level;
		this.type = type;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getStatus() {
		return examStatus;
	}

	public void setStatus(int status) {
		this.examStatus = status;
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

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Exam [examId=" + examId + ", userId=" + userId + ", Date=" + Date + ", score=" + score + ", status="
				+ examStatus + ", userName=" + userName + ", testName=" + testName + ", level=" + level + ", type="
				+ type + "]";
	}

}
