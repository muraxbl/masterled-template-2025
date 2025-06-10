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
{extends file=$layout}
{block name='content'}
  <section id="main" style="{if $page.page_name == 'new-products'}margin-top:60px;{/if}">

    {block name='product_list_header'}
    {if $page.page_name == 'new-products' OR $page.page_name == 'best-sales'}
    <div id="js-product-list-header">
        <div class="block-category card card-block">
            {block name='product_list_header'}
                <h2 id="js-product-list-header" class="h2">{$listing.label}</h2>
                {if $page.page_name == 'new-products'}
                    <div id="category-description" class="text-muted">
                        {l s='Descubre las novedades en nuestro catálogo' d='Shop.Theme.Global'}
                    </div>
                {/if}
            {/block}            
            <div class="block-category-inner">
                <div id="category-description" class="text-muted"><p></p></div>
                <div class="category-cover">
            </div>
            </div>
        </div>
    </div>
    {else}
    <h2 id="js-product-list-header" class="h2">{$listing.label}</h2>
    {/if}
    {/block}

    <section id="products">
      {if $listing.products|count}

        <div>
          {block name='product_list_top'}
            {include file='catalog/_partials/products-top.tpl' listing=$listing}
          {/block}
        </div>

        {block name='product_list_active_filters'}
          <div id="" class="d-none d-sm-none d-md-block">
            {$listing.rendered_active_filters nofilter}
          </div>
        {/block}

        <div>
          {block name='product_list'}
            {include file='catalog/_partials/products.tpl' listing=$listing}
          {/block}
        </div>

        <div id="js-product-list-bottom">
          {block name='product_list_bottom'}
            {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
          {/block}
        </div>

      {else}
        
          <div id="js-product-list-top"></div>

          <div id="js-product-list">
            {include file='errors/not-found.tpl'}
          </div>

          <div id="js-product-list-bottom"></div>

      {/if}
    </section>
    <section id="categoryfooter">
      {hook h='displayCategoryFooter'}
      
        <div class="cat-banners-modern">
        <div class="banner-item">
            <a href="/es/content/12-garantia-masterled">
            <img src="https://desarrollo.masterled.es/themes/master_beta/assets/img/icons/warrantybg.png" alt="Garantía" />
            <span class="title">Hasta 5 años</span>
            <span class="subtitle">de garantía</span>
            </a>
        </div>
        <div class="banner-item">
            <a href="/es/content/1-envios-y-devoluciones">
            <img src="https://desarrollo.masterled.es/themes/master_beta/assets/img/icons/24h.png" alt="24h" />
            <span class="title">Entregas 24h</span>
            <span class="subtitle">en Península</span>
            </a>
        </div>
        <div class="banner-item">
            <img src="https://desarrollo.masterled.es/themes/master_beta/assets/img/icons/iva.png" alt="IVA incluido" />
            <span class="title">IVA incluido</span>
            <span class="subtitle">en todos los precios</span>
        </div>
        <div class="banner-item">
            <a href="/es/content/13-equivalencia-bombillas">
            <img src="https://desarrollo.masterled.es/themes/master_beta/assets/img/icons/bulb.png" alt="Equivalencia" />
            <span class="title">Equivalencia</span>
            <span class="subtitle">LED vs. tradicionales</span>
            </a>
        </div>
        </div>
    </section>
  </section>
  
{/block}
