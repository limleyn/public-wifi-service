<%@ page import="com.example.publicwifi.data.PublicService" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>Open API 와이파이 정보</title>
</head>
<body>

<h1>Open API 와이파이 정보</h1>

<%
  PublicService publicService = new PublicService();
  int total = publicService.getTotal();

%>
<br>
<br>
<div style="text-align: center"><h1><%=total%>개의 WIFI 정보를 정상적으로 저장하였습니다.</h1></div>
<p></p>
<div style=" text-align: center;">
  <button style="text-align: center" onclick="location.href='index.jsp'">홈으로 가기</button>
</div>
</body>
</html>
