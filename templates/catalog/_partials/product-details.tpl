<div class="tab-pane fade in active"
     id="product-details"
     data-product="{$product.embedded_attributes|json_encode}"
     role="tabpanel"
  >
                             {block name='product_reference_top'}
            {include file='catalog/_partials/product-reference-top.tpl'}
            {/block}

  {block name='product_quantities'}
    {if $product.show_quantities}
      <div class="product-quantities">
        <label class="label">{l s='In stock' d='Shop.Theme.Catalog'}</label>
        <span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">{$product.quantity} {$product.quantity_label}</span>
      </div>
    {/if}
  {/block}

  {block name='product_availability_date'}
    {if $product.availability_date}
      <div class="product-availability-date">
        <label>{l s='Availability date:' d='Shop.Theme.Catalog'} </label>
        <span>{$product.availability_date}</span>
      </div>
    {/if}
  {/block}

  {block name='product_out_of_stock'}
    <div class="product-out-of-stock">
      {hook h='actionProductOutOfStock' product=$product}
    </div>
  {/block}
  {if $product.id_category_default == 190}
  {else}
  {block name='clasificacion_energetica'}
    <div class="clasificacion-wrap" style="margin-top:2rem">
        {foreach from=$product.grouped_features item=feature}
              {if $feature.id_feature == '9'}{assign var=potencia value=$feature.value}{/if}
              {if $feature.id_feature == '10'}{assign var=lumen value=$feature.value}{/if}
          {/foreach}
          {if isset($potencia) && isset($lumen)}
              {$potencia = $potencia|regex_replace:"/[^0-9.]/":""}
              {$potencia = $potencia|regex_replace:"/ $/":""}
              {$lumen = $lumen|regex_replace:"/ $/":""}
              {if $product.reference|strstr:"T512" OR $product.reference|strstr:"T524" OR $product.reference|strstr:"T212" OR $product.reference|strstr:"TCOB" OR $product.reference|strstr:"T280" OR $product.reference|strstr:"T120" OR $product.reference|strstr:"TLS12"}
                {$potencia = $potencia*5}
              {/if}
          
              {if !empty($potencia) AND !empty($lumen)}
                  {math assign="coeficiente" equation="(x / y)" x=$lumen y=$potencia}
            
            <h3>Clasificación energética</h3>
            <div style="border:1px solid rgba(0,0,0,0.3);padding:2rem 1rem;display:flex;justify-content: flex-start;align-content: center;align-items: center;">
              <span style="float:left;margin:0 0.5rem 0 1rem" class="etiqueta-eficiencia ef-{if $coeficiente < 85}c{elseif $coeficiente >= 85 && $coeficiente < 110}b{elseif $coeficiente >= 110 && $coeficiente < 135}b{elseif $coeficiente >=135 && $coeficiente < 160}a{elseif $coeficiente >= 160 && $coeficiente < 185}a{elseif $coeficiente >=185 && $coeficiente <= 210}a{elseif $coeficiente > 210}a{/if}">
                      <span class="etiqueta-bg"></span>
                      <span class="etiqueta-inner"> {if $coeficiente < 85}a{elseif $coeficiente >= 85 && $coeficiente < 110}a+{elseif $coeficiente >= 110 && $coeficiente < 135}a+{elseif $coeficiente >=135 && $coeficiente < 160}a++{elseif $coeficiente >= 160 && $coeficiente < 185}a++{elseif $coeficiente >=185 && $coeficiente <= 210}a+++{elseif $coeficiente > 210}a+++{/if}</span>
                      
              </span>
              <span>Normativa 2021</span>
              <span style="float:left;margin:0 0.5rem 0 1.5rem;" class="etiqueta-eficiencia ef-{if $coeficiente < 85}g{elseif $coeficiente >= 85 && $coeficiente < 110}f{elseif $coeficiente >= 110 && $coeficiente < 135}e{elseif $coeficiente >=135 && $coeficiente < 160}d{elseif $coeficiente >= 160 && $coeficiente < 185}c{elseif $coeficiente >=185 && $coeficiente <= 210}b{elseif $coeficiente > 210}a{/if}">
                      <span class="etiqueta-bg"></span>
                      <span class="etiqueta-inner"> {if $coeficiente < 85}g{elseif $coeficiente >= 85 && $coeficiente < 110}f{elseif $coeficiente >= 110 && $coeficiente < 135}e{elseif $coeficiente >=135 && $coeficiente < 160}d{elseif $coeficiente >= 160 && $coeficiente < 185}c{elseif $coeficiente >=185 && $coeficiente <= 210}b{elseif $coeficiente > 210}a{/if}</span>
              </span><span>Normativa 2023</span>
            </div>
                  

              {/if}
            
          {/if}       
    </div>
    {/block}
  {/if}
  {block name='product_features'}
    <div class="clasificacionenergetica">

    </div>
    {if $product.grouped_features}
      <section class="product-features">
        <p class="h6">{l s='Data sheet' d='Shop.Theme.Catalog'}</p>
        
        {* <dl class="data-sheet">
          {foreach from=$product.grouped_features item=feature}
            <dt class="name">{$feature.name}</dt>
            <dd class="value">{$feature.value|escape:'htmlall'|nl2br nofilter}</dd>
          {/foreach}
        </dl>*}
        <ul class="data-sheet" id="data-sheet-ul">
          {foreach from=$product.grouped_features item=feature}
            <li class="name"><strong>{$feature.name}</strong><span class="valor-car">{$feature.value|escape:'htmlall'|nl2br nofilter}</span></li>
          {/foreach}
        </ul>
      </section>
    {/if}
  {/block}

  {* if product have specific references, a table will be added to product details section *}
  {block name='product_specific_references'}
    {if !empty($product.specific_references)}
      <section class="product-features">
        <p class="h6">{l s='Specific References' d='Shop.Theme.Catalog'}</p>
          <dl class="data-sheet">
            {foreach from=$product.specific_references item=reference key=key}
              <dt class="name">{$key}</dt>
              <dd class="value">{$reference}</dd>
            {/foreach}
          </dl>
      </section>
    {/if}
  {/block}
{*

  {block name='product_condition'}
    {if $product.condition}
      <div class="product-condition">
        <label class="label">{l s='Condition' d='Shop.Theme.Catalog'} </label>
        <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
        <span>{$product.condition.label}</span>
      </div>
    {/if}
  {/block}
  *}
</div>
