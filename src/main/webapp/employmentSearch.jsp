<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="employmentDB.employmentDo" %>
<%@ include file="employmentUtils.jspf" %>
<%
    request.setCharacterEncoding("UTF-8");
    String keyword = request.getParameter("name");
    if (keyword == null) keyword = "";
    keyword = keyword.trim();
%>
<jsp:useBean id="searchDao" class="employmentDB.employmentDao" />
<%
    ArrayList<employmentDo> searchJobs = keyword.isEmpty()
            ? searchDao.getAllEmployment()
            : searchDao.getAllEmploymentByName(keyword);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 공고 찾기 | JobBridge</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/site.js" defer></script>
</head>
<body>
    <%@ include file="employmentNav.jsp" %>
    <main>
        <section class="page-heading page-shell">
            <span class="eyebrow">FIND YOUR OPPORTUNITY</span>
            <h1>채용 공고 <strong>찾기</strong></h1>
            <p>원하는 기업의 채용 정보를 빠르게 검색해 보세요.</p>
            <form class="search-page-form" action="employmentSearch.jsp" method="get" role="search">
                <label class="visually-hidden" for="jobs-query">기업명 검색</label>
                <input id="jobs-query" type="search" name="name" placeholder="기업명을 입력하세요" value="<%= escapeHtml(keyword) %>">
                <button class="button button--primary" type="submit">검색하기 <span aria-hidden="true">→</span></button>
            </form>
        </section>
        <section class="jobs-section jobs-section--results page-shell" aria-labelledby="result-title">
            <div class="section-heading">
                <div>
                    <span class="eyebrow">SEARCH RESULTS</span>
                    <h2 id="result-title"><%= keyword.isEmpty() ? "전체 채용 공고" : "검색 결과" %></h2>
                    <p><% if (!keyword.isEmpty()) { %>‘<%= escapeHtml(keyword) %>’ 검색 결과입니다.<% } else { %>현재 등록된 모든 공고를 확인하세요.<% } %></p>
                </div>
                <span class="job-count">전체 <strong><%= searchJobs.size() %></strong>건</span>
            </div>
            <% if (searchJobs.isEmpty()) { %>
                <div class="empty-state">
                    <span class="empty-icon" aria-hidden="true">⌕</span>
                    <h3>검색 결과가 없어요.</h3>
                    <p>기업명 철자를 확인하거나 다른 키워드로 검색해 보세요.</p>
                    <a class="button button--primary" href="employmentSearch.jsp">전체 공고 보기</a>
                </div>
            <% } else { %>
                <div class="job-grid">
                    <% for (employmentDo job : searchJobs) { %>
                        <%@ include file="employmentCard.jspf" %>
                    <% } %>
                </div>
            <% } %>
        </section>
    </main>
    <%@ include file="employmentFooter.jspf" %>
</body>
</html>
