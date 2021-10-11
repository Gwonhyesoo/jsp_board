
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConnection.jsp" %>
<%
    String idx = request.getParameter("idx");
    sql = "DELETE FROM board_tbl where idx = "+idx;
    conn.prepareStatement(sql).executeUpdate();
%>
<script>
    alert('완료되었습니다.');
    location.replace('./');
</script>
