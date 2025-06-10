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

  <article class="" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    <div class="card">
      {block name='product_thumbnail'}
      {if $product.cover}
      <img
              class="card-img-top"
              src="{$product.cover.bySize.home_default.url}"
              alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|lower|capitalize|truncate:30:'...'}{/if}"
              data-full-size-image-url="{$product.cover.large.url}" itemprop="image"
            />
      {else}
      <img src="{$urls.no_picture_image.bySize.home_default.url}" itemprop="image" />
      {/if}
      {/block}
      <div class="card-body">
        {block name='product_name'}
        <h5 class="card-title">{$product.name|lower|capitalize|truncate:30:'...'}</h5>
        {assign var=caracteristicas value=[]}
          {foreach from=$product.grouped_features item=feature}
            {if $feature.id_feature == '9'}{assign var=potencia value=$feature.value}{append var='caracteristicas' value=$potencia index=0}{elseif $feature.id_feature == '10'}{assign var=lumenes value=$feature.value|cat:' lumens'}{append var='caracteristicas' value=$lumenes index=1}{elseif $feature.id_feature =='41'}{append var='caracteristicas' value=$feature.value index=2}{/if}
          {/foreach}
          {assign var=caracterist value=$caracteristicas|implode:'</span> / <span>'}<span class="caracteristicas-list"><span>{if $caracterist}{$caracterist|escape:'htmlall'|nl2br nofilter}{else}-{/if}</span></span>
        {/block}
        {block name='product_price_and_shipping'}

        {hook h='displayProductPriceBlock' product=$product type="before_price"}
        <meta itemprop="priceCurrency" content="EUR">
        {hook h='displayProductPriceBlock' product=$product type='unit_price'}
        {hook h='displayProductPriceBlock' product=$product type='weight'}
        <span class="card-text" itemprop="price" content="{$product.price_tax_exc}"><span>Precio:&nbsp;</span><span class="pricetag">{$product.price}</span></span>
        {/block}
        <a href="{$product.canonical_url}" class="add-to-cart btn btn-primary">Comprar</a>
      </div>
    </div>
  </article>
{/block}
