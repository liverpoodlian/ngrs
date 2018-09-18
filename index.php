<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Главная");
?>
<section id="main" class="section section--main">
	<h1 class="h1">NGRS – поиск и привлечение талантов</h1>
	<p class="paragraph">Next Generation Recruitment Services <br>Мы помогаем бизнесу расти</p>
</section>
<section id="about" class="section section--about">
	<div class="section__text">
		<h2 class="h2">Мы</h2>
		<p class="paragraph paragraph--italic">Сочетаем глубокую экспертизу c умением слушать, слышать и понимать ваши бизнес-задачи</p>
	</div>
	<div class="section__description">
		<div class="about">
			<div class="about__item">
				<p class="about__count">10+</p>
				<p class="about__text">лет на рынке</p>
			</div>
			<div class="about__item">
				<p class="about__count">2000+</p>
				<p class="about__text">нанятых кандидатов <br>для 100+ клиентов</p>
			</div>
			<div class="about__item">
				<p class="about__count">90%</p>
				<p class="about__text">наших проектов в ИТ/Tech/Digital – <br>мы специализируемся на самом <br>сложном и динамичном рынке</p>
			</div>
		</div>
	</div>
</section>
<div class="video-top">
	<video playsinline autoplay muted loop class="light-paints">
		<source src="/video/paint-light.mp4" type="video/mp4">
	</video>
	<img class="video-top__img" src="/images/logo.png">
</div>
<div class="dots-bg">
	<section id="services" class="section section--services">
		<div class="section__text">
			<h2 class="h2">Наши сервисы</h2>
		</div>
		<div class="section__description">
			<div class="services">
				<div class="services__item">
					<h3 class="services__title">RPO</h3>
					<div class="services__text">
						<p class="paragraph">Аутсорсинг подбора персонала</p>
						<p class="paragraph">Мы становимся частью бизнес-команды заказчика, управляем процессом поиска и найма изнутри</p>
					</div>
				</div>
				<div class="services__item">
					<h3 class="services__title">Executive search</h3>
					<div class="services__text">
						<p class="paragraph">Подбор высшего менеджмента</p>
						<p class="paragraph">Мы предоставляем заказчику информацию о всех имеющихся кандидатах на рынке, выбираем и привлекаем лучших</p>
					</div>
				</div>
				<div class="services__item">
					<h3 class="services__title">Международные <br>проекты</h3>
					<div class="services__text">
						<p class="paragraph">Мы помогаем международным компаниям находить лучших профессионалов из России и нанимаем команды в других странах для российских компаний</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="section section--who">
		<div class="section__text">
			<h2 class="h2">Кого мы ищем</h2>
		</div>
		<div class="section__description">
			<img src="/images/stack.png">
		</div>
	</section>
</div>
<section class="section section--where">
	<div class="section__text">
		<h2 class="h2">Где</h2>
		<p class="paragraph paragraph--italic">Мы имеем <br>представительства <br>в Европе, США и Азии <br>и хорошо понимаем специфику международных проектов</p>
	</div>
	<div class="section__description">
		<img src="/images/map.png">
	</div>
</section>
<div class="clouds-bg">
	<section class="section section--projects">
		<div class="section__text">
			<h2 class="h2">Наши <br>проекты</h2>
			<p class="paragraph paragraph--italic">мы наняли 2000+ сотрудников для более чем 100 клиентов</p>
		</div>
		<div class="section__description">
			<?$APPLICATION->IncludeComponent(
				"bitrix:news.list",
				"projects-ru",
				Array(
					"ACTIVE_DATE_FORMAT" => "d.m.Y",
					"ADD_SECTIONS_CHAIN" => "N",
					"AJAX_MODE" => "N",
					"AJAX_OPTION_ADDITIONAL" => "",
					"AJAX_OPTION_HISTORY" => "N",
					"AJAX_OPTION_JUMP" => "N",
					"AJAX_OPTION_STYLE" => "Y",
					"CACHE_FILTER" => "N",
					"CACHE_GROUPS" => "Y",
					"CACHE_TIME" => "36000000",
					"CACHE_TYPE" => "N",
					"CHECK_DATES" => "Y",
					"DETAIL_URL" => "",
					"DISPLAY_BOTTOM_PAGER" => "N",
					"DISPLAY_DATE" => "Y",
					"DISPLAY_NAME" => "Y",
					"DISPLAY_PICTURE" => "Y",
					"DISPLAY_PREVIEW_TEXT" => "Y",
					"DISPLAY_TOP_PAGER" => "N",
					"FIELD_CODE" => array("", "ID", "CODE", "XML_ID", "NAME", "TAGS", "SORT", "PREVIEW_TEXT", "PREVIEW_PICTURE", "DETAIL_TEXT", "DETAIL_PICTURE", "DATE_ACTIVE_FROM", "ACTIVE_FROM", "DATE_ACTIVE_TO", "ACTIVE_TO", "SHOW_COUNTER", "SHOW_COUNTER_START", "IBLOCK_TYPE_ID", "IBLOCK_ID", "IBLOCK_CODE", "IBLOCK_NAME", "IBLOCK_EXTERNAL_ID", "DATE_CREATE", "CREATED_BY", "CREATED_USER_NAME", "TIMESTAMP_X", "MODIFIED_BY", "USER_NAME", ""),
					"FILTER_NAME" => "",
					"HIDE_LINK_WHEN_NO_DETAIL" => "N",
					"IBLOCK_ID" => "projects",
					"IBLOCK_TYPE" => "services",
					"INCLUDE_IBLOCK_INTO_CHAIN" => "N",
					"INCLUDE_SUBSECTIONS" => "Y",
					"MESSAGE_404" => "",
					"NEWS_COUNT" => "1000",
					"PAGER_BASE_LINK_ENABLE" => "N",
					"PAGER_DESC_NUMBERING" => "N",
					"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",
					"PAGER_SHOW_ALL" => "N",
					"PAGER_SHOW_ALWAYS" => "N",
					"PAGER_TEMPLATE" => ".default",
					"PAGER_TITLE" => "Новости",
					"PARENT_SECTION" => "",
					"PARENT_SECTION_CODE" => "",
					"PREVIEW_TRUNCATE_LEN" => "",
					"PROPERTY_CODE" => array("*"),
					"SET_BROWSER_TITLE" => "N",
					"SET_LAST_MODIFIED" => "N",
					"SET_META_DESCRIPTION" => "N",
					"SET_META_KEYWORDS" => "N",
					"SET_STATUS_404" => "N",
					"SET_TITLE" => "N",
					"SHOW_404" => "N",
					"SORT_BY1" => "ACTIVE_FROM",
					"SORT_BY2" => "SORT",
					"SORT_ORDER1" => "DESC",
					"SORT_ORDER2" => "ASC"
				)
			);?>
			<p class="paragraph">От 100, до 500 сотрудников (число нанятых сотрудников)</p>
		</div>
	</section>
