package test.vault.admintest.entities;

public class Exam {
	private int testId;
	private String testDate;
	private int status;

	public int getTestId() {
		return testId;
	}

	public void setTestId(int testId) {
		this.testId = testId;
	}

	public String getTestDate() {
		return testDate;
	}

	public void setTestDate(String testDate) {
		this.testDate = testDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TestHistory [testId=" + testId + ", testDate=" + testDate + ", status=" + status + "]";
	}
}
