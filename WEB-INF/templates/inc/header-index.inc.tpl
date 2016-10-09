<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" >
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
	{assign var=startdata value=$cms->getDirectoryByIndent('startpage')}
	{assign var=startinfo value=$startdata->getPageByIndent('startpage')}
	<title>{if $cms->path[1]}{assign var=parent value=$cms->activeDirectory->getParent()}{assign var=parentas value=$cms->activeDirectory->getParent()}{/if}{if $cms->activePage}{if $cms->activePage->title}{$cms->activePage->title}{else}{$cms->activePage->name} - {if $cms->path[0]->indent == 'tmProduktai'}{if $cms->activePage->autorius != ''}{$cms->activePage->autorius} - {/if}{if $parent->name != $cms->path[0]->name}{$parent->name} {/if}{$cms->activeDirectory->name|lower} {else} {$startinfo->title}{/if}{/if}{elseif $cms->activeDirectory}{if $cms->activeDirectory->title}{$cms->activeDirectory->title}{else}{if $cms->path[0]->indent == 'tmProduktai'}{if $parent->name != $cms->path[0]->name && $cms->path[0]->indent == 'tmProduktai'}{$parent->name} {/if}{$cms->activeDirectory->name|lower}{else}{$cms->activeDirectory->name}{/if}{/if} | {$startinfo->title}{else}{$startinfo->title}{/if}</title>

	<meta name="description" content="{if $cms->activePage}{if $cms->activePage->meta_desc != ''}{$cms->activePage->meta_desc}{else}{if $cms->path[0]->indent == 'tmProduktai'}{if $parent->name != $cms->path[0]->name}{$parent->name} {/if}{$cms->activeDirectory->name|lower} - {$cms->activePage->name}. Marškinėliai pagaminti www.juozukas.lt komandos. {else}{$startinfo->meta_desc}{/if}{/if}{else}{$startinfo->meta_desc}{/if}" >
	<meta name="keywords" content="{if $cms->activePage}{if $cms->activePage->meta_keys != ''}{$cms->activePage->meta_keys}{else}{if $cms->path[0]->indent == 'tmProduktai'}{$cms->activePage->name},{if $cms->activePage->autorius != ''} {$cms->activePage->autorius},{/if} {if $cms->path[0]->indent == 'tmProduktai'}{if $parent->name != $cms->path[0]->name}{$parent->name} {/if}{$cms->activeDirectory->name|lower}{/if}{else}{$startinfo->meta_keys}{/if}{/if}{else}{$startinfo->meta_keys}{/if}" >
	<meta property="fb:admins" content="100001918877846" />
    <meta name="verify-webtopay" content="fdc32efecd213899bf857c576f334f8f">
	<link rel="stylesheet" type="text/css" href="/media/yui/reset/reset.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/media/yui/fonts/fonts.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/media/style.css" media="screen" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	<script type="text/javascript" src="/media/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
  $.noConflict();
  // Code that uses other library's $ can follow here.
	</script>
	<script type="text/javascript" src="/slimbox/js/mootools.js"></script>
	<script type="text/javascript" src="/slimbox/js/slimbox.js"></script>
	<link rel="stylesheet" href="/slimbox/css/slimbox.css" type="text/css" media="screen" />
	<script type="text/javascript" src="http://www.plaxo.com/css/m/js/util.js"></script>
	<script type="text/javascript" src="http://www.plaxo.com/css/m/js/basic.js"></script>
	<script type="text/javascript" src="http://www.plaxo.com/css/m/js/abc_launcher.js"></script>

	{literal}
	<script type="text/javascript"><!--
	function onABCommComplete() {
	  $('recipient_list_div').setStyle('display', 'block');
	}
	//--></script>
	{/literal}
	{if $product}
	<meta property="og:title" content="{$cms->activePage->name}"/>
	{if $cms->activePage->hasImages()}
	{assign var=imagesHd value=$cms->activePage->getImages()}
	<meta property="og:image" content="http://www.juozukas.lt/media/dynamic/img/{$imagesHd.0->page_id}/{$imagesHd.0->page_image_id}_regular_2_{$imagesHd.0->file_name}"/>
	{/if}
	{/if}

