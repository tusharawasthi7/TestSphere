package test.vault.dashboard.entities;

public class Test {
	private String Catalog_Name;
	private int Test_id;
	private int Number_of_Questions;
	private String start_time;
	private String end_time;
	private int adminID;
	private String name;
	private int status;
	private String date;
	private String list_of_questions;
	private String level;
	private String type;

	public Test() {
		super();
	}

	public Test(String catalog_Name, int test_id, int number_of_Questions, String start_time, String end_time) {
		super();
		Catalog_Name = catalog_Name;
		Test_id = test_id;
		Number_of_Questions = number_of_Questions;
		this.start_time = start_time;
		this.end_time = end_time;
	}

	public Test(String catalog_Name, int test_id, int number_of_Questions, String start_time, String end_time,
			int adminID, String name, int status, String date, String list_of_questions, String level, String type) {
		super();
		Catalog_Name = catalog_Name;
		Test_id = test_id;
		Number_of_Questions = number_of_Questions;
		this.start_time = start_time;
		this.end_time = end_time;
		this.adminID = adminID;
		this.name = name;
		this.status = status;
		this.date = date;
		this.list_of_questions = list_of_questions;
		this.level = level;
		this.type = type;
	}

	public String getCatalog_Name() {
		return Catalog_Name;
	}

	public void setCatalog_Name(String catalog_Name) {
		Catalog_Name = catalog_Name;
	}

	public int getTest_id() {
		return Test_id;
	}

	public void setTest_id(int test_id) {
		Test_id = test_id;
	}

	public int getNumber_of_Questions() {
		return Number_of_Questions;
	}

	public void setNumber_of_Questions(int number_of_Questions) {
		Number_of_Questions = number_of_Questions;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public int getAdminID() {
		return adminID;
	}

	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getList_of_questions() {
		return list_of_questions;
	}

	public void setList_of_questions(String list_of_questions) {
		this.list_of_questions = list_of_questions;
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
		return "Test [Catalog_Name=" + Catalog_Name + ", Test_id=" + Test_id + ", Number_of_Questions="
				+ Number_of_Questions + ", start_time=" + start_time + ", end_time=" + end_time + ", adminID=" + adminID
				+ ", name=" + name + ", status=" + status + ", date=" + date + ", list_of_questions="
				+ list_of_questions + ", level=" + level + ", type=" + type + "]";
	}

}
