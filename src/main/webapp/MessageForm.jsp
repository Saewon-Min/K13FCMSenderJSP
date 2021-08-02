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

    <h2>푸시 보내기</h2>
    
    <form action="FCMSender.jsp" method="post">
   	 <input type="text" name="notiTitle" placeholder="알림 타이틀" /> <br />
   	 <textarea name="notiBody" rows="4" cols="50" placeholder="알림 타이틀" ></textarea> <br />
   	 <textarea name="message" rows="4" cols="50" placeholder="알림 메세지" ></textarea> <br />
   	 <input type="submit" value="보내기" />
    </form>
</body>


</html>