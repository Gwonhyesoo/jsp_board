<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConnection.jsp" %>
<%
    String action = request.getParameter("action");
    PreparedStatement pstmt = null;
    
    /**
     * index.jsp, view.jsp update.jsp에서 form을 전송할 때
     * action을 hidden값으로 전송한다. 해당 값에 맞는 명령을 수행하도록  작성 
     */
    switch (action) {
    case "board_insert" :
        sql = "INSERT INTO board_tbl values(board_seq.nextval, ?, ?, ?, SYSDATE)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, request.getParameter("writer"));
        pstmt.setString(2, request.getParameter("subject"));
        pstmt.setString(3, request.getParameter("content"));
        break;
    case "comment_insert" :
        sql = "INSERT INTO comment_tbl values(comment_seq.nextval, ?, ?, ?, SYSDATE)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, request.getParameter("idx"));
        pstmt.setString(2, request.getParameter("writer"));
        pstmt.setString(3, request.getParameter("content"));
        break;
    case "board_update" :
        sql  = "update board_tbl SET writer = ?, subject = ?, content = ? where idx = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, request.getParameter("writer"));
        pstmt.setString(2, request.getParameter("subject"));
        pstmt.setString(3, request.getParameter("content"));
        pstmt.setString(4, request.getParameter("idx"));
        break;
    }
    //out.println(sql.trim());
    //if(true) return;
    pstmt.executeQuery();
%>
<script>
    alert('완료되었습니다.');
    location.replace('./');
</script>
 
