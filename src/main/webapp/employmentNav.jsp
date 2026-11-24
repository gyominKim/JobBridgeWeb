<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String currentPage = request.getRequestURI();

    boolean onRegister = currentPage.endsWith("employmentRegister.jsp");
    boolean onSearch = currentPage.endsWith("employmentSearch.jsp");
%>

<header class="site-header">

    <div class="page-shell navbar">

        <a class="brand"
           href="employmentMain.jsp"
           aria-label="JobBridge 메인으로 이동">

            <span class="brand-mark" aria-hidden="true">
                <span></span>
                <span></span>
                <span></span>
            </span>

            <span>
                Job<span class="brand-accent">Bridge</span>
                <small>CAREER PLATFORM</small>
            </span>

        </a>

        <button class="mobile-menu-button"
                type="button"
                aria-controls="primary-menu"
                aria-expanded="false"
                aria-label="메뉴 열기">

            <span></span>
            <span></span>
            <span></span>

        </button>

        <nav class="primary-menu"
             id="primary-menu"
             aria-label="주요 메뉴">

            <a class="nav-link <%= (!onRegister && !onSearch) ? "is-active" : "" %>"
               href="employmentMain.jsp">
                홈
            </a>

            <a class="nav-link <%= onSearch ? "is-active" : "" %>"
               href="employmentSearch.jsp">
                채용 공고
            </a>

            <a class="nav-link <%= onRegister ? "is-active" : "" %>"
               href="employmentRegister.jsp">
                공고 등록
            </a>

            <a class="button button--small button--primary menu-cta"
               href="employmentRegister.jsp">
                + 공고 등록하기
            </a>

        </nav>

    </div>

</header>