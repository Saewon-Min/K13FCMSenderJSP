<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<%

String ApiKey = "AAAA55bvh-s:APA91bHVNqAWctCcU0OmWT3ukBbblFjhk-F4HTczQIYpBofYI2oI2XwXLUq_73iRVe-NABZwktkLLohbjOfBm7tKyBoDCr3rpMFT7wa594GRJ_yPdB_eHjuj0dZMG_eo4iyZ5blXYBR7";
String fcmURL = "https://fcm.googleapis.com/fcm/send";

response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");

String notiTitle = request.getParameter("notiTitle");
String notiBody = request.getParameter("notiBody");
String message = request.getParameter("message");

try{
	String deviceId1 = "dUNzN6Jg1tY:APA91bHJidFp93-nC8DzYQHZKnB88ZNYwjq2Odka9mJjYSYzNSeu_78Mo94F1JFZXwtjzvIVRhvMpQz9ppIpp3kbcyhd3SWS5QogtkD6R4cHX1ERu25WThVe-G8vWtPQONe6tje_XXVF";
	
	JSONArray deviceList = new JSONArray();
	deviceList.add(deviceId1);
	
	
	URL url = new URL(fcmURL);
	
	HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	
	conn.setUseCaches(false);
	conn.setDoInput(true);
	conn.setDoOutput(true);

	conn.setRequestMethod("POST");
	conn.setRequestProperty("Authorization", "key="+ApiKey);
	conn.setRequestProperty("Content-Type", "application/json");
	
	JSONObject json = new JSONObject();
	
	JSONObject noti = new JSONObject();
	noti.put("title", notiTitle);
	noti.put("body", notiBody);
	
	JSONObject data = new JSONObject();
	data.put("message", message);
	
	json.put("to", deviceId1);
	
	json.put("notification", noti);
	json.put("data", data);
	
	try{
		
		OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		wr.write(json.toString());
		wr.flush();
		
		BufferedReader br = new BufferedReader(
				new InputStreamReader(conn.getInputStream()));
		
		String output;
		System.out.println("Output from server ... \n");
		while((output = br.readLine()) != null){
			System.out.println(output);
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	out.println(notiTitle+"<br/>");
	out.println(notiBody+"<br/>");
	out.println("FCM 발송됨");
	
}catch(Exception e){
	e.printStackTrace();
}



%>
</body>
</html>