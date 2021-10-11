<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<%
    /* next value 가져오기 */
    String idx = request.getParameter("idx");
    String writer, subject, content, board_date;
    ResultSet res;
    sql = "SELECT * from board_tbl where idx = "+idx;
    res = conn.prepareStatement(sql).executeQuery();
    res.next();
    writer = res.getString("writer");
    subject = res.getString("subject");
    content = res.getString("content");
    board_date = res.getString("board_date");
%>
<h2>게시물 조회</h2>
<ul>
    <li>글번호 : <%= idx %></li>
    <li>작성자 : <%= writer %></li>
    <li>제목 : <%= subject %></li>
    <li>작성일 : <%= board_date %></li>
    <li>내용 : <%= content %></li>
</ul>
<%
    sql = "SELECT * FROM comment_tbl where bidx = "+idx+" order by idx desc";
    res = conn.prepareStatement(sql).executeQuery();
%>
<h2>댓글 조회</h2>
<ul>
    <%
    int cnt = 0;
    String comment_idx, comment_writer, comment_content, comment_date;
    while (res.next()) {
        cnt++;
        comment_idx = res.getString("idx");
        comment_writer = res.getString("writer");
        comment_content = res.getString("content");
        comment_date = res.getString("comment_date");
    %>
    <li>
        <%= comment_writer %> /
        <%= comment_content %> /
        <%= comment_date %> /
        <a href="./comment_delete.jsp?idx=<%= comment_idx %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a></li>
    <% } %>
</ul>
<div>
    <form action="./action.jsp?idx=<%= idx %>" method="post">
        <fieldset><legend>댓글작성</legend>
            <input type="hidden" name="action" value="comment_insert">
            <input type="text" name="writer" size="10" placeholder="작성자">
            <input type="text" name="content" size="80" placeholder="내용">
            <button type="submit">작성완료</button>
        </fieldset>
    </form>
</div>
<div>
    
    <button type="button" onclick="history.back(); return false;">목록</button>
    <button type="button" onclick="location.href = './update.jsp?idx=<%= idx %>'">수정</button>
    <button type="button" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false; location.href = './delete.jsp?idx=<%= idx %>'">삭제</button>
</div>
<%@ include file="footer.jsp" %>

