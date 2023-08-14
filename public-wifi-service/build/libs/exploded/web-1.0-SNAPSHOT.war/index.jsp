<%@ page import="com.example.publicwifi.data.PublicService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.publicwifi.data.PubWifi" %>
<%@ page import="com.example.publicwifi.data.HistWifi" %>
<%@ page import="com.example.publicwifi.data.HistoryService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        div {
            height: 40px;
        }
        div a {
            padding: 0 10px 0 5px;
            border-right: 1px solid #000;
        }
        div a:last-child {
            border: 0;
        }
        table {
            width: 100%;
        }

        table thead tr th {
            background-color: mediumseagreen;
            border-right: 1px solid #fff;
            color: #fff;
            padding: 10px 0;
        }
    </style>

    <title>와이파이 정보 구하기</title>
</head>
<body>

<h1>와이파이 정보 구하기</h1>

<div class="button-container">
    <button class="button"
            onclick="location.href='index.jsp'"

    > 홈
    </button>

    <button class="button"
            onclick="location.href='history.jsp'"
    >위치 히스토리 목록
    </button>

    <button class="button"
            onclick="location.href='wifi-loading.jsp'"
    >Open API 와이파이 정보 가져오기
    </button>

    <button class="button"
    >북마크 보기
    </button>

    <button class="button"
    >북마크 그룹 관리
    </button>
</div>

<form method="get" action="/">
    <label> LAT :
        <input type="text" placeholder="0.0" name="lat" id="lat">
    </label>
    <label> LNT :
        <input type="text" placeholder="0.0" name="lnt" id="lnt">
    </label>

    <button type="button" class="button" onclick="getLocation()">내 위치 불러오기</button>

    </a>
    <button type="submit">
        근처 WIFI 정보 보기
    </button>
    <p></p>
</form>
<%
    String lnt = request.getParameter("lnt");
    String lat = request.getParameter("lat");
%>
<script>
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                const latitude = position.coords.latitude;
                const longitude = position.coords.longitude;
                //빈칸에 값 넣기
                document.getElementById("lat").value = latitude;
                document.getElementById("lnt").value = longitude;
            });
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    }
</script>
<table>
    <thead>
    <tr>
        <th>거리(Km)</th>
        <th>관리번호</th>
        <th>자치구</th>
        <th>와이파이명</th>
        <th>도로명주소</th>
        <th>상세주소</th>
        <th>설치위치(층)</th>
        <th>설치유형</th>
        <th>설치기관</th>
        <th>서비스구분</th>
        <th>망종류</th>
        <th>설치년도</th>
        <th>실내외구분</th>
        <th>WIFI접속환경</th>
        <th>X좌표</th>
        <th>Y좌표</th>
        <th>작업일자</th>
    </tr>
    </thead>

    <tbody>
    <%
        if (lnt == null && lat == null) {
    %>
    <tr>
        <td colspan="17" style="text-align: center; padding: 10px 0;">
            위치 정보를 입력한 후에 조회해 주세요.
        </td>
    </tr>
    <%
    } else {
        HistWifi histWifi = new HistWifi();
        histWifi.setLongitude(lnt);
        histWifi.setLatitude(lat);

        HistoryService historyService = new HistoryService();
        historyService.save(histWifi);

        PublicService publicService = new PublicService();
        List<PubWifi> wifiList = publicService.list(lnt, lat);

        for (PubWifi pubWifi : wifiList) {
    %>
    <tr>
        <td> <%= pubWifi.getDist() %> </td>
        <td> <%= pubWifi.getMgrNo() %> </td>
        <td> <%= pubWifi.getRegion() %> </td>
        <td> <%= pubWifi.getMainNm() %> </td>
        <td> <%= pubWifi.getAddress() %> </td>
        <td> <%= pubWifi.getAddressDetail() %> </td>
        <td> <%= pubWifi.getInstallFloor() %> </td>
        <td> <%= pubWifi.getInstallTy() %> </td>
        <td> <%= pubWifi.getInstallMby() %> </td>
        <td> <%= pubWifi.getServiceSe() %> </td>
        <td> <%= pubWifi.getNetworkTy() %> </td>
        <td> <%= pubWifi.getInstallYear() %> </td>
        <td> <%= pubWifi.getIsOutdoor() %> </td>
        <td> <%= pubWifi.getConnectEnv() %> </td>
        <td> <%= pubWifi.getLongitude() %> </td>
        <td> <%= pubWifi.getLatitude() %> </td>
        <td> <%= pubWifi.getWorkDate() %> </td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
<script>
    const params = new URLSearchParams(window.location.search)
    const lnt = params.get("lnt")
    const lat = params.get("lat")

    if (lnt) {
        const lntElement = document.getElementById("lnt")
        lntElement.setAttribute("value", lnt)
    }

    if (lat) {
        const latElement = document.getElementById("lat")
        latElement.setAttribute("value", lat)
    }
    console.log(params)
</script>
</body>
</html>