{if !$cms->editMode}{include file="inc/header.inc.tpl" product=1}{/if}
{literal}
<SCRIPT LANGUAGE="JavaScript">
function popUp(URL) {
window.open(URL, 'window', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,width=700,height=600,left = 200,top = 75');
}
</script>
{/literal}
	
	{if !$cms->editMode}
	
	{if $cms->activePage->is_hidden == 'F'}
		{*assign var=curdir value=$cms->activeDirectory->getChildPages(null, false, false, null, true)*}
		{assign var=curdir value=$cms->activeDirectory->getDirectoryAllPages(null,null, '1')}
		{assign var=curdir value=$curdir->getList()}
		{foreach from=$curdir key=k item=linkPg}
			{if $linkPg->page_id == $cms->activePage->page_id}
				{assign var=lPoint value=$k-1}
				{assign var=nPoint value=$k+1}
				{assign var=prevLink value=$curdir.$lPoint}
				{assign var=nextLink value=$curdir.$nPoint}
			{/if}
		{/foreach}
	{/if}
	
	<table>
	
    <tr><!--prekes pavadinimas ir autorius-->
    <td colspan="2">
    	<div class="list-header">
		<h1>{$cms->activePage->name}</h1>
		<span class="author">{if $cms->activePage->autorius != ""}autorius {$cms->activePage->autorius}{/if}</span>
		{if is_object($prevLink) || is_object($nextLink)}
					<div class="prod-navi">
						<table>
							<tr>
								<td align="left">
									{if is_object($prevLink)}
										<a class="prev-link" href="{$cms->activeDirectory->full_path}{$prevLink->file}">&larr;&nbsp;ankstesnis kataloge</a>
									{/if}
								</td>
								<td>
									<div class="links-spliter"></div>
								</td>
								<td align="right">
									{if is_object($nextLink)}
										<a class="next-link" href="{$cms->activeDirectory->full_path}{$nextLink->file}">sekantis kataloge&nbsp;&rarr;</a>
									{/if}
								</td>
							</tr>
						</table>
					</div>
			{/if}
        	<div style="clear:both;"></div>
    	</div>
    </td>
    </tr>
    
        
	<tr>
		<td valign="top" class="product-left">
			
			{if $cms->activePage->hasImages()}
				{assign var=showImage value=true}
				{assign var=images value=$cms->activePage->getImages()}
			{/if}
			{assign var="appImage" value=$cms->activePage->getAppImage('regular')}
			{if $showImage || $appImage}
				<div class="product-image" {if !$images.0} style="background: url('{$appImage}') center center no-repeat;"{elseif $images.0 && !$appImage} style="background: url('/media/dynamic/img/{$images.0->page_id}/{$images.0->page_image_id}_regular_{$images.0->file_name}') center center no-repeat;"{/if} >
				{if $images.0 && $appImage}
				{assign var=zoomImg value="/media/dynamic/img/"|cat:$images.0->page_id|cat:"/"|cat:$images.0->page_image_id|cat:"_zoomed_"|cat:$images.0->file_name}
				{*if file_exists($zoomImg)*}
				<a href="{$zoomImg}" rel="lightbox" title="{$cms->activePage->name}">
				{*/if*}
				<div class="firstImage" style="background: url('{$appImage}') center center no-repeat;"></div>
				<div class="secondImage" style="background: url('/media/dynamic/img/{$images.0->page_id}/{$images.0->page_image_id}_regular_2_{$images.0->file_name}') center center no-repeat;"></div>
				{*if file_exists($zoomImg)*}
				<div class="zoom-ico"></div>
					</a>
				{*/if*}
				
				{/if}
				</div>
			{/if}
	
    
			<div class="fb-block">
				<div class="patinka-text">Pasidalink su draugais:</div>
				<div class="send-by-email"><a href="#" id="nd-nusiusti" alt="Nusiųsk draugui laišką"></a></div>
				{literal}
				<script type="text/javascript">
				$('nd-nusiusti').addEvent('click', function(event){
					$('nusiusk-draugui').setStyle('display', 'block');
					$('mask').set('class', 'on');
					event.preventDefault(); 
				});
				</script>
				{/literal}
				<div class="main-fb">
                 <ul>
                 <li style="float: left;">
				 <div class="g-plusone" data-size="medium"></div>
 
				{literal}<script type="text/javascript">
					window.___gcfg = {lang: 'lt'};

					(function() {
					var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
					po.src = 'https://apis.google.com/js/plusone.js';
					var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
					})();
					</script>{/literal}
				</li>
                <li style="float: right; padding-left: 10px;">                
				<iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.juozukas.lt{$cms->activeDirectory->full_path}{$cms->activePage->file}&amp;locale=lt_LT&amp;layout=button_count&amp;show_faces=false&amp;width=90&amp;action=like&amp;font=arial&amp;colorscheme=light&amp;height=20" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:90px; height:20px;" allowTransparency="true"></iframe>				
                </li>
                </ul>
				</div>
				<div style="clear:both"></div>
			</div>
	
	
			{if $cms->activePage->is_hidden == 'F'}
			{assign var=mainArr value=$cms->activePage->getAplicationRelatedItems()}
			<div class="product-others">
			{foreach from=$mainArr->rowList item=arrItem}
				{if $arrItem->totalPages > 0}
				{assign var=parent value=$arrItem->getParent()}
				<h2>{$parent->name} <span style="text-transform:lowercase;">{$arrItem->name}</span></h2>
				<div class="product-other-images">
					{foreach from=$arrItem->appPages item=appPage}
						{assign var=showImage value=false}
						{if $appPage->hasImages()}
							
							{assign var=images value=$appPage->getImages()}
							{if $images.0}
							{assign var=showImage value=true}
							{/if}
						{/if}
						
							<a href="{$arrItem->full_path}{$appPage->file}"><img src="{if $showImage}/media/dynamic/img/{$images.0->page_id}/{$images.0->page_image_id}_thumb_c_{$images.0->file_name}{else}/media/no-image-small.gif{/if}"></a>
							{*<div class="no-image-product"><a href="{$arrItem->full_path}{$appPage->file}">{$appPage->name}</a></div>*}
					{/foreach}
					<div style="clear:left;"></div>
				</div>
				<div style="clear:left;"></div>
				{/if}
			{/foreach}
			</div>
			{/if}
		</td>
        
		<td valign="top">
			<div class="product-right">
            
				<div class="product-top-info">
                	 <!--prekes info-->
                     <div>
				<h3 style="font-size:13px; font-weight:normal; font-family:Helvetica,'Open-sans', sans-serif; text-transform:uppercase;">
                        {*assign var=mainArr value=$cms->activePage->getAplicationRelatedItems()}
						{assign var=arrItem value=$mainArr->rowList[0]}
						{assign var=parent value=$arrItem->getParent()*}
						{assign var=parent value=$cms->activeDirectory->getParent()}
						{assign var=parentas value=$cms->activeDirectory->getParent()}
						{if $parent->name != $cms->path[0]->name}{$parent->name} <span>{/if}{$cms->activeDirectory->name}{if $parent->name != $cms->path[0]->name}</span>{/if}
					  </h3>
              <span class="dydziu-lentele" style="font-size:13px"><a href="javascript:popUp('/lt/informacija/marskineliu-dydziu-lentele.html');">Kokį dydį pasirinkti?</a></span>
				<br />
				
                <!-- marskineliu spalva -->
                {if $cms->activePage->spalva != ""}{if $cms->activePage->autorius != ""}{/if}<span >{if $cms->activePage->product_type == 'Marškinėliai'}Marškinėlių{elseif $cms->activePage->product_type == 'Džemperis'}Džemperio{/if} spalva: {$cms->activePage->spalva}</span>{/if} 
                <br />
                
                <!-- marskineliu artikulas -->
                {if $cms->activePage->art_nr != ""}{if $cms->activePage->autorius != "" ||  $cms->activePage->spalva != ""}{/if}<span >artikulas {$cms->activePage->art_nr}</span>{/if}
                
                
                <!--prekes kaina -->
                {if $cms->activePage->kaina > 0}
						 <h3 style="margin:0.8em 0; font-size:24px; font-weight:normal; font-family:Helvetica,'Open-sans', sans-serif;">
					<span style="font-size:18px;">Kaina:</span>
						{if $cms->activePage->sena_kaina > 0}
							<span style="font-size:16px; text-decoration:line-through;">{$cms->activePage->sena_kaina}</span>
						{/if}
						{if $cms->activePage->sena_kaina > 0 || $cms->activePage->seniausia_kaina > 0}<span style="font-size:24px; margin-left: 0.4em;">{/if}
						{$cms->activePage->kaina} </span>&euro;
						</h3>
				{/if}
                <!--prekes kaina pabaiga-->

				<!--kaina litais-->
                {if $cms->activePage->kaina > 0}
						 <h3 style="margin:0.8em 0; font-weight:normal; font-family:Helvetica,'Open-sans', sans-serif;">
					<span>Kaina litais:</span>
						{if $cms->activePage->seniausia_kaina > 0}
							<span>{$cms->activePage->seniausia_kaina}</span>
							<span style="position:relative;">LTL</span> 
						{/if}
						</h3>
				{/if}
                <!-- kaina litais pabaiga-->
                                     
                        
					 </div>
                     <!--prekes info-->
                     
                
                	
                   			
					<!-- marskineliu dydis -->
					<div class="to-basket-form lilpadd-top"><h2 style="font-size:1.4em; font-weight:normal;">Pasirinkti marškinėlių dydį:</h2>
                    <span class="dydziu-lentele"><a href="javascript:popUp('/lt/informacija/marskineliu-dydziu-lentele.html');">Kokį dydį rinktis?</a></span>
                    <br /><br />

						<form action="{$cms->activeDirectory->full_path}{$cms->activePage->file}" method="post" name="dydziuForma" id="dydziuForma">
							<input type="hidden" name="toBasket" value="toBasket">
							<input type="hidden" name="product" value="{$cms->activePage->page_id}">
							<input type="hidden" name="amount" value="1">
							<input type="hidden" name="dydis" value="0" id="superdydis">
							<input type="hidden" name="toBasket" value="Į krepšelį">
							{assign var=pageSizes value=$cms->activePage->getFullSizes()}
							{if $pageSizes->totalRowCount > 0}
								{literal}
								<script>
								function changeValueSize(ids){
										
									document.forms['dydziuForma'].dydis.value = ids;
									jQuery(".size-div").removeClass('on');
									//document.forms['dydziuForma'].submit();
									
								}
								jQuery(document).ready(function($) {
									
									$(".add-to-basket").click(function(e){
										e.preventDefault();
										if($("#superdydis").val() == '0' || $("#superdydis").val() == ''){
											$("#dydisError").html('Nepasirinktas marškinėlių dydis.<br />Paspauskite and reikiamo dydžio').removeClass("off");
											return false;
										}else{
											$("#dydisError").addClass("off");
											$("#dydziuForma").submit();
										}
									});
									
								});
								
								</script>
								{/literal}
									{foreach from=$pageSizes->rowList item=pagesize name='sizesCycle'}
									<div class="size-block{if $pagesize->kiekis == 0} inactive{/if}">
									<div class="size-div{if $smarty.foreach.sizesCycle.first} first{/if}"{if $pagesize->kiekis > 0} onClick="changeValueSize('{$pagesize->size_id}');jQuery(this).addClass('on')"{/if}>{$pagesize->dydis}</div>
									<div class="size-info">{if $pagesize->kiekis > 0 && $pagesize->kiekis < 2}LIKO {$pagesize->kiekis}{/if}{if $pagesize->kiekis == 0}PARDUOTA{/if}</div>
									</div>
									{/foreach}
								<div style="clear:both;"></div>
								<div class="add-error off" id="dydisError"></div>
								<div class="add-to-block">
								<input class="add-to-basket" type="submit" name="toBasket" value="Dėti į krepšelį" />
								</div>
							{/if}
						</form>
					</div>
                    <!-- pabaiga marskinelius dydis -->
                     
					
                    				</div>
				
				
				
				{/if}
				
                <div style="width:100%; height:; color:#000; background:; padding:15px; margin-top:22px; text-align:left; font-family: helvetica, arial, sans-serif;">
                 Marškinėlių siuntimo kainos:<br />Neregistruotas siuntimas - nemokamas<br />Regsitruotas siuntimas - 1.49 &euro;
                </div>
				{assign var=cmstexts value=$cms->activePage->getTexts()}
				{if $cmstexts.0 != ''}
					<div class="aditional-info pap-info">
				{/if}
						<span>{cms_text}</span>
				{if $cmstexts.0 != ''}
					</div>
				{/if}
			</div>
		</td>
	</tr>
	</table>
	
{if !$cms->editMode}{include file="inc/footer.inc.tpl"}{/if}
