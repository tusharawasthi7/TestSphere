package test.vault.authentication.entities;

public class User {

	private int id;
	private String name;
	private String password;
	private String pwdSalt;
	private String pwdHash;
	private String emailId;
	private String phoneNo;

	public User() {
		super();
	}

	public User(String name, String password, String emailId, String phoneNo) {
		super();
		this.name = name;
		this.password = password;
		this.emailId = emailId;
		this.phoneNo = phoneNo;
	}

	public User(int id, String name, String password, String emailId, String phoneNo) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.emailId = emailId;
		this.phoneNo = phoneNo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPwdSalt() {
		return pwdSalt;
	}

	public void setPwdSalt(String pwdSalt) {
		this.pwdSalt = pwdSalt;
	}

	public String getPwdHash() {
		return pwdHash;
	}

	public void setPwdHash(String pwdHash) {
		this.pwdHash = pwdHash;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	@Override
	public String toString() {
		return "\n User[id=" + id + ", name='" + name + '\'' + ", password='" + password + '\'' + ", pwdSalt='"
				+ pwdSalt + '\'' + ", pwdHash='" + pwdHash + '\'' + ", emailId='" + emailId + '\'' + ", phoneNo='"
				+ phoneNo + '\'' + '}';
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

}