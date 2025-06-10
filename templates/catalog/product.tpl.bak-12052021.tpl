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
  #product-features-top .ttipbox {
    display:none;
    position: absolute;
    top:0;
    left:50%;
    transform: translate(-50%, -110%);
    -webkit-transform: translate(-50%, -110%);
    -moz-transform: translate(-50%, -110%);
    opacity: 0;
    transition: opacity 0.3s ease-out;
    -webkit-transition: opacity 0.3s ease-out;
    -moz-transition: opacity 0.3s ease-out;
    background-color: rgba(0,0,0,0.7);
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    color:white;
    white-space: nowrap;
    width:auto;
    height:auto;
    padding:10px 14px;
    bottom:auto;
  }
  #product-features-top .ttipbox::after {
    position:absolute;
    top:100%;
    left:50%;
    transform: translateX(-50%);
    content:'';
    border-top: 5px solid rgba(0,0,0,0.7);
    border-top-color: rgba(0,0,0,0.7); 
    border-left: 5px solid transparent;
    border-right: 5px solid transparent; 

  }
  #product-features-top > div {
    position: relative;
  }
  #product-features-top > div:hover > .ttipbox {
    display:block;
    opacity: 1;

  }
  #product-features-top > div.regulable::after {
    font-size: 24px;
    color: #666;
    font-family: 'Material Icons';
    content: '\e01d';
}
#product-features-top > div.masdatos::after {
  font-size:24px;
  color:#666;
  font-family: 'Material Icons';
  content: '\e861';
}
.wholelink {
  display: block;
  width:100%;
  height:100%;
  position: absolute;
  top:0;
  left:0;
  right:0;
  bottom:0;
  z-index:9;
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
      <div class="col-md-6">
        {block name='page_content_container'}
          <section class="page-content" id="content">
            {block name='page_content'}
              <!-- @todo: use include file='catalog/_partials/product-flags.tpl'} -->
              {block name='product_flags'}
                <ul class="product-flags">
                  {foreach from=$product.flags item=flag}
                    <li class="product-flag {$flag.type}">{$flag.label}</li>
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
        <div class="col-md-6 product-data-right">
          {block name='page_header_container'}
            {block name='page_header'}
              <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
            {/block}
           {/block}
          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}

          <div class="product-information">
            {*{block name='product_description_short'}
              <div id="product-description-short-{$product.id}" itemprop="description">{$product.description_short nofilter}</div>
            {/block}*}
            <div id="product-features-top">
              {foreach from=$product.grouped_features item=feature}
                {if $feature.id_feature == '9'}<div class="potencia"><span class="ttipbox">{$feature.name}</span><span>{$feature.value}</span></div>{/if}
                {if $feature.id_feature == '10'}<div class="lumen"><span class="ttipbox">{$feature.name}</span><span>{$feature.value} lumen</span></div>{/if}
                {if $feature.id_feature == '41'}<div class="apertura"><span class="ttipbox">{$feature.name}</span><span>{$feature.value}</span></div>{/if}
                {if $feature.id_feature == '39'}<div class="tension"><span class="ttipbox">{$feature.name}</span><span>{$feature.value}</span></div>{/if}
              {/foreach}
              <div class="masdatos"><a class="wholelink" href="#product-details"><span class="ttipbox">{l s='Más datos técnicos' d='Shop.Theme.Product'}</span><span>{l s='+ Datos' d='Shop.Theme.Catalog'}</span></a></div>
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
                  {/block}
                </form>
              {/block}

            </div>
           {*
            {block name='garantias'}
          {foreach from=$product.grouped_features item=feature}
          {if $feature.id_feature == '45'}
          <div class="garantias_img{if $feature.value == '2años'} yr2{elseif $feature.value == '3 años'} yr3{elseif $feature.value == '5 años'} yr5{/if}"></div>
          {/if}
            {/foreach}
            {/block}
            *} 
       
            {block name='hook_display_reassurance'}
              {hook h='displayReassurance'}
            {/block}
            {block name='ficha_tecnica'}
            {widget name='productfeaturespdf' productid=$product.id_product}
            {/block}

