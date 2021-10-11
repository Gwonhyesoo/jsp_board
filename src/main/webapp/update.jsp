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
%>
<div>
    <form action="./action.jsp?idx=<%= idx %>" method="post">
        <fieldset><legend>게시물 작성</legend>
            <input type="hidden" name="action" value="board_update">
            <ul>
                <li>
                    <span>작성자 :</span>
                    <input type="text" name="writer" value="<%= writer %>" size="20" required>
                </li>

                <li>
                    <span>제목 :</span>
                    <input type="text" name="subject" value="<%= subject %>" size="20" required>
                </li>

                <li>
                    <span>내용 :</span>
                    <textarea name="content" cols="80" rows="5" required>
                     <%= content %></textarea>
                </li>

            </ul>
            <div class="btn_group">
                <button type="button" onclick="history.back(); return false;">취소</button>
                <button type="submit">전송</button>
            </div>
        </fieldset>
    </form>
</div>
<%@ include file="footer.jsp" %>
