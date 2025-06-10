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
  <style type="text/css">
    

     

   </style>
{/block}
{block name='product_miniature_item'}

  <article class="product-responsive-card js-product-miniature js-product" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    <div class="left-column">
      {if $product.cover}
        {assign var='coverImage' value=Product::getCover($product->id)}
        {assign var='coverImageId' value="{$product->id}-{$coverImage.id_image}"}
        {if $product.images|@count > 1}
          {foreach from=$product.images item=foto}
            {if !isset($foto.cover) OR $foto.cover != 1}
                {assign var='secondImageId' value="{$product.id}-{$foto.id_image}"}
                {assign var='secondImageUrl' value=$link->getImageLink($product.link_rewrite, $secondImageId)}
                {break}
            {/if}
          {/foreach}
        {else}
          {assign var='secondImageUrl' value=''}
        {/if} 
      {/if}
      <figure>
        <a href="{$product.canonical_url}" style="position:relative;">
        <img
          class="imagen-cover"
          src="{if isset($coverImage) && isset($coverImageId)}{$link->getImageLink($product.link_rewrite, $coverImageId)}{else}{$urls.img_ps_url}noimage.jpg"{/if}"
          alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
          data-full-size-image-url="{$product.cover.large.url}"
          itemprop="image" />
        </a>
      </figure>
      <div class="variante">
        {widget name='comblist' productid=$product.id}
      </div>
    </div>
    <div class="card-content">
      <div>
          {block name='product_flags'}
            {foreach from=$product.flags item=flag name=loop}
            <p class="tag"{if $flag.type=='on-sale'} style="background:red !important"{/if}>{$flag.label}</p>
            {if $smarty.foreach.loop.last}
              {foreach from=$product.features item=feature}
                {if $feature.id_feature == '55'}
                  {if $feature.value|strstr:"44" OR $feature.value|strstr:"54" OR $feature.value|strstr:"55" OR $feature.value|strstr:"65" OR $feature.value|strstr:"66" OR $feature.value|strstr:"67" OR $feature.value|strstr:"68" OR $feature.value|strstr:"6X"}
                    <p class="tag" style="position:relative;padding-left:22px; background-color:color-mix(in srgb, var(--bs-blue), black 30%);">
                      <img border="0" src="{$urls.img_url}waterdrop.svg" style="position:absolute;left:0;top:50%;transform:translate(22%, -50%);width:16px;">{$feature.value}
                    </p>
                  {/if}
                {/if}
              {/foreach}
            {/if}
            {foreachelse}
              {foreach from=$product.features item=feature}
                {if $feature.id_feature == '55'}
                  {if $feature.value|strstr:"44" OR $feature.value|strstr:"54" OR $feature.value|strstr:"55" OR $feature.value|strstr:"65" OR $feature.value|strstr:"66" OR $feature.value|strstr:"67" OR $feature.value|strstr:"68" OR $feature.value|strstr:"6X"}
                    {assign var=has_waterdrop_tag value=true}

                    <p class="tag" style="position:relative;padding-left:22px; background-color:color-mix(in srgb, var(--bs-blue), black 30%);">
                      <img border="0" src="{$urls.img_url}waterdrop.svg" style="position:absolute;left:0;top:50%;transform:translate(22%, -50%);width:16px;">{$feature.value}
                    </p>
                  {/if}
                {/if}
              {/foreach}
              {if !$has_waterdrop_tag}
               <p class="tag" style="background:transparent"></p>
              {/if}
            {/foreach}
          {/block}
          
        <h3 class="card-title" itemprop="name" content="{$product.name}">{$product.name|truncate:80:'...' nofilter}{foreach from=$product.grouped_features item=feature}
          {if $feature.id_feature == '47'} {l s='Corte' d='Shop.Theme.Catalog'} {$feature.value}{break}{/if}{/foreach}</h3><span style="font-size:.7rem">{$product.reference}</span>
      </div>
      <div class="price">
        {if $product.has_discount}
        {hook h='displayProductPriceBlock' product=$product type="old_price"}
          <p>
            <span class="visually-hidden">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
            <s>{$product.regular_price}</s>
            {if $product.discount_type === 'percentage'}
              <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
            {elseif $product.discount_type === 'amount'}
              <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
            {/if}
          </p>
        {/if}
          <p>
            <span class="visually-hidden">
              {l s='Price' d='Shop.Theme.Catalog'}
            </span>
            <span class="price-current">
              {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
              {if '' !== $smarty.capture.custom_price}
                {$smarty.capture.custom_price nofilter}
              {else}
                {$product.price}
              {/if}
            </span>
          </p>
          <p class="price-info">{hook h='displayProductListReviews' product=$product}</p>
      </div>
      
      {block name='quick_view'}
          <a class="button button-primary quick-view" data-link-action="quickview" role="button" href="#" >COMPRAR</a>
      {/block}
      
      {if $product.quantity_all_versions > 0}
        <p class="stock-count enstock" data-count="90">{l s='Entrega 24/48h' d='Shop.Theme.Product'}</p>
      {else}
        <p class="stock-count reservar" data-count="45">{l s='Reservar' d='Shop.Theme.Product'}</p>
      {/if}
      <div class="flex-group">
        <a href="{$product.canonical_url}" class="button button-outline">
          <svg xmlns="http://www.w3.org/2000/svg" height="32" viewBox="0 -960 960 960" width="28" fill="#000000">
            <path d="M180-820v293-3 390-680 186-186Zm99 400h185q11-17 24-32t29-28H279v60Zm0 170h156q-3-15-4.5-30t-.5-30H279v60ZM180-80q-24 0-42-18t-18-42v-680q0-24 18-42t42-18h361l219 219v154q-14-7-29-12t-31-8v-107H511v-186H180v680h315q20 21 44.5 36T593-80H180Zm480-110q47 0 78.5-31.5T770-300q0-47-31.5-78.5T660-410q-47 0-78.5 31.5T550-300q0 47 31.5 78.5T660-190ZM864-54 756.84-161Q736-147 711.5-138.5 687-130 660-130q-70.83 0-120.42-49.62Q490-229.24 490-300.12t49.62-120.38q49.62-49.5 120.5-49.5t120.38 49.58Q830-370.83 830-300q0 27-8.5 51.5T799-203.16L906-96l-42 42Z" />
          </svg>
          {l s='Ver detalles' d='Shop.Theme.Catalog'}
        </a>

        <a class="button button-outline">
          <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130 130" width="32" height="32">
            <path
              d="M 65,29 C 59,19 49,12 37,12 20,12 7,25 7,42 7,75 25,80 65,118 105,80 123,75 123,42 123,25 110,12 93,12 81,12 71,19 65,29 z"
              fill="currentColor"
              stroke="currentColor"
              stroke-width="8"
          />
          </svg>


          {l s='Guardar [1]para después[/1]' d='Shop.Theme.Catalog' sprintf=['[1]' => '<span class="hide-on-mobile">', '[/1]' => '</span>']}
        </a>
      </div>
    </div>
  </article>
{/block}
