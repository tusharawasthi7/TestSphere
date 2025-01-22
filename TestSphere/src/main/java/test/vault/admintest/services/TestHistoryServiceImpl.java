package test.vault.admintest.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


import test.vault.admintest.repository.TestHistoryDao;
import test.vault.dashboard.entities.Test;


@Service
public class TestHistoryServiceImpl implements TestHistoryService {

    @Autowired
    TestHistoryDao testHistoryDao;

    @Override
    public List<Test> getTestHistoryByAdminId(int adminId) {
        return testHistoryDao.getTestByAdminId(adminId);
    }
}
