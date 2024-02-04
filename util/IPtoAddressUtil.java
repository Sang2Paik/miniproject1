package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;

import vo.MyLocalVo;

public class IPtoAddressUtil {

	public static MyLocalVo getAddressFromIp(String ip) throws IOException {
		
		ip = "public IP주소";
		
		
		String query = String.format("http://ip-api.com/json/%s",ip	);
		//query = URLEncoder.encode(query, "utf-8");
		
		URL url = new URL(query);
		
		HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
		urlConn.setRequestProperty("Content-Type", "application/json");
		urlConn.connect();
		
		InputStream is 			= urlConn.getInputStream();
		InputStreamReader isr	= new InputStreamReader(is, "utf-8");
		BufferedReader    br 	= new BufferedReader(isr);// 성능향상 / 라인단위로 읽기
		
		StringBuffer      sb	= new StringBuffer();
		while(true) {
			
			String data = br.readLine();//라인단위로 읽기
			if(data==null) break;
			
			sb.append(data);// 라인단위 읽은 데이터 스트링버퍼에 넣는다
		}
		//System.out.println(sb.toString());
		
		JSONObject json = new JSONObject(sb.toString());
		
		double lat = 0.0;
		double lon = 0.0;
		
		try {
			lat = json.getDouble("lat");
			lon = json.getDouble("lon");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String countryCode = json.getString("countryCode");
		String country	   = json.getString("country");
		String regionName  = json.getString("regionName");
		String city		   = json.getString("city");
		String isp		   = json.getString("isp");
		
		MyLocalVo  vo = new MyLocalVo(countryCode, country, regionName, city, isp, lat, lon);
		
		return vo;
		
		
	}
}
