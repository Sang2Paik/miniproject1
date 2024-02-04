package vo.seller;

public class StoreVo {
	
	String bizesId; //비지니스 고유아이디
	String bizesNm; //가게 이름
	String lnoAdr;  //지번 주소
	String rdnmAdr; //도로명 주소
	double lon;		//longitude (경도 x)
	double lat;		//latitude	(위도 y)
	String indsMclsCd; //food category id
	String indsMclsNm; //food category 이름
	
	public StoreVo() {
		// TODO Auto-generated constructor stub
	}
		
	public StoreVo(String bizesId, String bizesNm, String lnoAdr, String rdnmAdr, double lon, double lat,
			String indsMclsCd, String indsMclsNm) {
		super();
		this.bizesId = bizesId;
		this.bizesNm = bizesNm;
		this.lnoAdr = lnoAdr;
		this.rdnmAdr = rdnmAdr;
		this.lon = lon;
		this.lat = lat;
		this.indsMclsCd = indsMclsCd;
		this.indsMclsNm = indsMclsNm;
	}

	public String getBizesId() {
		return bizesId;
	}
	public void setBizesId(String bizesId) {
		this.bizesId = bizesId;
	}
	public String getBizesNm() {
		return bizesNm;
	}
	public void setBizesNm(String bizesNm) {
		this.bizesNm = bizesNm;
	}
	public String getLnoAdr() {
		return lnoAdr;
	}
	public void setLnoAdr(String lnoAdr) {
		this.lnoAdr = lnoAdr;
	}
	public String getRdnmAdr() {
		return rdnmAdr;
	}
	public void setRdnmAdr(String rdnmAdr) {
		this.rdnmAdr = rdnmAdr;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public String getIndsMclsCd() {
		return indsMclsCd;
	}
	public void setIndsMclsCd(String indsMclsCd) {
		this.indsMclsCd = indsMclsCd;
	}
	public String getIndsMclsNm() {
		return indsMclsNm;
	}
	public void setIndsMclsNm(String indsMclsNm) {
		this.indsMclsNm = indsMclsNm;
	}
	
	
	
	
}
