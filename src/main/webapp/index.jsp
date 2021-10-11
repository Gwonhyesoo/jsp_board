<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<%
    /* next value 가져오기 */
    sql = "SELECT count(*) as cnt from board_tbl";
    ResultSet res = conn.prepareStatement(sql).executeQuery();
    int cnt = 0;
    if (res.next()) cnt = res.getInt(1);
%>
<h2>게시물 목록</h2>
<p>총 <%= cnt %>개의 게시물이 있습니다.</p>
<table>
    <colgroup>
        <col width="10%">
        <col width="15%">
        <col width="60%">
        <col width="15%">
    </colgroup>
    <thead>
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>작성일</th>
        </tr>
    </thead>
    <tbody>
        <%
            /* 회원정보 list 가져오기 */
            sql = "SELECT * from board_tbl order by board_date asc";
            res = conn.prepareStatement(sql).executeQuery();
            String idx, writer, subject, board_date, link;
            while (res.next()) {
                idx = res.getString("idx");
                writer = res.getString("writer");
                subject = res.getString("subject");
                board_date = res.getString("board_date");
                link = "./view.jsp?idx="+idx;
                
                /*
                   년-월-일 시간:분 형태로 가져옴
                   input  : 2018-07-29 00:00:00
                   output : 2018-07-29 00:00
                 */
                if(board_date.length() > 16) board_date = board_date.substring(0,16);
        %>
        <tr style="text-align:center;">
            <td><%= idx %></td>
            <td><%= writer %></td>
            <td><a href="<%= link %>"><%= subject %></a></td>
            <td><%= board_date %></td>
        </tr>
        <% } %>
    </tbody>
</table>
<div class="btn_group right">
    <button type="button" onclick="location.href = './write.jsp'">작성</button>
</div>
<%@ include file="footer.jsp" %>
 
