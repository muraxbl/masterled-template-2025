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
 * 
 *
 *  ------ CAMBIOS ------
 *  Añadido enlace de acceso rápido a 
 *
 *}

{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
  <style>
    html {
      scroll-behavior: smooth;
    }
    body#product #images-column {
      position: relative !important;
      top: 0 !important;
    }

</style>
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='content'}
  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    <div class="row">
      <div class="col-md-8" id="images-column">
        {block name='page_content_container'}
          <section class="page-content" id="content">
            {block name='page_content'}
              <!-- @todo: use include file='catalog/_partials/product-flags.tpl'} -->
              {block name='product_flags'}
                <ul class="product-flags">
                  {foreach from=$product.flags item=flag}
                    {if $customer.is_logged}
                      {assign var=customergroups value=[4,7,19,30,32,33,39,40]}
                      {if $customer.id_default_group != 3}
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

              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                
              {/block}
              <div class="scroll-box-arrows">
                <i class="material-icons left">&#xE314;</i>
                <i class="material-icons right">&#xE315;</i>
              </div>

            {/block}
          </section>
        {/block}
        </div>
        <div class="col-md-4 product-data-right">
          <div>
          {block name='page_header_container'}
            {block name='page_header'}
              <h1 class="h1 product-name" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
            {/block}
           {/block}
          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}

          <div class="product-information">
            <div id="product-features-top">
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


              <div class="masdatos"><span class="ttipbox">{l s='Más datos técnicos' d='Shop.Theme.Product'}</span><a class="wholelink" href="#product-details"><span>{l s='+ Datos' d='Shop.Theme.Catalog'}</span></a></div>
            </div>
            {if $product.is_customizable && count($product.customizations.fields)}
              {block name='product_customization'}
                {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
              {/block}
            {/if}

            <div class="product-actions">
              {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                  {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                  {/block}

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack">
                        <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                          {/block}
                        {/foreach}
                    </section>
                    {/if}
                  {/block}

                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}

                  {block name='product_add_to_cart'}
                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                  {/block}
                  {block name='product_additional_info'}
                    {include file='catalog/_partials/product-additional-info.tpl'}
                  {/block}
                  {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                  {block name='product_refresh'}
                    {hook h='displayProductExtraContent' product=$product}
                  {/block}
                </form>
              {/block}

            </div>       
            {block name='hook_display_reassurance'}
              {hook h='displayReassurance'}
            {/block}
          </div>
        </div>
      </div>
    </div>
    
    <div class="row" id="product-details-container">
     
        <style>
         
        </style>
        <div class="col-xs-12 col-md-4" id="product-attachments-and-extra-data">
          {foreach from=$product.grouped_features item=feature}
            {if $feature.id_feature == '9'}{assign var=potencia value=$feature.value}{/if}
            {if $feature.id_feature == '10'}{assign var=lumen value=$feature.value}{/if}
          {/foreach}
          
            {if $product.id_category_default == 190}
            {else}
              <div>
                <div class="clasificacion-wrap">{hook h='displayEprelEnergyLabel' product=$product}</div>
            {/if} 
            
          </div>
          <div>
              {block name='product_attachments'}
              <h3>{l s='Download' d='Shop.Theme.Actions'}</h3>
                   {if $product.attachments}
                     <section class="product-attachments">
                    
                         {foreach from=$product.attachments item=attachment}
                           <div class="attachment">
                             <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}"><span class="material-symbols-outlined download-item">download
</span>{$attachment.name}</a></h4>
                             <p>{$attachment.description} - <span class="file_size">({$attachment.file_size_formatted})</span></p>
                           </div>
                         {/foreach}
                       </section>
                    
                   {/if}
                 {/block}
                {block name='ficha_tecnica'}
                  {widget name='productfeaturespdf' productid=$product.id_product}
                {/block}
          </div>
          {foreach from=$product.images item=image}
            {if $image.legend == 'medidas'}
            {assign var="medidas_img" value=$image.bySize.medium_default.url}
            {if isset($image.bySize.large_zoom.url)}
              {assign var="medidas_full" value=$image.bySize.large_zoom.url}
            {else}
              {assign var="medidas_full" value=$image.bySize.large_default.url}
            {/if}
            {assign var="medidas" value=true}
            {break}
            {/if}
          {/foreach}
          {if isset($medidas) && $medidas}
          <div class="medidas">
            <h3>{l s='Medidas' d='Shop.Theme.ProductPage'}</h3>
            <a href="{$medidas_full}" data-fancybox="product-lightbox">
              <figure style="width:100%;height:auto">
                <img border="0" src="{$medidas_img}" title="{l s='Medidas' d='Shop.Theme.ProductPage'}" style="max-width:100%;height:auto">
              </figure>
            </a>
          </div>
          {/if}

        </div>
        <div class="col-xs-12 col-md-8" id="product-description-and-datasheet">
                  <div class="ficha_tecnica"  id="product-details">
                    <h3>{l s='Ficha técnica' d='Shop.Theme.ProductPage'}</h3>
                    {if $product.grouped_features}
                    <section class="product-features">
                      <ul class="data-sheet" id="data-sheet-ul">
                        {foreach from=$product.grouped_features item=feature}
                          <li class="name"><strong>{$feature.name}</strong><span class="valor-car">{$feature.value|escape:'htmlall'|nl2br nofilter}</span></li>
                        {/foreach}
                      </ul>
                    </section>
                  {/if}
                  </div>
                  <div>
                    <h3>{l s='Detalles del producto' d='Shop.Theme.ProductPage'}</h3>
                    {block name='product_description'}
                       <div class="product-description" style="margin-top:20px;position: relative;display: block">
                          <input type="checkbox" name="expandir-custom-text" id="expandir-custom-text">
                          <label for="expandir-custom-text" class="boton-expandir-custom-text"><span>Leer más</span><span>Leer menos</span></label>
                          <div class="custom-text-wrapper">
                            {$product.description nofilter}
                          </div>
                        </div>
                    {/block}
                  </div>
                  <div>
                  </div>
                  {foreach from=$product.extraContent item=extra key=extraKey}
                    <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                      {$extra.content nofilter}
                    </div>
                  {/foreach}
                
        </div>

        <div class="col-lg-12">
          <div class="valoraciones">
                  <h3>Valoraciones</h3>
                  {hook h='displayProductReviewsList' product=$product.reference}
                </div>
        </div>
        </div> 
            

    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix" id="productos-relacionados">
          <p class="h5 text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
          <div class="products row">
            {foreach from=$accessories item="product_accessory"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}
{block name='product_extra_images'}
    {*<section class="product-accessories clearfix">
          {if $product.images|@count > 1}
          <p class="h5 text-uppercase" style="display:block; margin:1rem 0;">{l s='IMÁGENES EXTRA' d='Shop.Theme.Catalog'}</p>
          {/if}
          <div class="products">
            <style>
            .imagenextra {
              display: flex;flex-direction: column;justify-content: center;align-items:center;align-content: center;flex:0 1 98%;margin:1%;position: relative;
            }
            .leyendaimagen {
              font-size: 1.4em;font-style: italic;display: inline-block;margin:1rem 0
            }
            @media (max-width: 480px) {
              .imagenextra {
                flex:  0 1 98%; margin:1%;
              }
              .leyendaimagen {
                font-size: 1.2em;
              }
            }
          </style>
            {foreach from=$product.images item=image}
              {if $image['cover'] == NULL}
              <div class="imagenextra">
                <span class="leyendaimagen">{$image['legend']}</span>
                <img border="0" src="{$image['bySize']['large_default']['url']}" style="max-width: 100%;">
              </div>
            {/if}
            {/foreach}
          </div>
        </section>*}
    {/block}
    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>

{/block}
