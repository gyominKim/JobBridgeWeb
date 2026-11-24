<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="employmentUtils.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 공고 등록 | JobBridge</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/site.js" defer></script>
</head>
<body>
    <%@ include file="employmentNav.jsp" %>
    <main>
        <section class="page-heading page-shell page-heading--register">
            <span class="eyebrow">POST A JOB</span>
            <h1>새로운 인재와 <strong>연결되세요.</strong></h1>
            <p>채용에 필요한 정보를 입력하면 공고 목록에 등록됩니다.</p>
        </section>
        <section class="form-layout page-shell" aria-labelledby="register-title">
            <div class="form-side">
                <div class="form-side-card">
                    <span class="form-side-icon" aria-hidden="true">✦</span>
                    <h2>좋은 인재를 만나는<br>첫 번째 단계</h2>
                    <p>기업명부터 채용 분야까지, 지원자에게 필요한 정보를 명확하게 전달해 보세요.</p>
                    <img src="images/work2.jpg" alt="밝은 공간에서 업무를 논의하는 모습" loading="lazy">
                </div>
            </div>
            <div class="form-card">
                <div class="form-card-heading">
                    <span class="eyebrow">RECRUITMENT DETAILS</span>
                    <h2 id="register-title">채용 정보 등록</h2>
                    <p><span class="required-dot">*</span> 표시된 항목은 필수 입력입니다.</p>
                </div>
                <% if ("required".equals(request.getParameter("error"))) { %>
                    <div class="form-alert" role="alert">필수 입력 항목을 모두 작성해 주세요.</div>
                <% } %>
                <form class="register-form" action="employmentRegisterProc.jsp" method="post">
                    <div class="field-group">
                        <label for="company-name">회사 이름 <span class="required-dot">*</span></label>
                        <input id="company-name" type="text" name="name" maxlength="100" placeholder="예: ABC 테크" required>
                    </div>
                    <div class="field-group">
                        <label for="job-field">채용 분야 <span class="required-dot">*</span></label>
                        <input id="job-field" type="text" name="field" maxlength="100" placeholder="예: 백엔드 개발자" required>
                    </div>
                    <div class="form-row">
                        <div class="field-group">
                            <label for="job-period">채용 기간 <span class="required-dot">*</span></label>
                            <input id="job-period" type="text" name="period" maxlength="100" placeholder="예: 2026.11.01 ~ 11.30" required>
                        </div>
                        <div class="field-group">
                            <label for="job-personnel">채용 인원 <span class="required-dot">*</span></label>
                            <input id="job-personnel" type="text" name="personnel" maxlength="30" placeholder="예: 2명" required>
                        </div>
                    </div>
                    <div class="field-group">
                        <label for="company-image">회사 로고 이미지 파일명 <span class="label-optional">선택</span></label>
                        <input id="company-image" type="text" name="image" maxlength="120" placeholder="예: logo.jpg" list="sample-logos" pattern="([A-Za-z0-9_-]+\.(jpg|jpeg|png|webp|gif))?">
                        <datalist id="sample-logos">
                            <option value="naverlogo.jpg"></option>
                            <option value="netmarblelogo.jpg"></option>
                            <option value="nexonlogo.png"></option>
                        </datalist>
                        <small>실제 파일을 <code>images</code> 폴더에 넣고 파일명만 입력하세요. 비워두면 기본 아이콘이 표시됩니다.</small>
                    </div>
                    <div class="form-actions">
                        <button class="button button--primary button--wide" type="submit">채용 공고 등록하기 <span aria-hidden="true">→</span></button>
                        <a class="button button--outline" href="employmentMain.jsp">취소</a>
                    </div>
                </form>
            </div>
        </section>
    </main>
    <%@ include file="employmentFooter.jspf" %>
</body>
</html>
