package test.vault.authentication.entities;

public class Admin {

	private int id;
	private String fullName;
	private String mobile;
	private String email;
	private String username;
	private String password;
	private String pwdSalt;
	private String pwdHash;
	private Boolean authorized;
	private Role role;

	public Admin() {
		super();
	}

	public Admin(String fullName, String mobile, String email, String username, String password) {
		super();
		this.fullName = fullName;
		this.mobile = mobile;
		this.email = email;
		this.username = username;
		this.password = password;
	}

	public Admin(int id, String fullName, String mobile, String email, String username, String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.mobile = mobile;
		this.email = email;
		this.username = username;
		this.password = password;
	}

	public Admin(String fullName, String mobile, String email, String username, String password, Role role) {
		super();
		this.fullName = fullName;
		this.mobile = mobile;
		this.email = email;
		this.username = username;
		this.password = password;
		this.role = role;
	}

	public Admin(int id, String fullName, String mobile, String email, String username, String pwdSalt, String pwdHash,
			Boolean authorized, Role role) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.mobile = mobile;
		this.email = email;
		this.username = username;
		this.pwdSalt = pwdSalt;
		this.pwdHash = pwdHash;
		this.authorized = authorized;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public Boolean getAuthorized() {
		return authorized;
	}

	public void setAuthorized(Boolean authorized) {
		this.authorized = authorized;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "\nCustomer [id=" + id + ", fullName=" + fullName + ", mobile=" + mobile + ", email=" + email
				+ ", username=" + username + ", password=" + password + ", pwdSalt=" + pwdSalt + ", pwdHash=" + pwdHash
				+ ", authorized=" + authorized + ", role=" + role + "]";
	}

}
