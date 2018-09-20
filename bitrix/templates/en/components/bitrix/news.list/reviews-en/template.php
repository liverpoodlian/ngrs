<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();
/** @var array $arParams */
/** @var array $arResult */
/** @global CMain $APPLICATION */
/** @global CUser $USER */
/** @global CDatabase $DB */
/** @var CBitrixComponentTemplate $this */
/** @var string $templateName */
/** @var string $templateFile */
/** @var string $templateFolder */
/** @var string $componentPath */
/** @var CBitrixComponent $component */
$this->setFrameMode(true);
?>
<div class="reviews-slider">
<?foreach($arResult["ITEMS"] as $arItem):?>
	<div class="reviews-slider__item">
		<div class="reviews-slider__wrap">
			<div class="reviews-slider__author">
				<div class="reviews-slider__img" style="background-image: url(<?=$arItem["PREVIEW_PICTURE"]["SRC"]?>)"></div>
				<div class="reviews-slider__about">
					<p class="reviews-slider__fio"><?=$arItem["NAME"]?></p>
					<p class="reviews-slider__position"><?=$arItem["PROPERTIES"]["POSITION"]["VALUE"]?></p>
					<p class="reviews-slider__info"><?=$arItem["PROPERTIES"]["INFO"]["VALUE"]?></p>
				</div>
			</div>
			<div class="reviews-slider__text-wrap">
				<p class="reviews-slider__text"><?=$arItem["PREVIEW_TEXT"];?></p>
				<a class="reviews-slider__next">Следующий отзыв</a>
			</div>
		</div>
	</div>
<?endforeach;?>
</div>
