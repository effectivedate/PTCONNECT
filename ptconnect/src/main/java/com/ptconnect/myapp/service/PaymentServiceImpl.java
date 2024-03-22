package com.ptconnect.myapp.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;


import javax.net.ssl.HttpsURLConnection;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ptconnect.myapp.domain.PaymentDTO;
import com.ptconnect.myapp.persistance.PaymentServiceMapper;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	private PaymentServiceMapper psm;
	
	@Autowired
	public PaymentServiceImpl(SqlSession sqlSession) {
		this.psm = sqlSession.getMapper(PaymentServiceMapper.class);
	}
	
	@Override
	public int payment(PaymentDTO po) {
		int value = psm.payment(po);
		
		return value;
	}
	
	@Override
	public int pointInsert(PaymentDTO po) {
		int value = psm.pointInsert(po);
		
		return value;
	}
	
	@Override
	public int usePoint(PaymentDTO po) {
		int value = psm.usePoint(po);
		
		return value;
	}
	
	@Override
	public int nonmember(PaymentDTO po) {
		
		int value = psm.nonmember(po);
		
		return value;
	}
	
	@Override
	public int orderInsert(PaymentDTO po) {
		
		int value = 0;
		int value1 = psm.orderInsert(po);
		
		if(value1 > 0) {
			
			int value2 = psm.orderProductInsert(po);
			
			value = value1 + value2;
		}
		
		return value;
	}
	
	@Override
	public int nonUserOrderInsert(PaymentDTO po) {
		int value = 0;
		
		int value1 = psm.nonUserOrderInsert(po);
		
		if(value1 > 0) {
			
			int value2 = psm.orderProductInsert(po);
			
			value = value1 + value2;
		}
		
		return value;
	}
	
	@Override
	public int paymentCancleInsert(PaymentDTO po) {
		
		int value = psm.paymentCancleInsert(po);
		
		int value2= psm.paymentStateUpdate(po);
		
		return value + value2;
	}
	
	@Override
	public int paymentStateUpdate(PaymentDTO po) {
		
		int value = psm.paymentStateUpdate(po);
		
		return value;
	}
	
	/* 토큰 생성 */
	@Value("4176882764844470")
	private String impKey;

	@Value("EtE9nR7enHwIOhhyoRb4DFWO0vBWwgGMerHqFTXlEeT4vqckQroT9gSl58D6sBA5PFTNRJdU5qnJJRIb")
	private String impSecret;

	public String getToken() throws Exception {

		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", impKey);
		json.addProperty("imp_secret", impSecret);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();


		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
	}
	
	/* 주문번호와 토큰 이용해서 결제정보 불러오기 */
	public String paymentInfo(String imp_uid, String access_token) throws IOException, ParseException {
		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("GET");
		conn.setRequestProperty("Authorization", access_token);
		conn.setDoOutput(true);

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		JSONParser parser = new JSONParser();

		JSONObject p = (JSONObject) parser.parse(br.readLine());
		
		String response = p.get("response").toString();
		
		p = (JSONObject) parser.parse(response);
		
		String amount = p.get("amount").toString();

		System.out.println("amount : " + amount);
		return amount;
	}
	
	@Override
	/* 결제 취소 */
	public void payMentCancle(String access_token,String merchant_uid, String imp_uid, String amount, String reason,
							PaymentDTO po) throws IOException, ParseException {
		System.out.println("imp_uid : " + imp_uid);
		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/payments/cancel");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");

		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", access_token);

		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();

		json.addProperty("reason", reason);
		json.addProperty("merchant_uid", merchant_uid);
		json.addProperty("imp_uid", imp_uid);
		json.addProperty("amount", amount);
		po.setPcContent(reason);
		po.setPcPrice(Integer.parseInt(amount));
		
		System.out.println("imp_uid : " + imp_uid);
		System.out.println("merchant_uid : " + merchant_uid);
		System.out.println("amount : " + amount);
		System.out.println("reason : " + reason);
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		
		 System.out.println("요청이 성공적으로 전송되었습니다.");
		
	}
	
	@Override
	public int sumPoint(int mbNo) {
		int sumPoint = psm.sumPoint(mbNo);
		
		return sumPoint;
	}
	
	@Override
	public PaymentDTO selectPointBalance(int mbNo) {
		
//		int ptBalance = psm.selectPointBalance(mbNo);
//		
//		return ptBalance;
		
		PaymentDTO po = psm.selectPointBalance(mbNo);
		
		return po;
	}
	
	@Override
	public int updatePointBalance(PaymentDTO po) {
		
		int value = psm.updatePointBalance(po);
		
		return value;
	}
	
	@Override
	public int usePointDetail(PaymentDTO po) {
		
		int value = psm.usePointDetail(po);
		
		return value;
	}
	
	@Override
	public PaymentDTO selectUsePoint(PaymentDTO po) {
	
		PaymentDTO po2 = psm.selectUsePoint(po);
		
		return po2;
	}
	
}
