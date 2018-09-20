<?
if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();
?>

<?=$arResult["FORM_NOTE"]?>
<?=$arResult["FORM_HEADER"]?>
		<div class="row">
			<!-- <h3 class="mb-40"><?=$arResult["FORM_TITLE"]?></h3> -->
<?
/***********************************************************************************
						form questions
***********************************************************************************/
?>
	<?
	foreach ($arResult["QUESTIONS"] as $FIELD_SID => $arQuestion)
	{
		$label = $arQuestion["CAPTION"];
		//$placeholder = $arResult["arQuestions"][$FIELD_SID]["COMMENTS"] ?: false;
		$id = $arQuestion['STRUCTURE'][0]['ID'];
		$required = ($arQuestion['REQUIRED'] == 'Y') ? ' required' : null;
		$placeholder = ($arQuestion['REQUIRED'] == 'Y') ? $arQuestion["CAPTION"].'*' : $arQuestion["CAPTION"];
		if($placeholder == 'HIDDEN')
		{
			echo '<input type="hidden" class="input_num_'.$id.'" name="form_text_'.$id.'" value="'.$arResult['arrVALUES']['form_text_'.$id].'" />';
			continue;
		}


		switch ($arQuestion['STRUCTURE'][0]['FIELD_TYPE']) {
			case 'hidden':
				echo $arQuestion["HTML_CODE"];
				break;

			case 'text':
			// echo $arQuestion["HTML_CODE"];
			// print_r($arResult["arQuestions"][$FIELD_SID]);
				if (is_array($arResult["FORM_ERRORS"]) && array_key_exists($FIELD_SID, $arResult['FORM_ERRORS']))
				{
					echo '<div class="form-group has-error col-xs-12 col-sm-12">';
				}
				else
				{
					echo '<div class="form-group col-xs-12 col-sm-12">';
				}				
				// echo '<label for="form_text_'.$arQuestion['STRUCTURE'][0]['QUESTION_ID'].'">'.$label.'</label>';
				echo '<input type="text" name="form_text_'.$id.'" value="'.$arResult['arrVALUES']['form_text_'.$id].'" class="form-control'.$required.'" placeholder="'.$label.'"'.$required.' />';
				echo '</div>';

				break;

			case 'textarea':
				if (is_array($arResult["FORM_ERRORS"]) && array_key_exists($FIELD_SID, $arResult['FORM_ERRORS']))
				{
					echo '<div class="form-group has-error col-xs-12">';
				}
				else
				{
					echo '<div class="form-group col-xs-12">';
				}
				$rows = $arQuestion['STRUCTURE'][0]['FIELD_HEIGHT'] ?: null;
				// echo '<label for="form_textarea_'.$arQuestion['STRUCTURE'][0]['QUESTION_ID'].'">'.$label.'</label>';
				echo '<textarea name="form_textarea_'.$id.'" value="" class="form-control'.$required.'" placeholder="'.$label.'" rows="'.$rows.'"'.$required.'>'.$arResult['arrVALUES']['form_textarea_'.$id].'</textarea>';
				echo '</div>';
				break;

			case 'dropdown':
				if (is_array($arResult["FORM_ERRORS"]) && array_key_exists($FIELD_SID, $arResult['FORM_ERRORS']))
				{
					echo '<div class="form-group has-error col-sm-6 col-xs-12">';
				}
				else
				{
					echo '<div class="form-group col-sm-6 col-xs-12">';
				}
				// echo '<label for="form_text_'.$arQuestion['STRUCTURE'][0]['QUESTION_ID'].'">'.$label.'</label>';
				echo '<div class="select-wrapper">'.$arQuestion["HTML_CODE"].'</div>';
				echo '</div>';
				break;

			case 'checkbox':
				$requiredAttr = $arQuestion["REQUIRED"] === "Y" ? 'required ' : '';
				$requiredPos = strpos($arQuestion["HTML_CODE"], 'type="checkbox"');
				$htmlOutput = substr_replace($arQuestion["HTML_CODE"], $requiredAttr, $requiredPos, 0);
				$insertStr = $GLOBALS["formCounter"];
				$idPos = strpos($htmlOutput, 'id="') + 4;
				$htmlOutput = substr_replace($htmlOutput, $insertStr, $idPos, 0);
				$forPos = strpos($htmlOutput, 'for="') + 5;
				$htmlOutput = substr_replace($htmlOutput, $insertStr, $forPos, 0);
				break;
			
			default:
				echo '<div class="form-group col-xs-12 mb-20">'.$arQuestion["HTML_CODE"].'</div>';
				break;
		}
	} //endwhile
	?>
<?
if($arResult["isUseCaptcha"] == "Y")
{
?>
	<input type="hidden" name="captcha_sid" value="<?=htmlspecialcharsbx($arResult["CAPTCHACode"]);?>" />
	<img src="/bitrix/tools/captcha.php?captcha_sid=<?=htmlspecialcharsbx($arResult["CAPTCHACode"]);?>" width="180" height="40" />
	<input type="text" name="captcha_word" size="30" maxlength="50" value="" class="inputtext" />
<?
} // isUseCaptcha
?>
	<div class="col-xs-12">
		<div class="checkbox">
			<?=$htmlOutput;?>
		</div>
	</div>
	<div class="col-xs-12">
		<button class="btn" <?=(intval($arResult["F_RIGHT"]) < 10 ? "disabled=\"disabled\"" : "");?> type="submit" name="web_form_submit" value="<?=htmlspecialcharsbx(strlen(trim($arResult["arForm"]["BUTTON"])) <= 0 ? GetMessage("FORM_ADD") : $arResult["arForm"]["BUTTON"]);?>"><span><?=htmlspecialcharsbx(strlen(trim($arResult["arForm"]["BUTTON"])) <= 0 ? GetMessage("FORM_ADD") : $arResult["arForm"]["BUTTON"]);?></span></button>
	</div>
</div>
<?$GLOBALS["formCounter"]++;?>
<?=$arResult["FORM_FOOTER"]?>