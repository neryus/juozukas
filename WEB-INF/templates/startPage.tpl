{include file='inc/header-index.inc.tpl' startPage=1}

<table class="startpage-table">
	{assign var=startTop value=$cms->getStartTop()}
	{if $startTop->totalRowCount > 0}
	<tr>
		<td valign="top" width="100%">
			<table class="start-items-list">
				<tr>
					<td align="left" valign="top">
						{assign var=startBottom value=$cms->getStartBottom()}
						{if $startBottom->totalRowCount > 0}
							{foreach from=$startBottom->getList() item=startTopItem name="startTopFor"}
								<div class="start-item item-{cycle values='1,2,3'}" onmouseover="this.id='mkon'" onmouseout="this.id=''">
									{assign var=showImage value=false}
									{if $startTopItem->hasImages()}

										{assign var=showImage value=true}
										{assign var=images value=$startTopItem->getImages()}
									{/if}
									{assign var="appImage" value=$startTopItem->getAppImage('thumb_b')}
									{assign var=kelias value=$startTopItem->getFullPath()}
									<div class="start-image" style="background: url('{if $appImage}{$appImage}{else}{if $showImage}/media/dynamic/img/{$images[0]->page_id}/{$images[0]->page_image_id}_thumb_b_{$images[0]->file_name}{else}/media/no-image-medium.gif{/if}{/if}') center center no-repeat;">
										<a href="{$kelias->full_path}" title="{$startTopItem->name}">
											<span class="start-image-price {if $startTopItem->is_ypatingas == 'T'}lightning-price{/if}">{$startTopItem->kaina} &euro;</span>
										</a>
									</div>
									<div class="name-author">
										<a href="{$kelias->full_path}">{$startTopItem->name|smartwordwrap:19:" ":1:1:"..."}</a>
										<div>{$startTopItem->autorius}</div>
									</div>
								</div>
							{/foreach}
						{/if}
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
	 <td>
      <table cellpadding="0" cellspacing="0" border="0" style="width:95%" align="center">

    <!--papildomi mygtukai pradzia-->
    <tr>
     <td>
     <div class="block-visi">
      <div style="float:left; width:45%; padding:15px;"><a href="http://www.juozukas.lt/lt/produktai/vyriski-marskineliai/?showall=1" alt="Visi vyriški marškinėliai" title="Visi vyriški marškinėliai" class=""><span class="rodykle"></span>Visi vyriški marškinėliai</a></div>

      <div style="float:right; width:45%; padding:15px;"><a href="http://www.juozukas.lt/lt/produktai/moteriski-marskineliai/?showall=1" alt="Visi moteriški marškinėliai" title="Visi moteriški marškinėliai" class=""><span class="rodykle"></span>Visi moteriški marškinėliai</a></div>
     </div>
     </div>
     </td>
    </tr>
    <!--pabaiga papildomi mygtukai-->
    </table>
	 </td>
	</tr>

	{/if}
</table>

{include file='inc/footer-index.inc.tpl'}
