package test.vault.authentication.repository;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import test.vault.authentication.entities.Admin;
import test.vault.authentication.entities.Role;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<Admin> getAllAdmins() {
		final String GET_ALL_ADMINS = "SELECT * FROM admin";
		return jdbcTemplate.query(GET_ALL_ADMINS, new AdminRowMapper());
	}

	@Override
	public List<Admin> getAllAdmin(int roleId) {
		final String GET_ALL_ADMINS_BY_ROLE = "SELECT * FROM admin WHERE role_id = ?";
		return jdbcTemplate.query(GET_ALL_ADMINS_BY_ROLE, new AdminRowMapper(), roleId);
	}

	@Override
	public Optional<Admin> getAdminData(String username) {
		Admin admin = null;
		final String GET_ADMIN = "SELECT * FROM admin WHERE username = ?";

		
		try {
			admin = jdbcTemplate.queryForObject(GET_ADMIN, new AdminRowMapper(), username);
		} catch (DataAccessException dataAccessException) {
			dataAccessException.printStackTrace();
		}

		return Optional.ofNullable(admin);
	}

	@Override
	public List<Role> getAllRoles() {
		final String GET_ALL_ROLES = "SELECT * FROM role";

		return jdbcTemplate.query(GET_ALL_ROLES, (rs, rowNum) -> {
			int id = rs.getInt("role_id");
			String name = rs.getString("role_name");
			return new Role(id, name);
		});
	}

	@Override
	public void changeAuthority(int adminId) {
		final String CHANGE_AUTH = "UPDATE admin SET authorized = !authorized WHERE id = ?";
		jdbcTemplate.update(CHANGE_AUTH, adminId);
	}

	@Override
	public int insertAdmin(Admin admin) {
		
		final String INSERT_QUERY = "INSERT INTO admin (full_name, mobile, email, username, pwd_salt, pwd_hash, authorized, role_id) VALUES (?,?,?,?,?,?,?,?)";

		return jdbcTemplate.update(INSERT_QUERY, admin.getFullName(), admin.getMobile(), admin.getEmail(),
				admin.getUsername(), admin.getPwdSalt(), admin.getPwdHash(), admin.getAuthorized(),
				admin.getRole().getRoleId());
	}
	
	@Override
	public boolean isUsernameUnique(String username) {
		String GET_QUERY = "SELECT COUNT(*) FROM admin WHERE username = ?";
		@SuppressWarnings("deprecation")
		Integer count = jdbcTemplate.queryForObject(GET_QUERY, new Object[] { username }, Integer.class);
		return count == 0; // Returns true if username is unique, false otherwise
	}

}