{*      CODIGO ORIGINAL. PANEL DE DESCRIPCION Y CARACTERISTICAS DE PRODUCTO EN LA COLUMNA IZQUIERDA. SUSTITUIDO POR PANEL ANCHO COMPLETO
      {block name='product_tabs'}
              <div class="tabs">
                <ul class="nav nav-tabs" role="tablist">
                  {if $product.description}
                    <li class="nav-item">
                       <a
                         class="nav-link{if $product.description} active{/if}"
                         data-toggle="tab"
                         href="#description"
                         role="tab"
                         aria-controls="description"
                         {if $product.description} aria-selected="true"{/if}>{l s='Description' d='Shop.Theme.Catalog'}</a>
                    </li>
                  {/if}
                  <li class="nav-item">
                    <a
                      class="nav-link{if !$product.description} active{/if}"
                      data-toggle="tab"
                      href="#product-details"
                      role="tab"
                      aria-controls="product-details"
                      {if !$product.description} aria-selected="true"{/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
                  </li>
                  {if $product.attachments}
                    <li class="nav-item">
                      <a
                        class="nav-link"
                        data-toggle="tab"
                        href="#attachments"
                        role="tab"
                        aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
                    </li>
                  {/if}
                  {foreach from=$product.extraContent item=extra key=extraKey}
                    <li class="nav-item">
                      <a
                        class="nav-link"
                        data-toggle="tab"
                        href="#extra-{$extraKey}"
                        role="tab"
                        aria-controls="extra-{$extraKey}">{$extra.title}</a>
                    </li>
                  {/foreach}
                </ul>

                <div class="tab-content" id="tab-content">
                 <div class="tab-pane fade in{if $product.description} active{/if}" id="description" role="tabpanel">
                   {block name='product_description'}
                     <div class="product-description">{$product.description nofilter}</div>
                   {/block}
                 </div>

                 {block name='product_details'}
                   {include file='catalog/_partials/product-details.tpl'}
                 {/block}

                 {block name='product_attachments'}
                   {if $product.attachments}
                    <div class="tab-pane fade in" id="attachments" role="tabpanel">
                       <section class="product-attachments">
                         <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                         {foreach from=$product.attachments item=attachment}
                           <div class="attachment">
                             <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                             <p>{$attachment.description}</p>
                             <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                               {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                             </a>
                           </div>
                         {/foreach}
                       </section>
                     </div>
                   {/if}
                 {/block}

                 {foreach from=$product.extraContent item=extra key=extraKey}
                 <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                   {$extra.content nofilter}
                 </div>
                 {/foreach}
              </div> 
              
            </div>
          {/block} *}
        </div>
      </div>
    </div>
    <div class="row">
            {block name='product_tabs'}
              <div class="tabs" style="margin-bottom:20px;width:100%;margin-left:0;margin-right:0;">
                <ul class="nav nav-tabs" role="tablist">
                 <li class="nav-item">
                    <a
                      class="nav-link active"
                      data-toggle="tab"
                      href="#product-details"
                      role="tab"
                      aria-controls="product-details" aria-selected="true">{l s='Product Details' d='Shop.Theme.Catalog'}</a>
                  </li>
                  {if $product.description}
                    <li class="nav-item">
                       <a
                         class="nav-link"
                         data-toggle="tab"
                         href="#description"
                         role="tab"
                         aria-controls="description"
                         >{l s='Description' d='Shop.Theme.Catalog'}</a>
                    </li>
                  {/if}
                  {if $product.attachments}
                    <li class="nav-item">
                      <a
                        class="nav-link"
                        data-toggle="tab"
                        href="#attachments"
                        role="tab"
                        aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
                    </li>
                  {/if}
                  {foreach from=$product.extraContent item=extra key=extraKey}
                    <li class="nav-item">
                      <a
                        class="nav-link"
                        data-toggle="tab"
                        href="#extra-{$extraKey}"
                        role="tab"
                        aria-controls="extra-{$extraKey}">{$extra.title}</a>
                    </li>
                  {/foreach}
                </ul>

                <div class="tab-content" id="tab-content">
                 <div class="tab-pane fade in" id="description" role="tabpanel">
                   {block name='product_description'}
                     <div class="product-description">{$product.description nofilter}</div>
                   {/block}
                 </div>

                 {block name='product_details'}
                   {include file='catalog/_partials/product-details.tpl'}
                 {/block}

                 {block name='product_attachments'}
                   {if $product.attachments}
                    <div class="tab-pane fade in" id="attachments" role="tabpanel">
                       <section class="product-attachments">
                         <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                         {foreach from=$product.attachments item=attachment}
                           <div class="attachment">
                             <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                             <p>{$attachment.description}</p>
                             <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                               {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                             </a>
                           </div>
                         {/foreach}
                       </section>
                     </div>
                   {/if}
                 {/block}

                 {foreach from=$product.extraContent item=extra key=extraKey}
                 <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                   {$extra.content nofilter}
                 </div>
                 {/foreach}
              </div> 
              
            </div>
          {/block}
</div>
    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix">
          <p class="h5 text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
          <div class="products">
            {foreach from=$accessories item="product_accessory"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
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
