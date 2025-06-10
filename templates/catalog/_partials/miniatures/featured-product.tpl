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
{block name='product_miniature_item'}
  <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    <div class="thumbnail-container">
      {block name='product_thumbnail'}
        {if $product.cover}
          <a href="{$product.canonical_url}" class="thumbnail product-thumbnail">
             {if $product.quantity_all_versions > 0}
            <span class="stocklabel">{l s='En stock' d='Shop.Theme.Product'}</span>
            {else}
            {if $product.allow_oosp}
            <span class="stocklabel reserva">{l s='Reservar' d='Shop.Theme.Product'}</span>
            {else}
            <span class="stocklabel agotado">{l s='Agotado' d='Shop.Theme.Product'}</span>
            {/if}
            {/if}
            <img
              src="{$product.cover.bySize.home_default.url}"
              alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
              data-full-size-image-url="{$product.cover.large.url}"
            />
          </a>
        {else}
          <a href="{$product.canonical_url}" class="thumbnail product-thumbnail">
            <img src="{$urls.no_picture_image.bySize.home_default.url}" />
          </a>
        {/if}
      {/block}
        
      <div class="product-description">
        {block name='product_name'}
          {if $page.page_name == 'index'}
            <a href="{$product.canonical_url}"><h3 class="h3 product-title" itemprop="name">{$product.name|truncate:30:'...'}</h3></a>
          {else}
            <a href="{$product.canonical_url}"><h2 class="h3 product-title" itemprop="name">{$product.name|truncate:30:'...'}</h2></a>
          {/if}
          <div class="lista_features">
          {assign var=caracteristicas value=[]}
          {foreach from=$product.grouped_features item=feature}
            {if $feature.id_feature == '9'}{assign var=potencia value=$feature.value}{append var='caracteristicas' value=$potencia index=0}{elseif $feature.id_feature == '10'}{assign var=lumenes value=$feature.value|cat:' lumens'}{append var='caracteristicas' value=$lumenes index=1}{elseif $feature.id_feature =='41'}{append var='caracteristicas' value=$feature.value index=2}{/if}
          {/foreach}
          {assign var=caracterist value=$caracteristicas|implode:'</span> / <span>'}<span>{$caracterist|escape:'htmlall'|nl2br nofilter}</span>
          </div>
          {widget name='comblist' productid=$product.id_product ref=true}
        {/block}

        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping" style="top:35px;display:flex;justify-content: space-around  ;align-items: center;flex:1 1 50%;text-align: center">
              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}
                {if $customer.is_logged}
                  {assign var=customergroups value=[4,7,19,30,32,33,39,40]}
                  {if in_array($customer.id_default_group, $customergroups)}
                  {else}
                    <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                    <span class="regular-price">{$product.regular_price}</span>
                    {if $product.discount_type === 'percentage'}
                      <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                    {elseif $product.discount_type === 'amount'}
                      <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                    {/if}                  
                  {/if}
                {else}
                  <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                  <span class="regular-price">{$product.regular_price}</span>
                  {if $product.discount_type === 'percentage'}
                    <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                  {elseif $product.discount_type === 'amount'}
                    <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                  {/if}                  
                {/if}
              {/if}

              {hook h='displayProductPriceBlock' product=$product type="before_price"}

              <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
              <span itemprop="price" class="price">{$product.price}</span>

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

              {hook h='displayProductPriceBlock' product=$product type='weight'}
                  {widget name='comblist' productid=$product.id_product template='featured'}
            </div>
          {/if}
        {/block}

        {block name='product_reviews'}
          {hook h='displayProductListReviews' product=$product}
        {/block}
      </div>

      <!-- @todo: use include file='catalog/_partials/product-flags.tpl'} -->
      {block name='product_flags'}
        <ul class="product-flags">
          {foreach from=$product.flags item=flag}
                                {if $customer.is_logged}
                      {assign var=customergroups value=[4,7,19,30,32,33,39,40]}
                      {if in_array($customer.id_default_group, $customergroups)}
                        {if $flag.type == 'discount'}{continue}{/if}
                      {else}
                      {/if}
                      <li class="product-flag {$flag.type}">{$flag.label}</li>
                    {else}
                      <li class="product-flag {$flag.type}">{$flag.label}</li>
                    {/if}

          {/foreach}
        </ul>
      {/block}

      <div class="highlighted-informations{if !$product.main_variants} no-variants{/if} d-none d-sm-none d-md-block">
        {block name='quick_view'}
          <a class="quick-view" href="#" data-link-action="quickview">
            <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' d='Shop.Theme.Actions'}
          </a>
        {/block}

        {block name='product_variants'}
          {if $product.main_variants}
            {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
          {/if}
        {/block}
      </div>
    </div>
  </article>
{/block}
