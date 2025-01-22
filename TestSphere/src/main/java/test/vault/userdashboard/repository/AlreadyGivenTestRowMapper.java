package test.vault.userdashboard.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import test.vault.dashboard.entities.Test;

public class AlreadyGivenTestRowMapper implements RowMapper<Integer> {

	@Override
	public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
		int testID = rs.getInt("Test_id");
		return testID;

	}

}
