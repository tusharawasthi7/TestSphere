package test.vault.test_management.entities;

import java.util.Date;
import java.util.List;

public class Test {

	private int catalogId;
	private int testId;
	private List<Integer> listOfIdsOfQuestion;
	private String description;
	private String type;
	private Date startDate;
	private Date endDate;
	private String level;
	private int adminId;
	private String Status;
	private Date creationDate;
	private int noOfQuestion;
	private String name;
	private int totalTime;

	public Test() {
	}

	public Test(int catalogId, int testId, List<Integer> listOfIdsOfQuestion, String type, int adminId, String status,
			int noOfQuestion, String name) {
		super();
		this.catalogId = catalogId;
		this.testId = testId;
		this.listOfIdsOfQuestion = listOfIdsOfQuestion;
		this.type = type;
		this.adminId = adminId;
		Status = status;
		this.noOfQuestion = noOfQuestion;
		this.name = name;
	}

	public Test(List<Integer> listOfIdsOfQuestion, String type, int totalTime) {
		super();
		this.totalTime = totalTime;
		this.listOfIdsOfQuestion = listOfIdsOfQuestion;
		this.type = type;
	}

	public Test(String description, Date startDate, Date endDate, String level, String type, Date creationDate,
			int time) {
		super();
		this.totalTime = time;
		this.description = description;
		this.startDate = startDate;
		this.endDate = endDate;
		this.level = level;
		this.type = type;
		this.creationDate = creationDate;
	}

	public Test(int catalogId, String description, Date startDate, Date endDate, String level, int adminId, String type,
			Date creationDate, int noOfQuestion, int time) {
		super();
		this.totalTime = time;
		this.catalogId = catalogId;
		this.description = description;
		this.startDate = startDate;
		this.endDate = endDate;
		this.level = level;
		this.type = type;
		this.adminId = adminId;
		this.creationDate = creationDate;
		this.noOfQuestion = noOfQuestion;
	}

	public Test(int catalogId, int testId, List<Integer> listOfIdsOfQuestion, String description, String type,
			Date startDate, Date endDate, String level, int adminId, String status) {
		super();
		this.catalogId = catalogId;
		this.testId = testId;
		this.listOfIdsOfQuestion = listOfIdsOfQuestion;
		this.description = description;
		this.type = type;
		this.startDate = startDate;
		this.endDate = endDate;
		this.level = level;
		this.adminId = adminId;
		Status = status;
	}

	public Test(String level, String description, String type, List<Integer> listOfIdsOfQuestion) {

		this.level = level;
		this.description = description;
		this.type = type;
		this.listOfIdsOfQuestion = listOfIdsOfQuestion;
	}

	// Constructor
	public Test(int testId, List<Integer> listOfIdsOfQuestion, int catalogId) {
		this.testId = testId;
		this.listOfIdsOfQuestion = listOfIdsOfQuestion;
		this.catalogId = catalogId;
	}

	public int getCatalogId() {
		return catalogId;
	}

	public String getType() {
		return type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setCatalogId(int catalogId) {
		this.catalogId = catalogId;
	}

	public int getTestId() {
		return testId;
	}

	public void setTestId(int testId) {
		this.testId = testId;
	}

	public int getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}

	public int getNoOfQuestion() {
		return noOfQuestion;
	}

	public void setNoOfQuestion(int noOfQuestion) {
		this.noOfQuestion = noOfQuestion;
	}

	public List<Integer> getListOfIdsOfQuestion() {
		return listOfIdsOfQuestion;
	}

	public void setListOfIdsOfQuestion(List<Integer> listOfIdsOfQuestion) {
		this.listOfIdsOfQuestion = listOfIdsOfQuestion;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	@Override
	public String toString() {
		return "Test [listOfIdsOfQuestion=" + listOfIdsOfQuestion + ", type=" + type + "]";
	}

}