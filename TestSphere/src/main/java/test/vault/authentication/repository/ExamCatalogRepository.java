package test.vault.authentication.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import test.vault.authentication.entities.ExamCatalog;

public interface ExamCatalogRepository extends JpaRepository<ExamCatalog, Integer> {
}
