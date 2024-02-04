package utils.seller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import vo.seller.StoreVo;

public class StoreSearchUtils {
	
	
	public static List<StoreVo> search_store_json(double cx, double cy, String indsMclsCode) throws IOException{
		
		List<StoreVo> list = new ArrayList<StoreVo>();
		
		StringBuffer sb = new StringBuffer();
		String str_url_api_key = "https://apis.data.go.kr/B553077/api/open/sdsc2/storeListInRadius?ServiceKey=ServiceKey값필요";
		String str_url = String.format("%s&pageNo=1&numOfRows=10&radius=2000&cx=%.7f&cy=%.7f&indsMclsCd=%s&type=json",str_url_api_key, cx, cy, indsMclsCode);
		
		URL url = new URL(str_url);
		
		HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
		urlConn.connect();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"utf-8"));

		while(true) {
			
			String data = br.readLine();
			if(data==null) break;
			
			sb.append(data);
		}			
		
		JSONObject json = new JSONObject(sb.toString());
		JSONArray localArray = json.getJSONObject("body").getJSONArray("items");
		
		for(int i=0; i<localArray.length(); i++) {
			JSONObject local = localArray.getJSONObject(i);
			
			String bizesId = local.optString("bizesId", "");
			String bizesNm = local.optString("bizesNm", "");
			String lnoAdr = local.optString("lnoAdr", "");
			String rdnmAdr = local.optString("rdnmAdr", "");
			String indsMclsCd = local.optString("indsMclsCd", "");
			String indsMclsNm = local.optString("indsMclsNm", "");
			
			double lon = local.optDouble("lon", 0.0);
			double lat = local.optDouble("lat", 0.0);
			
			StoreVo vo = new StoreVo(bizesId, bizesNm, lnoAdr, rdnmAdr, lon, lat, indsMclsCd, indsMclsNm);
			
			list.add(vo);
			
		}
		
		return list;
	}

}
