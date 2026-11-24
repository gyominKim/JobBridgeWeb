<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="employmentDB.employmentDo" %>
<%
    request.setCharacterEncoding("UTF-8");
    if (!"POST".equalsIgnoreCase(request.getMethod())) {
        response.sendRedirect("employmentRegister.jsp");
        return;
    }
%>
<jsp:useBean id="employment" class="employmentDB.employmentDo" />
<jsp:setProperty property="*" name="employment" />
<jsp:useBean id="employmentDao" class="employmentDB.employmentDao" />
<%
    if (employment.getName() == null || employment.getName().trim().isEmpty()
            || employment.getField() == null || employment.getField().trim().isEmpty()
            || employment.getPeriod() == null || employment.getPeriod().trim().isEmpty()
            || employment.getPersonnel() == null || employment.getPersonnel().trim().isEmpty()) {
        response.sendRedirect("employmentRegister.jsp?error=required");
        return;
    }
    employmentDao.insertEmployment(employment);
    response.sendRedirect("employmentMain.jsp");
%>
