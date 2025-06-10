{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
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
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{block name='product_miniature_item'}
<div class="js-product product{if !empty($productClasses)} {$productClasses}{/if}">
  <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
    <div class="thumbnail-container">
      <div class="thumbnail-top">
        {block name='product_thumbnail'}
            <a href="{$product.link}" class="thumbnail product-thumbnail">
              <img
                src="{$urls.base_url}{$product.cover}-home_default/{$product.link_rewrite}.jpg"
                alt="{if !empty($product.legend)}{$product.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                loading="lazy"
                data-full-size-image-url="{$urls.base_url}{$product.cover}-large_default/{$product.link_rewrite}.jpg"

              />
            </a>
        {/block}

        <div class="highlighted-informations">
          {block name='quick_view'}
            <a class="quick-view js-quick-view" href="#" data-link-action="quickview">
              <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' d='Shop.Theme.Actions'}
            </a>
          {/block}

        </div>
      </div>

      <div class="product-description">
        {block name='product_name'}
          {if $page.page_name == 'index'}
            <a href="{$product.link}" content="{$product.link}"><h3 class="h3 product-title">{$product.name|truncate:30:'...'}</h3></a>
          {else}
            <a href="{$product.link}" content="{$product.link}"><h2 class="h3 product-title">{$product.name|truncate:30:'...'}</h2></a>
          {/if}
        {/block}

        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping">

              {hook h='displayProductPriceBlock' product=$product type="before_price"}

              <span class="price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">
                {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
                {if '' !== $smarty.capture.custom_price}
                  {$smarty.capture.custom_price nofilter}
                {else}
                  {$product.price|number_format:2:",":""}€

                {/if}
              </span>

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

              {hook h='displayProductPriceBlock' product=$product type='weight'}
            </div>
          {/if}
        {/block}

        {block name='product_reviews'}
        {/block}
      </div>

    </div>
  </article>
</div>
{/block}
