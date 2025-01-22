package test.vault.admintest.repository;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import test.vault.dashboard.entities.Test;

@Repository
public class TestHistoryDaoImpl implements TestHistoryDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Test> getTestByAdminId(int adminId) {
		final String SELECT_QUERY = "SELECT distinct   c.Catalog_Name, t.Test_id,t.Number_of_Questions,t.Start_Time,t.End_Time,t.Admin_ID,t.list_of_questions,t.test_name,t.status,t.date,l.level_name,ty.type_name\r\n"
				+ "							 				FROM \r\n"
				+ "											    Test t\r\n"
				+ "				                                     JOIN \r\n"
				+ "				                                     level l ON t.level = l.level_id\r\n"
				+ "				                                    JOIN \r\n"
				+ "				                                      type ty ON t.type = ty.type_id\r\n"
				+ "				                                    JOIN \r\n"
				+ "												     exam_Catalog c ON t.Catalog_ID = c.Catalog_id where t.admin_id=? order by test_id desc";
		return jdbcTemplate.query(SELECT_QUERY, new Object[] { adminId }, new TestHistoryRowMapper());
	}
}
