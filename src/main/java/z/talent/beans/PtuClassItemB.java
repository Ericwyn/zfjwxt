package z.talent.beans;

/**
 * 
 * @author Zhangtalent
 *	detailclass表的序列化
 */
public class PtuClassItemB {
	
	private Integer Id;
	private String cdmc;
	private String xqjmc;
	private String kcmc;
	private String jcs;
	private String uuid;
	private String zcd;
	
	public PtuClassItemB(Integer Id,String cdmc,String xqjmc,String kcmc,String jcs,String uuid,String zcd) {
		
		this.Id = Id;
		this.cdmc = cdmc;
		this.xqjmc = xqjmc;
		this.kcmc = kcmc;
		this.jcs = jcs;
		this.uuid = uuid;
		this.zcd = zcd;
		
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getCdmc() {
		return cdmc;
	}

	public void setCdmc(String cdmc) {
		this.cdmc = cdmc;
	}

	public String getXqjmc() {
		return xqjmc;
	}

	public void setXqjmc(String xqjmc) {
		this.xqjmc = xqjmc;
	}

	public String getKcmc() {
		return kcmc;
	}

	public void setKcmc(String kcmc) {
		this.kcmc = kcmc;
	}

	public String getJcs() {
		return jcs;
	}

	public void setJcs(String jcs) {
		this.jcs = jcs;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getZcd() {
		return zcd;
	}

	public void setZcd(String zcd) {
		this.zcd = zcd;
	}
	
	
	
	
	
}
