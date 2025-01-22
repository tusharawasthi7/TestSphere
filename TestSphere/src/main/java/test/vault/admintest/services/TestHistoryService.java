package test.vault.admintest.services;

import java.util.List;

import test.vault.dashboard.entities.Test;

public interface TestHistoryService {
    List<Test> getTestHistoryByAdminId(int adminId);
}
