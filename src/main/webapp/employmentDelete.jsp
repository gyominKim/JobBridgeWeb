<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% 
    if (!"POST".equalsIgnoreCase(request.getMethod())) {
        response.sendError(405, "POST 요청만 허용됩니다.");
        return;
    }
    String number = request.getParameter("num");
    int id;
    try {
        id = Integer.parseInt(number);
        if (id <= 0) throw new NumberFormatException();
    } catch (NumberFormatException ex) {
        response.sendError(400, "잘못된 공고 번호입니다.");
        return;
    }
%>
<jsp:useBean id="employmentDao" class="employmentDB.employmentDao" />
<%
	employmentDao.employmentDelete(id);
    response.sendRedirect("employmentMain.jsp");
%>
