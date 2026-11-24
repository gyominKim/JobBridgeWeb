(function () {
    const toggle = document.querySelector('.mobile-menu-button');
    const menu = document.getElementById('primary-menu');
    if (!toggle || !menu) return;

    toggle.addEventListener('click', function () {
        const open = menu.classList.toggle('is-open');
        toggle.setAttribute('aria-expanded', String(open));
        toggle.setAttribute('aria-label', open ? '메뉴 닫기' : '메뉴 열기');
    });

    menu.querySelectorAll('a').forEach(function (link) {
        link.addEventListener('click', function () {
            menu.classList.remove('is-open');
            toggle.setAttribute('aria-expanded', 'false');
            toggle.setAttribute('aria-label', '메뉴 열기');
        });
    });
})();
