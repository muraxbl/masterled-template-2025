{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div id="quickview-modal-{$product.id}-{$product.id_product_attribute}" class="modal fade quickview" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
   <div class="modal-content">
     <div class="modal-header">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
         <span aria-hidden="true">&times;</span>
       </button>
     </div>
     <div class="modal-body">
      <div class="row">
        <div class="col-md-6 col-sm-6 d-none d-sm-block">
          {block name='product_cover_thumbnails'}
            {*include file='catalog/_partials/product-cover-thumbnails.tpl'*}
            {if $product.cover}
              <img class="js-qv-product-cover imagen-cover" 
                src="{$product.cover.bySize.medium_default.url}" 
                alt="{$product.cover.legend}" 
                title="{$product.cover.legend}" 
                style="width:100%;" 
                itemprop="image" 
                id="product-cover-image">
            {/if}
          {/block}
          <div class="arrows js-arrows">
            <i class="material-icons arrow-up js-arrow-up">&#xE316;</i>
            <i class="material-icons arrow-down js-arrow-down">&#xE313;</i>
          </div>
        </div>
        <div class="col-md-6 col-sm-6">
          <h1 class="h1">{$product.name}</h1>
          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}
          {block name='product_description_short'}
           {* <div id="product-description-short" itemprop="description">{$product.description_short nofilter}</div> *}
     {* --- CREA ARRAY DE CARACTERÍSTICAS BÁSICAS Y LO MUESTRA (OLD)                        <div class="lista_features" style="text-align:left">
          {assign var=caracteristicas value=[]}
          {foreach from=$product.grouped_features item=feature}
                       {if $feature.id_feature == '9'}{assign var=potencia value=$feature.value}{append var='caracteristicas' value=$potencia index=0}{elseif $feature.id_feature == '10'}{assign var=lumenes value=$feature.value|cat:' lumens'}{append var='caracteristicas' value=$lumenes index=1}{elseif $feature.id_feature =='41'}{append var='caracteristicas' value=$feature.value index=2}{/if}
          {/foreach}
          {assign var=caracterist value=$caracteristicas|implode:'</span> / <span>'}<span>{$caracterist|escape:'htmlall'|nl2br nofilter}</span>
          </div>*}
            <div id="product-features-top">{* Muestra lista maquetada de características (Potencia, lúmenes, apertura, tensión)*}
          {assign var="primary_ids" value=[9,10,41,39]}
            {assign var="secondary_ids" value=[12,60,55,30]} {* <-- cambia estos por los IDs que quieras usar como backup *}
            {assign var="shown_features" value=[]}
            {assign var="count" value=0}

            {foreach from=$primary_ids item=pid}
              {foreach from=$product.grouped_features item=feature}
                {if $feature.id_feature == $pid && !in_array($feature.id_feature, $shown_features)}
                  <div class="feature-{$feature.id_feature}">
                    <span class="ttipbox">{$feature.name}</span>
                    <span>{$feature.value}</span>
                  </div>
                  {assign var="shown_features" value=$shown_features|@array_merge:[$feature.id_feature]}
                  {assign var="count" value=$count+1}
                  {break} {* salta al siguiente $pid, no sigas recorriendo más *}
                {/if}
              {/foreach}
            {/foreach}
            {if $count < 4}
              {foreach from=$secondary_ids item=sid}
                {foreach from=$product.grouped_features item=feature}
                  {if $feature.id_feature == $sid && !in_array($feature.id_feature, $shown_features)}
                    <div class="feature-{$feature.id_feature}">
                      <span class="ttipbox">{$feature.name}</span>
                      <span>{$feature.value}</span>
                    </div>
                    {assign var="shown_features" value=$shown_features|@array_merge:[$feature.id_feature]}
                    {assign var="count" value=$count+1}
                    {break}
                  {/if}
                {/foreach}
                {if $count == 4}{break}{/if}
              {/foreach}
            {/if}
            </div>

          {/block}
                    {block name='product-qty'}
            {include file='catalog/_partials/product-discounts.tpl'}
          {/block}

          {block name='product_buy'}
            <div class="product-actions">
              <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                <input type="hidden" name="token" value="{$static_token}">
                <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">
                {block name='product_variants'}
                  {include file='catalog/_partials/product-variants.tpl'}
                {/block}

                {block name='product_add_to_cart'}
                  {include file='catalog/_partials/product-add-to-cart.tpl'}
                {/block}

                {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                {block name='product_refresh'}{/block}
            </form>
          </div>
        {/block}
        </div>
      </div>
     </div>
     <div class="modal-footer">
       {hook h='displayProductAdditionalInfo' product=$product}
    </div>
   </div>
 </div>
</div>
