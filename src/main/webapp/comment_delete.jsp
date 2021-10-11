<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConnection.jsp" %>
<%
    PreparedStatement pstmt = null;

    String idx = request.getParameter("idx");
    sql = "DELETE FROM sys.comment_tbl where idx = "+idx;
    conn.prepareStatement(sql).executeQuery();
%>
<script>
    alert('완료되었습니다.');
    location.replace('./')
</script>
