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
{block name='head' append}
<style>
.ui-tooltip.ui-widget {
    background: rgba(0,0,0,0.8) !important;
    box-shadow: none !important;
    border: none !important;
    color: white;
    font-size: 0.8em;
    margin-top: -10px;
    padding: 6px 10px;
}
.ui-tooltip.ui-widget::before {
    content: '';
    position: absolute;
    left: 10px;
    top: 0;
    margin-top: -10px;
    width: 0;
    height: 0;
    border-style: solid;
    border-width: 0 5px 10px 5px;
    border-color: transparent transparent rgba(0,0,0,0.8) transparent;
    clear: both;

}
</style>
{/block}
{block name='product_miniature_item'}
  {assign var=customergroups value=[4,7,19,30,32,33,39,40]}

  <article class="product-in-list js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
  {*{if $product.quantity_all_versions <= 0}
  <div class="soldout" style="width:100% !important;height:100% !important;position:absolute;top:0;left:0;right:0;bottom:0;background: rgba(255,255,255,0.2);backdrop-filter: grayscale(99%) blur(3px) contrast(0.91);z-index:99999">
    <span style="display:block;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%) rotate(-45deg);font-size:2em;font-weight:bold;color:#00338e">
      {l s='AGOTADO' d='Shop.Theme.BlackFriday'}
    </span>
  </div>
  {/if}*}
    <div class="product-in-list--image-container">

       {block name='product_thumbnail'}
        {if $product.cover}
        {assign var='coverImage' value=Product::getCover($product->id)}
        {assign var='coverImageId' value="{$product->id}-{$coverImage.id_image}"}

          <a href="{$product.canonical_url}">
           
            <img
              src="{$link->getImageLink($product.link_rewrite, $coverImageId)}"
              alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
              data-full-size-image-url="{$product.cover.large.url}"            />


          </a>

        {else}
          <a href="{$product.canonical_url}" class="thumbnail product-thumbnail">
            <img src="{$urls.img_ps_url}noimage.jpg" />
          </a>
        {/if}
        {*assign var=coincidencias value=false} <!-- SI ENCUENTRA COINCIDENCIA EN LA REFERENCIA CON UN PRODUCTO DEL ARRAY (Productos con medida de corte) Incluye la medida de corte como overlay sobre la imagen del producto en el listado. Se deshecha por potencial para provocar confusión con la medida exterior del producto -->
        {assign var=referencias value=['/^PNRB/','/^PNCB/','/^PNRN/','/^PNRP/','/^PNCP/','/^DORB/','/^DOCB/','/^DOP/','/^DOB/','/^DFB/','/^DGP/','/^DFP/','/^PRB/','/^PTR/','/^PTC/']}
        {foreach $referencias as $referencia}
          {if preg_match ($referencia, $product.reference)}
            {$coincidencias = true}
          {/if}
        {/foreach}
        {if $coincidencias == true}
        {foreach from=$product.grouped_features item=feature}
          {if $feature.id_feature == '47'}
          <div class="voltaje" style="position:absolute;z-index:99;top:10px;left:10px;font-weight:bold;font-size:0.8em;color:#00338e; cursor:pointer; background-color:white; padding:3px 5px" data-toggle="tooltip" data-placement="top" title="Dimensiones corte">{$feature.value}</div>
          {/if}
        {/foreach}
        {/if*}
        {if preg_match('/^[tT][rR]./', $product.reference)}
        {foreach from=$product.grouped_features item=feature}
          {if $feature.id_feature == '26'}
          <div class="voltaje" style="position:absolute;z-index:99;top:10px;right:10px;font-weight:bold;font-size:0.8em;color:#00338e;">{$feature.value}</div>
          {/if}
        {/foreach}
        {/if}
      {/block}
      {*widget name='comblist' productid=$product.id_product ref=true*}
    </div>
      <div class="product-in-list--product-stock">
        {hook h='displayProductListExtra' productid=$product.id_product}
        {*
            
        {if $product.quantity_all_versions > 0}
            <span class="product-in-stock">{l s='En stock' d='Shop.Theme.Product'}</span>
        {else}
           <span class="product-out-of-stock">{l s='Reservar' d='Shop.Theme.Product'}</span>
          <span class="stocklabel agotado">{l s='Agotado' d='Shop.Theme.Product'}</span>
        {/if}
        *}

      </div>
      <div class="product-in-list--product-name">
        {block name='product_name'}
          {if $page.page_name == 'index'}
            <a href="{$product.canonical_url}"><h3 class="product-name" itemprop="name">{$product.name|truncate:50:'...'}{foreach from=$product.grouped_features item=feature}
          {if $feature.id_feature == '47'} Corte {$feature.value}{/if}{/foreach}</h3></a><span style="font-size: 0.8em;">{$product.reference}</span>
          {else}
            <a href="{$product.canonical_url}"><h2 class="product-name" itemprop="name">{$product.name|truncate:50:'...'}{foreach from=$product.grouped_features item=feature}
          {if $feature.id_feature == '47'} Corte {$feature.value}{/if}{/foreach}</h2></a><span style="font-size: 0.8em;">{$product.reference}</span>
          {/if}
         
        {/block}
      </div>
      <div class="product-in-list--product-price">
        {block name='product_price_and_shipping'}
          {if $product.show_price}
              {if $product.has_discount}
              {if $customer.is_logged AND in_array($customer.id_default_group, $customergroups)}
              {else}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}
                <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                <span class="regular-price">{$product.regular_price}</span>
                {if $page.page_name != 'cms'}
                {if $product.discount_type === 'percentage'}
                  <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                {elseif $product.discount_type === 'amount'}
                  <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                {/if}
                {/if}
                {/if}
              {/if}

              {hook h='displayProductPriceBlock' product=$product type="before_price"}

              <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
              {if isset($products[0]['precioMinimo'])}
              {foreach from=$products item='product_price'}
              {if $product_price.id_product == $product.id_product}
              {if $product_price.precioMinimo['noTax'] > 0}
              <span itemprop="price" class="price" >desde {$product_price.precioMinimo['noTax']|number_format:2:",":"."}€</span>
              {else}
              <span itemprop="price" class="price" >{$product.price}</span>
              {/if}
              {/if}
              {/foreach}
              {else}
              <span itemprop="price" class="price">{$product.price}</span>
              {/if}
              {*{if !$customer.is_logged}
<span style="display:block;clear:both;text-align: left;"><small><strong><a href="{$urls.pages.authentication}?back=black-friday">Regístrate o entra para ver el descuento</a></strong></small></span>
              {/if}*}
              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

              {hook h='displayProductPriceBlock' product=$product type='weight'}

          {/if}
        {/block}
      </div>
      {assign var=caracteristicas value=[]}
      {foreach from=$product.grouped_features item=feature}
        {if $feature.id_feature == '9'}{assign var=potencia value=$feature.value}{append var='caracteristicas' value=$potencia index=0}{elseif $feature.id_feature == '10'}{assign var=lumenes value=$feature.value|cat:' lumens'}{append var='caracteristicas' value=$lumenes index=1}{elseif $feature.id_feature =='41'}{append var='caracteristicas' value=$feature.value index=2}{/if}
      {/foreach}
              <div class="product-in-list--product-variants">

        {*widget name='comblist' productid=$product.id_product*}
        {block name='product_reviews'}
          {hook h='displayProductListReviews' productid=$product.id_product product=$product}
        {/block}
        <div class="product_temperatures hiddendiv"><span style="color:white;">-</span></div>
        {/block}
        
        </div>

      <div class="product-in-list--product-features{if $caracteristicas} grey{/if}">
        {block name="caracteristicas_producto"}
          
          {if $caracteristicas|@count gt 0}
          {assign var=caracterist value=$caracteristicas|implode:'</span> · <span>'}
          <span {if preg_match('/^[0-9]+[-+]*[0-9]*[ ]*[wW]/',$caracterist)} style="font-weight:bold;color:#ff3c00"{/if}>{$caracterist|escape:'htmlall'|nl2br nofilter}</span>
          {else}
          <span style="color:#eee"></span>
          {/if}
        </div>

      <!-- @todo: use include file='catalog/_partials/product-flags.tpl'} -->
      {block name='product_flags'}
        <ul class="product-flags">
          {foreach from=$product.flags item=flag}
            {if $flag.type == 'discount'}
              {if $customer.is_logged AND in_array($customer.id_default_group, $customergroups)}
              {continue}
              {/if}
            {/if}
            <li class="product-flag {$flag.type}">{$flag.label}</li>
            
          {/foreach}
        </ul>
      {/block}


      <div>
         
      </div>
  </article>
{/block}
