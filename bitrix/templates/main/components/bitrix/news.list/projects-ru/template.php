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

$i = 0;
?>
<div class="projects-slider">
<?foreach($arResult["ITEMS"] as $arItem):?>
	<?if($i == 0) {?>
		<div class="projects-slider__item">
			<div class="projects-slider__wrap">
	<?}?>
		<div class="projects-slider__project" style="background-image: url('<?=CFile::GetPath($arItem["PROPERTIES"]["LOGO"]["VALUE"])?>')"></div>
	<?
		$i++;
		if($i == 2 || end($arResult["ITEMS"]) == $arItem) {?>
				</div>
			</div>	
		<?
			$i = 0;
		}
	?>
<?endforeach;?>
</div>