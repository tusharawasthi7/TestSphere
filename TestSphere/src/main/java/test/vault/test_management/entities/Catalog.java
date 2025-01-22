package test.vault.test_management.entities;

public class Catalog {

	private int cataLogId;
	private String catalogNames;
	boolean isMcq;
	boolean isCoding;

	public Catalog() {
		super();
	}

	public Catalog(int cataLogId, String catalogNames) {
		super();
		this.cataLogId = cataLogId;
		this.catalogNames = catalogNames;
	}

	public Catalog(int cataLogId, String catalogNames, boolean isMcq, boolean isCoding) {
		super();
		this.cataLogId = cataLogId;
		this.catalogNames = catalogNames;
		this.isMcq = isMcq;
		this.isCoding = isCoding;
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

	public int getCataLogId() {
		return cataLogId;
	}

	public void setCataLogId(int cataLogId) {
		this.cataLogId = cataLogId;
	}

	public String getCatalogNames() {
		return catalogNames;
	}

	public void setCatalogNames(String catalogNames) {
		this.catalogNames = catalogNames;
	}

	@Override
	public String toString() {
		return "Catalog [cataLogId=" + cataLogId + ", catalogNames=" + catalogNames + ", isMcq=" + isMcq + ", isCoding="
				+ isCoding + "]";
	}

}
