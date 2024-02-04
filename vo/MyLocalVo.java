package vo;

public class MyLocalVo {

	String countryCode;
	String country;
	String regionName;
	String city;
	String isp;
	
	
	public MyLocalVo() {
		// TODO Auto-generated constructor stub
	}
	
	public MyLocalVo(String countryCode, String country, String regionName, String city, String isp, double lat,
			double lon) {
		super();
		this.countryCode = countryCode;
		this.country = country;
		this.regionName = regionName;
		this.city = city;
		this.isp = isp;
		this.lat = lat;
		this.lon = lon;
	}
	double lat;
	double lon;
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getIsp() {
		return isp;
	}
	public void setIsp(String isp) {
		this.isp = isp;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	
	
	
	
}
