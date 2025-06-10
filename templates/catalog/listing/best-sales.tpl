{*
 * This file allows you to customize your best-sales page.
 * You can safely remove it if you want it to appear exactly like all other product listing pages
 *}
{*extends file='catalog/listing/product-list.tpl'*}

{extends file=$layout}
{block name='content'}
  <section id="main" style="margin-top:60px">
<div id="js-product-list-header">
        <div class="block-category cat-banners-title card" id="info-category"><span>+ INFORMACIÓN</span></div>
        <div class="block-category card card-block cat-banners block-hidden">
            <div class="banner-element"><a href="{url entity='cms' id=12 id_lang=$language.id}"><div><span>{l s='HASTA' d='Shop.Theme.Categorybanners'}</span><span>5</span><span>{l s='AÑOS DE GARANTÍA' d='Shop.Theme.Categorybanners'}</span><span>{l s='TODOS LOS PRODUCTOS' d='Shop.Theme.Categorybanners'}</span></div><div><img border="0" src="{$urls.img_url}icons/warrantybg.png" style="max-width:70%;margin-right:5px;float:right" alt="AL MENOS 2 AÑOS DE GARANTÍA EN TODO EL CATÁLOGO"></div></a></div>
            <div class="banner-element"><a href="//masterled.es/es/content/1-envios-y-devoluciones"><div><span>ENTREGAS EN 24 Horas</span><span>EN TODA LA PENÍNSULA</span></div><div><img border="0" src="https://masterled.es/themes/masterled/assets/img/icons/24h.png" style="max-width:90%;margin-right:5px;float:right" alt="ENVIOS 24H EN PENINSULA"></div></a></div>
            <div class="banner-element"><div><span>PRECIOS IVA NO INCLUIDO</span><span>EN TODOS LOS PRODUCTOS</span></div><div><img border="0" src="https://masterled.es/themes/masterled/assets/img/icons/iva.png" style="max-width:90%;margin-right:5px;float:right" alt="PRECIOS EXPRESADOS SIN IVA"></div></div><div class="banner-element"><a href="//masterled.es/es/content/13-equivalencia-bombillas"><div><span>EQUIVALENCIA</span><span>LÁMPARAS LED &gt;<br>LAMPARAS TRADICIONALES</span></div><div><img border="0" src="https://masterled.es/themes/masterled/assets/img/icons/bulb.png" style="max-width:90%;margin-right:5px;float:right" alt="EQUIVALENCIA LED"></div></a></div>
        </div> 
                    <div class="block-category card card-block">
      {block name='product_list_header'}
      <h2 id="js-product-list-header" class="h2">{$listing.label}</h2>
    {/block}            <div class="block-category-inner">
                                    <div id="category-description" class="text-muted"><p></p></div>
                                                    <div class="category-cover">
                        <img src="https://masterled.es/c/243-category_default/destacados.jpg" alt="Productos Destacados - Masterled.es">
                    </div>
                            </div>
        </div>
        
</div>
    

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

  </section>
{/block}
