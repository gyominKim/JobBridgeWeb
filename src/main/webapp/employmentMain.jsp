<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="employmentDB.employmentDo" %>
<%@ include file="employmentUtils.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="다양한 기업과 일자리를 한곳에서 살펴보는 채용 정보 서비스">
    <title>JobBridge | 나에게 맞는 채용 정보를 한곳에서</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/site.js" defer></script>
</head>
<body>
    <%@ include file="employmentNav.jsp" %>
    <main>
        <%@ include file="employmentCarousel.jsp" %>
        <%@ include file="employmentService.jspf" %>	
        <section class="bottom-cta page-shell" aria-labelledby="cta-title">
            <div>
                <span class="eyebrow eyebrow--light">FOR YOUR NEXT STEP</span>
                <h2 id="cta-title">좋은 기회는, 한 번의 등록에서 시작돼요.</h2>
                <p>기업의 채용 소식을 더 많은 구직자에게 알려보세요.</p>
            </div>
            <a class="button button--white" href="employmentRegister.jsp">채용 공고 등록하기 <span aria-hidden="true">↗</span></a>
        </section>
    </main>
    <%@ include file="employmentFooter.jspf" %>
</body>
</html>
