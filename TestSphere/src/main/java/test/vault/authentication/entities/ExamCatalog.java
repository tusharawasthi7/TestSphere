package test.vault.authentication.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class ExamCatalog {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int catalogId;
	private String catalogName;
	private String language;
	private boolean isMcq;
	private boolean isCoding;

	public ExamCatalog(int catalogId, String catalogName, String language, boolean isMcq, boolean isCoding) {
		super();
		this.catalogId = catalogId;
		this.catalogName = catalogName;
		this.language = language;
		this.isMcq = isMcq;
		this.isCoding = isCoding;
	}

	public ExamCatalog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ExamCatalog(String catalogName, String language, boolean isMcq, boolean isCoding) {
		super();
		this.catalogName = catalogName;
		this.language = language;
		this.isMcq = isMcq;
		this.isCoding = isCoding;
	}

	// Getters and Setters
	public int getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(int catalogId) {
		this.catalogId = catalogId;
	}

	public String getCatalogName() {
		return catalogName;
	}

	public void setCatalogName(String catalogName) {
		this.catalogName = catalogName;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public boolean isMcq() {
		return isMcq;
	}

	public void setMcq(boolean isMcq) {
		this.isMcq = isMcq;
	}

	public boolean isCoding() {
		return isCoding;
	}

	public void setCoding(boolean isCoding) {
		this.isCoding = isCoding;
	}
}
