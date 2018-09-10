$(function() {
    checkOS();
});

function checkOS() {
    if (/Android/i.test(navigator.userAgent)) {
        $("html").addClass("android-device");
    }
}

function enableBodyScroll() {
    if (document.readyState === 'complete') {
        document.body.style.position = '';
        document.body.style.overflowY = '';
        if (document.body.style.marginTop) {
            var scrollTop = -parseInt(document.body.style.marginTop, 10);
            document.body.style.marginTop = '';
            window.scrollTo(window.pageXOffset, scrollTop);
        }
    } else {
        window.addEventListener('load', enableBodyScroll);
    }
}

function disableBodyScroll() {
    if (document.readyState === 'complete') {
        if (document.body.scrollHeight > window.innerHeight) {
            document.body.style.position = 'fixed';
            document.body.style.overflowY = 'scroll';
        }
    } else {
        window.addEventListener('load', disableBodyScroll);
    }
}