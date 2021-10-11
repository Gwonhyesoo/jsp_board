<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<div>
    <form action="./action.jsp" method="post">
        <fieldset><legend>게시물 작성</legend>
            <input type="hidden" name="action" value="board_insert">
            <ul>
                <li>
                        <span>작성자 :</span>
                        <input type="text" name="writer" size="20" required>
                </li>

                <li>
                        <span>제목 :</span>
                        <input type="text" name="subject" size="20" required>
                </li>

                <li>
                        <span>내용 :</span>
                        <textarea name="content" cols="80" rows="5" required></textarea>
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
