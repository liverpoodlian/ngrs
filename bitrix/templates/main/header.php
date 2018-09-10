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
		<script defer type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3&name=pro100api&key=AIzaSyBYGhS9p49bpQh4P2XW__cA3Jrjr4DRiRU"></script>
	</head>
	<body>
		<?$APPLICATION->ShowPanel();?>