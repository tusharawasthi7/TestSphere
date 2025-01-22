package test.vault.authentication.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.vault.authentication.entities.ExamCatalog;
import test.vault.authentication.repository.ExamCatalogRepository;

@Service
public class ExamCatalogService {

	@Autowired
	private ExamCatalogRepository examCatalogRepository;

	public ExamCatalog assignExamType(String catalogName, String language, boolean isMcq, boolean isCoding) {
		ExamCatalog examCatalog = new ExamCatalog();
		examCatalog.setCatalogName(catalogName);
		examCatalog.setLanguage(language);
		examCatalog.setMcq(isMcq);
		examCatalog.setCoding(isCoding);
		return examCatalogRepository.save(examCatalog);
	}
}
