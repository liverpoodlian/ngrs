$(function() {
    checkOS();
    initFooterSlider();
    initProjectsSlider();
    initReviewsSlider();
    openMenu();
    hidePreloader();
    initTags();
    startTags();
    clickOnMobileMenuLink();
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
            document.body.style.width = '100vw';
        }
    } else {
        window.addEventListener('load', disableBodyScroll);
    }
}

function initFooterSlider() {
    $('.video-slider').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: false,
        buttons: false,
        autoplay: true,
        autoplaySpeed: 10000,
        fade: true,
        speed: 2000,
        cssEase: 'ease-out'
    });

    $('.video-slider').find('.slick-current').find('video').get(0).play();

    $('.video-slider').on('afterChange', function(slick, currentSlide) {
        $('.video-slider').find('.slick-current').find('video').get(0).play();
    });
}

function initProjectsSlider() {
    $('.projects-slider').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: true,
        arrows: false
    });
}

function initReviewsSlider() {
    $('.reviews-slider').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: false,
        arrows: false
    });

    $('.reviews-slider__next').on('click', function() {
        $('.reviews-slider').slick('slickNext');
    });
}

function openMenu() {
    $('.header__burger').on('click', function(e) {
        toggleMobileMenu();
    });
}

function toggleMobileMenu() {
    $('.header__burger').toggleClass('header__burger--opened');
    $('.menu-mobile').toggleClass('menu-mobile--active');

    if($('.menu-mobile').hasClass('menu-mobile--active')) {
        disableBodyScroll();
    } else {
        enableBodyScroll();
    }
}

function hidePreloader() {
    $(window).on('load', function() {
        $('.preloader').fadeOut();
    });
}

function initTags() {
    $(window).on('load', function() {
        try {
            $('#myCanvas').find('a').each(function() {
                $(this).css('font-size', Math.floor(Math.random() * 60) + 20);
            });
            var options = {
                textColour: '#4a4b4c',
                textFont: 'Bebas',
                textHeight: 60,
                outlineColour: 'transparent',
                outlineThickness: 0,
                maxSpeed: 0.03,
                depth: 0.5,
                wheelZoom: false
            }
            TagCanvas.Start('myCanvas', '', options);
        } catch(e) {
            $('#myCanvas').style.display = 'none';
        }
    });
}

function startTags() {
    if(!$('#myCanvas').tagcanvas()) {
        $('#myCanvas').hide();
    }
}

function clickOnMobileMenuLink() {
    $('.menu-mobile').find('.header-menu__link').on('click', function() {
        toggleMobileMenu();
    });
}