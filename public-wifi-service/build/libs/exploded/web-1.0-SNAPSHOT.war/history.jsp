<%@ page import="com.example.publicwifi.data.HistWifi" %>
<%@ page import="com.example.publicwifi.data.HistoryService" %>
<%@ page import="java.util.List" %>
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
        table tbody td {
            text-align: center;
        }
    </style>

    <title>와이파이 정보 구하기</title>
</head>
<body>
<h1>와이파이 정보 구하기</h1>

<div class="button-container">
    <button class="button"
            onclick="location.href='index..jsp'"
    > 홈
    </button>

    <button class="button"
            onclick="location.href='history.jsp'"
            style="background-color: #8796ff"
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

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>X좌표</th>
        <th>Y좌표</th>
        <th>조회일자</th>
        <th>비고</th>
    </tr>
    </thead>
    <tbody>
    <%
        HistoryService histService = new HistoryService();
        List<HistWifi> wifiList = histService.list();
        for (HistWifi histWifi : wifiList) {
    %>
    <tr>
        <td>
            <%= histWifi.getHistNo() %>
        </td>
        <td>
            <%= histWifi.getLongitude() %>
        </td>
        <td>
            <%= histWifi.getLatitude() %>
        </td>
        <td>
            <%= histWifi.getSearchDate() %>
        </td>
        <td>

        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>