package cn.bw.ssm.pojo;

public class CostVO extends Cost {
	private String name_sort;
	private String pai_sort;
	private String page;
	private String dian_sort;
	
	public String getDian_sort() {
		return dian_sort;
	}
	public void setDian_sort(String dian_sort) {
		this.dian_sort = dian_sort;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getName_sort() {
		return name_sort;
	}
	public void setName_sort(String name_sort) {
		this.name_sort = name_sort;
	}
	public String getPai_sort() {
		return pai_sort;
	}
	public void setPai_sort(String pai_sort) {
		this.pai_sort = pai_sort;
	}
	@Override
	public String toString() {
		return "CostVO [name_sort=" + name_sort + ", pai_sort=" + pai_sort + ", page=" + page + "]";
	}

	
	
}
