		</div>
		<div class="push"></div>
	</div>
	<div class="footer">
{literal}
<script>
function showForm(){
	document.getElementById('mask').className="on";
	document.getElementById('zoom').className="popup zoom on";
}
function hideForm(){
	document.getElementById('mask').className="";
	document.getElementById('zoom').className="popup zoom";
}
</script>
{/literal}
		<div class="footer-inside">
			<div class="fb-big-block">
				<div class="fb-big-text">
					Mes mylim Jus! Mūsų gerbėjams Facebook'e turime ypatingų pasiūlymų!
				</div>
				<div class="fb-big-like">
					<iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fpages%2Fjuozukaslt%2F171529272861696&amp;locale=lt_LT&amp;width=225&amp;colorscheme=light&amp;connections=0&amp;stream=false&amp;header=false&amp;height=60" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:225px; height:60px;" allowTransparency="true"></iframe>
				</div>
				<div style="clear: left;"></div>
			</div>
			<table>
			<tr>
				<td valign="top" align="left">
					<div class="with-sep">
						<div class="naujienlaiskis-block">
							<h2>Naujienlaiškis</h2>
							<form method="post" action="/lt/naujienlaiskis/naujienu-prenumerata.html" class="form-style" name="naujienos">
							<input type="hidden" name="cmp_action" value="subscribe" />
							<input class="news-input" type="text" name="data[email]" value="Jūsų el. paštas"
									onfocus="{literal}if (this.value == 'Jūsų el. paštas') { this.value = '';}{/literal}"
									onblur="{literal}if (this.value == '') { this.value = 'Jūsų el. paštas';}{/literal}" />
								<a onmouseover="this.className='mygtukas-ok mygtukas-ok-on'" onmouseout="this.className='mygtukas-ok'"  class="mygtukas-ok" href="javascript:document.naujienos.submit();"><span>Gerai</span></a>
							</form>
						</div>
					</div>
				</td>
				<td valign="top" align="left">
					<div class="with-sep">
						<div class="help-block">
							<h2>Pagalba</h2>
							<span class="mail-for-me"><a href="mailto:komanda@juozukas.lt">komanda@juozukas.lt</a></span>

						</div>
					</div>
				</td>
				<td valign="top" align="left">
					<div class="with-sep">
						<div class="help-block">
						<h2>Turite idėjų ?</h2>
						<p style="width:280px; margin:15px;">Mums svarbi jūsų nuomonė, idėjos, patarimai, pastabos. <a href="javascript:showForm();">Parašykite mums</a></p>
						</div>
					</div>
				</td>
			</tr>
			</table>

			<div class="footer-links">
			{assign var=bottomList value=$cms->getTopLevel(null, true, "indent NOT IN ('informacija', 'uzsakymas', 'naujienos','startpage', 'naujienlaiskis') AND is_hidden = 'F' AND is_visible = 'T'")}
			{foreach from=$bottomList item='bottomDirItem' name="bottomLinks"}
				{if $bottomDirItem->indent == 'tmProduktai'}
					{foreach from=$bottomDirItem->getChildDirectories(null, true, false, "is_hidden = 'F' AND is_visible = 'T'") item=prodItems}
						<a {if $cms->activeDirectory->directory_id == $prodItems->directory_id}class="on"{/if} href="{$prodItems->full_path}">{$prodItems->title}</a>{if !$smarty.foreach.bottomLinks.last}<span class="bottom-links-split"></span>{/if}
					{/foreach}
				{else}
				{if $bottomDirItem->indent != 'atsiliepimai'}
				<a href="{$bottomDirItem->full_path}">{$bottomDirItem->name}</a>{if !$smarty.foreach.bottomLinks.last}<span class="bottom-links-split"></span>{/if}
				{/if}
				{/if}
			{/foreach}
			</div>
			<div class="footer-rss-links">
				<span style="padding-right: 10px;"><a href="/rss/nauji-marskineliai.php" target="_blank">Nauji marškinėliai</a></span>
				<span><a href="/rss/naujienos.php" target="_blank">{cms_translate}naujienos{/cms_translate}</a></span>
			</div>
		</div>
		<div class="footer-bottom">
			nuo 2008 metų www.juozukas.lt - gamina ir kuria linksmus ir šmaikščius marškinėlius. Visos teisės aplikacijoms priklauso jų autoriams.
			<span>design touch by vidas&nbsp;&nbsp;&nbsp;programavo: <a href="http://www.deform.lt" title="Interneto svetainių kūrimas" target="_blank"><img src="/media/deform.gif" alt="Deform"></a></span>
		</div>
	</div>
</div>