<!--  google analytics -->

  {literal}
  <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-547022-5', 'auto');
  ga('send', 'pageview');

  </script>
  {/literal}

<!-- /google analytics -->

</head>
<body>



<div class="all{if $busena} busenosSablonas{/if}" align="center">
	{if $product}
	{if $nderrors || $ndsuccess}
	{literal}
	<script type="text/javascript">
	$('mask').set('class', 'on');
	</script>
	{/literal}
	{/if}
	<div id="nusiusk-draugui" style="position: relative;z-index: 1000000;margin: 0 auto;width: 1020px;{if !$nderrors && !$ndsuccess}display:none;{/if}">
	<div class="nusiusk-draugui">
    	<div><a href="#" id="isismti" class="" style="float: right;"><img src="http://www.juozukas.lt/media/close-violet-.png" onclick="hideForm();return false;"  /></a></div>
        <div>
		<h2>Nusiųsk laišką draugams</h2></div>
		<div class="nd-main">
		{if $nderrors}
		<div class="error">
			<span>Turim problemų siunčiant laišką</span>
			<ul>
			{foreach from=$nderrors item=nderror}
			<li>{$nderror}</li>
			{/foreach}
			</ul>
		</div>
		{/if}
		{if $ndsuccess}
		<div class="error successnd" style="text-align: center !important;">
			<span>Jėga! Tavo laiškai sėkmingai išsiųsti.<br />
			<a href="#" id="nd-atsaukti">uždaryti puslapį</a>
			</span>
			{literal}
			<script type="text/javascript">
			$('nd-atsaukti').addEvent('click', function(event){
				$('nusiusk-draugui').setStyle('display', 'none');
				$('mask').set('class', '');
				event.preventDefault();
			});
			</script>
			{/literal}
		</div>
		{/if}
		<div class="nd-images">
			{if $cms->activePage->hasImages()}
				{assign var=showImage value=true}
				{assign var=images value=$cms->activePage->getImages()}
			{/if}
			{assign var="appImage" value=$cms->activePage->getAppImage('regular')}
			{if $showImage || $appImage}
				<div class="product-image"{if !$images.0} style="background: url('{$appImage}') center center no-repeat;"{elseif $images.0 && !$appImage} style="background: url('/media/dynamic/img/{$images.0->page_id}/{$images.0->page_image_id}_regular_{$images.0->file_name}') center center no-repeat;"{/if}>
				{if $images.0 && $appImage}
				{assign var=zoomImg value="/media/dynamic/img/"|cat:$images.0->page_id|cat:"/"|cat:$images.0->page_image_id|cat:"_zoomed_"|cat:$images.0->file_name}
				<div class="firstImage" style="background: url('{$appImage}') center center no-repeat;"></div>
				<div class="secondImage" style="background: url('/media/dynamic/img/{$images.0->page_id}/{$images.0->page_image_id}_regular_2_{$images.0->file_name}') center center no-repeat;"></div>
				{/if}
				</div>
			{/if}
		</div>
		<form action="{$cms->activeDirectory->full_path}{$cms->activePage->file}" method="post" name="ndforma" id="ndforma">
		<input type="hidden" name="nusiusk-draugui" value="1" />
		<div class="nd-form">

				<div class="inputs-row">
					<input type="text" class="nd-input" name="nd-name" value="{if $ndName}{$ndName}{else}Tavo vardas{/if}"
					onblur="{literal}if (this.value == '') {this.value = 'Tavo vardas';}{/literal}"
					onfocus="{literal}if (this.value == 'Tavo vardas') {this.value = '';}{/literal}" />

					<input type="text" class="nd-input with-friend" name="nd-friend[]" value="{if $ndFriend.0}{$ndFriend.0}{else}Draugo el. pašto adresas{/if}"
					onblur="{literal}if (this.value == '') {this.value = 'Draugo el. pašto adresas';}{/literal}"
					onfocus="{literal}if (this.value == 'Draugo el. pašto adresas') {this.value = '';}{/literal}" />
				</div>
				<div id="addresses-field">
					{foreach from=$ndFriend item=ndfr name=ndfrFor}
					{if $smarty.foreach.ndfrFor.iteration > 1}
					<div class="inputs-row width-more-padd">
					<input type="text" class="nd-input with-friend" name="nd-friend[]" value="{$ndfr}">
					</div>
					{/if}
					{/foreach}
				</div>
				<div class="links-row">
					+ <a href="#" id="prideti-dar-viena">Pridėti dar vieną adresą</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="showPlaxoABChooser('recipient_list', '/plaxo.html'); return false">Importuoti adresus</a>
				</div>
				<div class="inputs-row" id="recipient_list_div" {if $ndRecipients == ''}style="display:none;"{/if}>
				<textarea id="recipient_list" name="recipients">{if $ndRecipients}{$ndRecipients}{/if}</textarea>
				</div>
				<div class="inputs-row">
				{if $cms->activePage->product_type == 'Džemperis'}
				<textarea name="nd-text">{if $ndText}{$ndText}{else}Mielas bičiuli,
