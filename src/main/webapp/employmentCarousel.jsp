<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<section class="hero page-shell" aria-labelledby="hero-title">

    <div class="hero-content">

        <span class="eyebrow">
            <span class="eyebrow-dot"></span>
            YOUR CAREER, OUR CONNECTION
        </span>

        <h1 id="hero-title">
            나에게 딱 맞는<br>
            <strong>일자리</strong>를 만나는 곳.
        </h1>

        <p class="hero-description">
            새로운 도전을 준비하고 있나요?<br>
            다양한 기업의 채용 공고를 편리하게 찾아보세요.
        </p>

        <form class="hero-search"
              action="employmentSearch.jsp"
              method="get"
              role="search">

            <label class="visually-hidden" for="main-search">
                기업명 검색
            </label>

            <span class="search-icon" aria-hidden="true">⌕</span>

            <input id="main-search"
                   type="search"
                   name="name"
                   placeholder="찾고 싶은 기업명을 입력하세요"
                   autocomplete="off">

            <button class="button button--primary" type="submit">
                채용 검색
                <span aria-hidden="true">→</span>
            </button>

        </form>

        <div class="hero-caption">
            <span class="tiny-check" aria-hidden="true">✓</span>
            기업 검색부터 채용 정보 확인까지, 한곳에서
        </div>

    </div>

    <div class="hero-visual">

        <img src="images/work1.jpg"
             alt="팀원들이 함께 협업하는 모습"
             fetchpriority="high">

        <div class="hero-photo-overlay"></div>

        <div class="hero-floating-card" aria-hidden="true">

            <span class="float-icon">✦</span>

            <span>
                <strong>새로운 커리어의 시작</strong>
                <small>당신의 가능성을 연결합니다</small>
            </span>

        </div>

    </div>

</section>