<div id="mask" class="{if $commentStatus || $commentsErrors}on{/if}"></div>
{if $nderrors || $ndsuccess}
{literal}
<script type="text/javascript">
$('mask').set('class', 'on');
</script>
{/literal}
{/if}
<div id="zoom" class="popup zoom{if $commentStatus || $commentsErrors} on{/if}">
<form action="{$cms->activeDirectory->full_path}" method="post" name="pasleptaForma">
	<h2>Palikite atsiliepimą</h2>
	{if $commentStatus}
	<div class="error" style="width: 310px;margin: 5px 0px 5px 0px;">Atsiliepimas nusiųstas.</div>
	<input type="submit" class="x-button" style="" value="" onclick="hideForm();return false;" />
	{else}
	<input type="hidden" name="cmp_action" value="newComment">
	{if $commentsErrors}
	<div class="error" style="width: 310px;margin: 5px 0px 5px 0px;">
	{foreach from=$commentsErrors item=error}
	<p>{$error}</p>
	{/foreach}
	</div>
	{/if}

	<div class="text-input-block">
		<div>Vardas</div>
		<input class="half-input{if $commentsErrors.name} bloody-input{/if}" name="data[name]" id="cfname" type="text"{if $commentsData.name} value="{$commentsData.name}"{/if} />
	</div>
	<div class="text-input-block">
		<div>El. pašto adresas</div>
		<input class="long-input{if $commentsErrors.email} bloody-input{/if}" name="data[email]" id="cfname" type="text"{if $commentsData.email} value="{$commentsData.email}"{/if} />
	</div>
	<div class="text-input-block">
		<div>Atsiliepimas</div>
		<textarea name="data[comment]"{if $commentsErrors.comment} class="bloody-input"{/if}>{if $commentsData.comment}{$commentsData.comment}{/if}</textarea>
	</div>
	{*<div class="text-input-block nofloat paddbottom5">
		<div style="padding: 0px 0px 5px 0px;"><img src="/securimage/securimage_show.php?sid={php} echo md5(uniqid(time())); {/php}" id="image" align="absmiddle" /></div>
		<input class="small-input" type="text" name="code" /><br />
	</div>*}
	<a onClick="document.forms['pasleptaForma'].submit();" onmouseover="this.className='ok-button header-uzsak-on'" onmouseout="this.className='ok-button header-uzsak'" class="ok-button header-uzsak" href="#"><span>Siųsti</span></a>
	<input type="submit" class="x-button" style="width: 18px;position:absolute;top:3px;right:5px;border:none;" value="X" onclick="hideForm();return false;" />
	{/if}
</form>
</div>

<!--

	cia prasideda issokantis langas deti i krepseli redaguota 2015.05.28

 -->
{if $basketnotice && $cms->activePage->template_id == 'product'}
{literal}
<script type="text/javascript">
jQuery(document).ready(function($) {
	$('#mask').addClass('on');
	$("#close-nt").click(function(e){
		e.preventDefault();
		$("#bakset-notice").addClass('to-basket-notice-hidden');
		$("#mask").removeClass('on');
	});
	$("#mask-psl").click(function(e){e.preventDefault();$("#close-nt").trigger('click');});
});
</script>
{/literal}


<div class="to-basket-notice popupnotice" id="bakset-notice">
		<div class="to-basket-notice-head">
			<div class="main-head-text">
				<h2>{cms_translate}{$basketnotice}{/cms_translate}</h2>
			</div>
			<div class="head-x">
				<a id="close-nt" href="#" style="padding-top:0;">
					<img src="http://www.juozukas.lt/media/head-x.png" alt="Uždaryti" align="top">
				</a>
			</div>
		</div>


		{if $cms->activeDirectory->indent != 'uzsakymas'}
		<div class="nt-preke-info">
			{if $cms->activePage->hasImages()}
				{assign var=images value=$cms->activePage->getImages()}
			{/if}
			{assign var="appImage" value=$cms->activePage->getAppImage('thumb')}
			{if $images.0}
			<div class="nt-image"><img src="/media/dynamic/img/{$images.0->page_id}/{$images.0->page_image_id}_thumb_{$images.0->file_name}"/></div>
			{else}
			<div class="nt-image"><img src="{$appImage}"/></div>
			{/if}
			<div class="nt-info">
				<div class="nt-name">{$basketnotice_prod.name}</div>
				<div class="nt-dydis">Dydis <strong>{$basketnotice_prod.dydis_name}</strong></div>
				{if $cms->activePage->art_nr != ""}<div class="nt-artikulas">Artikulas <strong>{$cms->activePage->art_nr}</strong></div>{/if}
				{if $cms->activePage->spalva != ""}<div class="nt-spalva">Spalva <strong>{$cms->activePage->spalva}</strong></div>{/if}
			</div>

			<div class="nt-kaina">
			{$cms->activePage->kaina} <span class="eurai">&euro;</span>
			</div>
			<div class="clear"></div>
		</div>
		<div class="nt-preke-next">
			<a class="go-order" href="/lt/uzsakymas/">Atidaryti prekių krepšelį</a>
			<a class="stay-here" id="mask-psl" href="#">Pasirinkti dar kelis marškinėlius</a>
			<div class="clear"></div>
		</div>
		{/if}

</div>
{/if}

</body>
</html>