Pažiūrėk kokie šaunus džemperiai.{/if}</textarea>
				{else}
				<textarea name="nd-text">{if $ndText}{$ndText}{else}Mielas bičiuli,
Pažiūrėk kokie šaunūs marškinėliai.{/if}</textarea>
				{/if}
				</div>
				<div class="nd-sepas"></div>
				<div class="recaptcha">
					<p>Įrašykite matomus žodžius palikdami tarpą tarp jų.</p>
					<div style="clear:left;"></div>
					{literal}
					<script type="text/javascript">
					 var RecaptchaOptions = {
					    theme : 'custom'
					 };
					 </script>
					{/literal}
					<div id="recaptcha_image"></div>
					<input type="text" class="nd-input" id="recaptcha_response_field" name="recaptcha_response_field" value="" />
					{php}
					/* private key 6LfIeb4SAAAAAMMSaDWQCOkPwi6odiIggoFq7DBL */
					/* public key 6LfIeb4SAAAAAPdYwGcVK_benln7duFKhfdsTkON */
					  require_once('recaptcha/recaptchalib.php');
					  $publickey = "6LfIeb4SAAAAAPdYwGcVK_benln7duFKhfdsTkON "; // you got this from the signup page
					  echo recaptcha_get_html($publickey);
					{/php}
				</div>
				<div style="clear:left;"></div>
		</div>


		<div class="nd-buttons">
			<a onmouseover="this.className='ok-button ok-button-on'" onmouseout="this.className='ok-button'"  class="ok-button" href="javascript:document.ndforma.submit();"><span>siųsti</span></a>
		</div>

		</form>

		</div>
	</div>
	</div>
	{literal}
	<script type="text/javascript">
	$('isismti').addEvent('click', function(event){
		$('nusiusk-draugui').setStyle('display', 'none');
		$('mask').set('class', '');
	    	event.preventDefault();
	});
	$('prideti-dar-viena').addEvent('click', function(event){
		var insideElement = new Element('div', {'class': 'inputs-row width-more-padd'});
		var insideInput = new Element('input', {'type': 'text', 'class': 'nd-input with-friend', 'name': 'nd-friend[]', 'value': ''});
		insideElement.grab(insideInput);
		$('addresses-field').grab(insideElement);
		event.preventDefault();
	});
	</script>
	{/literal}
	{/if}

    <!--registracija ir prisijungimas-->
    <!--end registracija ir prisijungimas-->

	<div class="wrapper">

	<!-- header -->
	<div class="header">
		<span class="logo"><a href="http://www.juozukas.lt/index.php">juozukas.lt - pradinis puslapis</a></span>
		<div class="headerBasket">
			<table>
				<tr>
					<td valign="top">
						<a href="/lt/uzsakymas/" class="basket-amount">{$totalBasketItems}</a>
					</td>
				</tr>
			</table>
		</div>
		{literal}
		<script type="text/javascript">
			function showMenuItem(id, mid){
				if(document.getElementById(id) && document.getElementById(mid)){
					document.getElementById(id).className = "headerMenuOn";
					if(mid == 'toplinklast'){
						document.getElementById(mid).className = "toplink no-right hoveris";
					}else{
						document.getElementById(mid).className = "toplink hoveris";
					}
				}
				var rps = document.getElementById('rusiuoti-pagal-stiliu');
				if(rps) rps.style.zIndex = -1;
				var rpd = document.getElementById('rusiuoti-pagal-dydi');
				if(rpd) rpd.style.zIndex = -1;
			}
			function hideMenuItem(id, mid){
				if(document.getElementById(id) && document.getElementById(mid)){
					document.getElementById(id).className = "headerMenuOff";
					if(mid == 'toplinklast'){
						document.getElementById(mid).className = "toplink no-right";
					}else{
						document.getElementById(mid).className = "toplink";
					}
				}
				var rps = document.getElementById('rusiuoti-pagal-stiliu');
				if(rps) rps.style.zIndex = 1;
				var rpd = document.getElementById('rusiuoti-pagal-dydi');
				if(rpd) rpd.style.zIndex = 1;
			}
			function updateFormSubmit(size,forma){
				//if(document.getElementById(id) && document.getElementById(mid)){
					document.forms[forma].subSize.value = size;
					document.forms[forma].submit();
				//}
			}
		</script>
		{/literal}
		<ul id="topNavi">
			{assign var=topList value=$cms->getTopLevel(null, false, "indent IN ('tmProduktai')")}
			{foreach from=$topList.0->getChildDirectories() key=k item='topDirItem'}
			<li>
			<span class="toplink" id="toplink{$k}"><a href="{$topDirItem->full_path}" onmouseover="showMenuItem('menu_{$k}', 'toplink{$k}');" onmouseout="hideMenuItem('menu_{$k}', 'toplink{$k}');">{$topDirItem->name}</a></span>
			{if $topDirItem->hasChildDirectories()}
			{assign var=subTopDir value=$topDirItem->getChildDirectories()}
			<div id="menu_{$k}" class="headerMenuOff" onmouseover="showMenuItem('menu_{$k}', 'toplink{$k}');" onmouseout="hideMenuItem('menu_{$k}', 'toplink{$k}');">
			{foreach from=$subTopDir item=subDirItem}
				<a href="{$subDirItem->full_path}">{$subDirItem->name}</a>
			{/foreach}
			{assign var=sizeList value=$topDirItem->getSizeAllPages()}
			{if $sizeList|@count gt 0}
			<div class="pagal-dydy">
				Rūšiuoti pagal dydį:<span style="font: bold tahoma;">
				{foreach from=$sizeList item=size}
				<a href="{literal}javascript:updateFormSubmit('{/literal}{$size->dydis}','form_{$topDirItem->directory_id}{literal}');{/literal}">{$size->dydis}</a>
				{/foreach}
				<form action="{$topDirItem->full_path}" method="post" name="form_{$topDirItem->directory_id}">
					<input type="hidden" name="subSize" value="">
				</form></span>
			</div>
			{/if}
			{assign var=pasidaryk value=$cms->getDirectoryByIndent('pasidaryk-marskinelius')}
			{assign var=pasidarykPage value=$pasidaryk->getPageByIndent('pasidaryk-marskinelius')}
			{assign var=informacija value=$cms->getDirectoryByIndent('informacija')}
			{assign var=informacijaPage value=$informacija->getPageByIndent('dovanu-kuponas')}
			<div class="add-links" style="padding:0px;">
				{if $pasidaryk->is_visible == 'T' && $pasidaryk->is_hidden == 'F'}
				{if $pasidarykPage->is_visible == 'T' && $pasidarykPage->is_hidden == 'F'}
				<a href="{$pasidaryk->full_path}{$pasidarykPage->file}">{$pasidarykPage->name}</a>
				{/if}
				{/if}
				{*if $informacija->is_visible == 'T' && $informacija->is_hidden == 'F'}
				{if $informacijaPage->is_visible == 'T' && $informacijaPage->is_hidden == 'F'}
				<a href="{$informacija->full_path}{$informacijaPage->file}">{$informacijaPage->name}</a>
				{/if}
				{/if*}
			</div>
			<div class="menu-box-bottom"></div>
			</div>
			{/if}
			</li>
			{/foreach}
			{assign var=help value=$cms->getTopLevel(null, true, "indent IN ('pagalba')")}
			{*assign var=subTopDir value=$help.0->getChildDirectories()*}
			<li>
			<span class="toplink no-right" id='toplinklast'><a href="{*if $subTopDir.0}{$subTopDir.0->full_path}{else*}{$help.0->full_path}{*/if*}" onmouseover="showMenuItem('menu_last', 'toplinklast');" onmouseout="hideMenuItem('menu_last', 'toplinklast');">{$help.0->name}</a></span>
			{if $help.0->hasChildDirectories()}
			<div id="menu_last" class="headerMenuOff" onmouseover="showMenuItem('menu_last', 'toplinklast');" onmouseout="hideMenuItem('menu_last', 'toplinklast');">
			{foreach from=$help.0->getChildDirectories() item=subDirItem}
				<a href="{$subDirItem->full_path}">{$subDirItem->name}</a>
			{/foreach}
			{assign var=contacts value=$cms->getTopLevel(null, true, "indent IN ('tmKontaktai')")}
			{if $contacts.0}
				<a href="{$contacts.0->full_path}">{$contacts.0->name}</a>
			{/if}
			<a href="{$help.0->full_path}">DUK</a>
			</div>
			{/if}
			</li>
		</ul>

	</div>
	<!-- /header -->




	{if $startPage == 1}
		{if $startinfo->start_tpl == 'default'}
		{assign var=startTop value=$cms->getStartTop()}
		{foreach from=$startTop->getList() item=startTopItem name="startTopFor"}
			{assign var=kelias value=$startTopItem->getFullPath()}
			{assign var=images value=$startTopItem->getImages()}
			{assign var=isTopImage value='T'}
			<div class="start-head-image" onclick="window.location='{$kelias->full_path}'" style="background: url('/media/dynamic/img/{$images[1]->page_id}/{$images[1]->page_image_id}_zoomed_{$images[1]->file_name}') center center no-repeat;">
				<div class="basket-bottom"></div>
				<div class="start-head-content">
					<div class="price">{$startTopItem->kaina}<span class="currency">LTL</span></div>
				</div>
				<div class="start-phrase"><p>“{$startTopItem->name}”</p><p class="phrase-author">{$startTopItem->autorius}</p></div>
				{*<div class="start-pages">
					<a href="">1</a>
					<a class="on" href="">2</a>
					<a href="">3</a>
				</div>*}
			</div>
		{/foreach}
		{else}
		{**php}
		if($_SERVER['REMOTE_ADDR'] == '88.222.88.46'){//87.247.65.7
		{/php**}
		{assign var=startTop value=$cms->getStartTop(3)}
		{if $startTop->rowList|@count > 0}
		{/if}
		{**php}
		}
		{/php**}
		{/if}

	{/if}
	<!--  start page image -->
	<div class="content content-inside"{if $isTopImage} style="background: none;"{/if}>
	{if $basketnotice && $cms->activePage->template_id != 'product' && $cms->activeDirectory->indent != 'uzsakymas'}
		<div class="to-basket-notice" id="bakset-notice">
			<div class="to-basket-notice-padd">
			<div class="to-basket-notice-text">{cms_translate}{$basketnotice}{/cms_translate}</div>
			{if $cms->activeDirectory->indent != 'uzsakymas'}
			<div class="to-basket-notice-prod-name">{$basketnotice_prod.name}</div>
			<div class="to-basket-notice-prod-size">{$basketnotice_prod.dydis_name} Dydis</div>
				<div class="to-basket-notice-prod-aaa">
				<table align="center"><tr><td align="right" class="left-notice-td">
				<a href="/lt/uzsakymas/" class="notice-uzsisakyti">Pirkinių krepšelis</a>
				</td><td align="left" class="right-notice-td">
				<a href="#" class="notice-testi" onClick="document.getElementById('bakset-notice').className = 'to-basket-notice-hidden';return false;">Pažiūrėti kitus</a>
				</td></tr></table>
				</div>
			{/if}
			</div>
		</div>

		<div style="clear:left;"></div>
	{/if}