</div>
<div class="lines-bg">
	<section class="section section--reviews">
		<h2 class="h2">О нас <br>говорят</h2>
		<?$APPLICATION->IncludeComponent(
			"bitrix:news.list",
			"reviews-ru",
			Array(
				"ACTIVE_DATE_FORMAT" => "d.m.Y",
				"ADD_SECTIONS_CHAIN" => "N",
				"AJAX_MODE" => "N",
				"AJAX_OPTION_ADDITIONAL" => "",
				"AJAX_OPTION_HISTORY" => "N",
				"AJAX_OPTION_JUMP" => "N",
				"AJAX_OPTION_STYLE" => "Y",
				"CACHE_FILTER" => "N",
				"CACHE_GROUPS" => "Y",
				"CACHE_TIME" => "36000000",
				"CACHE_TYPE" => "N",
				"CHECK_DATES" => "Y",
				"DETAIL_URL" => "",
				"DISPLAY_BOTTOM_PAGER" => "N",
				"DISPLAY_DATE" => "Y",
				"DISPLAY_NAME" => "Y",
				"DISPLAY_PICTURE" => "Y",
				"DISPLAY_PREVIEW_TEXT" => "Y",
				"DISPLAY_TOP_PAGER" => "N",
				"FIELD_CODE" => array("", "ID", "CODE", "XML_ID", "NAME", "TAGS", "SORT", "PREVIEW_TEXT", "PREVIEW_PICTURE", "DETAIL_TEXT", "DETAIL_PICTURE", "DATE_ACTIVE_FROM", "ACTIVE_FROM", "DATE_ACTIVE_TO", "ACTIVE_TO", "SHOW_COUNTER", "SHOW_COUNTER_START", "IBLOCK_TYPE_ID", "IBLOCK_ID", "IBLOCK_CODE", "IBLOCK_NAME", "IBLOCK_EXTERNAL_ID", "DATE_CREATE", "CREATED_BY", "CREATED_USER_NAME", "TIMESTAMP_X", "MODIFIED_BY", "USER_NAME", ""),
				"FILTER_NAME" => "",
				"HIDE_LINK_WHEN_NO_DETAIL" => "N",
				"IBLOCK_ID" => "reviews",
				"IBLOCK_TYPE" => "services",
				"INCLUDE_IBLOCK_INTO_CHAIN" => "N",
				"INCLUDE_SUBSECTIONS" => "Y",
				"MESSAGE_404" => "",
				"NEWS_COUNT" => "50",
				"PAGER_BASE_LINK_ENABLE" => "N",
				"PAGER_DESC_NUMBERING" => "N",
				"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",
				"PAGER_SHOW_ALL" => "N",
				"PAGER_SHOW_ALWAYS" => "N",
				"PAGER_TEMPLATE" => ".default",
				"PAGER_TITLE" => "Новости",
				"PARENT_SECTION" => "",
				"PARENT_SECTION_CODE" => "",
				"PREVIEW_TRUNCATE_LEN" => "",
				"PROPERTY_CODE" => array("*"),
				"SET_BROWSER_TITLE" => "N",
				"SET_LAST_MODIFIED" => "N",
				"SET_META_DESCRIPTION" => "N",
				"SET_META_KEYWORDS" => "N",
				"SET_STATUS_404" => "N",
				"SET_TITLE" => "N",
				"SHOW_404" => "N",
				"SORT_BY1" => "ACTIVE_FROM",
				"SORT_BY2" => "SORT",
				"SORT_ORDER1" => "DESC",
				"SORT_ORDER2" => "ASC"
			)
		);?>
	</section>
</div>
<section id="contacts" class="section section--contacts">
	<div class="section__text">
		<h2 class="h2">Получить консультацию по нашим сервисам</h2>
		<div class="socials">
			<a href="" target="_blank" class="socials__item socials__item--linkedin"></a>
			<a href="" target="_blank" class="socials__item socials__item--instagram"></a>
			<a href="" target="_blank" class="socials__item socials__item--facebook"></a>
		</div>
		<div class="contacts-mobile">
			<a class="contact-phone" href="tel:+74956467075">+7 (495) 646-70-75</a>
			<a class="contact-email" href="mailto:contacts@ngrs.com">contacts@ngrs.com</a>
		</div>
		<p class="copyright">2018 © NGRS – все права защищены</p>
	</div>
	<div class="section__description">
		<a class="contact-phone" href="tel:+74956467075">+7 (495) 646-70-75</a>
		<a class="contact-email" href="mailto:contacts@ngrs.com">contacts@ngrs.com</a>
	</div>
</section>
<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>