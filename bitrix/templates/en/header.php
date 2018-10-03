<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();?>
<!doctype html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="description" content="">
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	    <title><?$APPLICATION->ShowTitle()?></title>
	    <?$APPLICATION->ShowHead();?>
	    <?$GLOBALS["formCounter"] = 0;?>
	    <?require($_SERVER["DOCUMENT_ROOT"]."/template/header-includes.php");?>
	    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
		<script type="text/javascript" src="/js/lib/jquery.min.3.3.1.js"></script>
	</head>
	<body>
		<?$APPLICATION->ShowPanel();?>
		<div class="preloader">
			<div class="preloader__wrap">
				<div class="preloader__square"></div>
				<p class="preloader__text">Loading</p>
			</div>
		</div>
		<header class="header">
			<div class="header__left-col">
				<a href="/" class="header__logo"></a>
				<nav class="header-menu">
					<a href="/#about" class="header-menu__link">О компании</a>
					<a href="/#services" class="header-menu__link">Наши сервисы</a>
					<a href="/#projects" class="header-menu__link">Наши проекты</a>
					<a href="/#recommendations" class="header-menu__link">Рекомендации</a>
					<a href="/#contacts" class="header-menu__link">Контакты</a>
				</nav>
			</div>
			<div class="header__right-col">
				<div class="header__langs">
					<a href="/" class="header__lang-item">ru.</a>
					<a href="/en/" class="header__lang-item header__lang-item--active">eng.</a>
				</div>
				<a href="tel:+74956467075" class="header__phone">+7 (495) 646-70-75</a>
				<div class="header__mobile">
					<a href="tel:+74956467075" class="header__mobile-phone"></a>
					<div class="header__burger">
						<span class="header__burger-item"></span>
						<span class="header__burger-item"></span>
						<span class="header__burger-item"></span>
					</div>
					<div class="menu-mobile">
						<nav>
							<a href="/#about" class="header-menu__link">О компании</a>
							<a href="/#services" class="header-menu__link">Наши сервисы</a>
							<a href="/#projects" class="header-menu__link">Наши проекты</a>
							<a href="/#recommendations" class="header-menu__link">Рекомендации</a>
							<a href="/#contacts" class="header-menu__link">Контакты</a>
						</nav>
					</div>
				</div>
			</div>
		</header>
		<main class="content">