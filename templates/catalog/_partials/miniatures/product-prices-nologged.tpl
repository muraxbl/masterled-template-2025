{if isset($products[0]['precioMinimo'])}
   {foreach from=$products item='product_price'}
      {if $product_price.id_product == $product.id_product}
         {if $product_price.precioMinimo['noTax'] > 0}
            <span itemprop="price" class="price" content="{$product_price.precioMinimo['tax']}" >desde {$product_price.precioMinimo['tax']|number_format:2:",":"."}€ 
                  <span style="font-size:0.8em;">IVA Incluido</span>
            </span>
         {else}
            {if $configuration.display_prices_tax_incl}
            {math assign="precio_con_iva" equation="x * y" x=$product.price_amount y=1.21}
               <span itemprop="price" class="price" content="{$precio_con_iva|number_format:2}">{$precio_con_iva|number_format:2:",":""} 
                  <span style="font-size:0.8em;">IVA Incluido</span>
               </span>
            {else}
               <span itemprop="price" class="price" content="{$product.price_amount}">{$product.price} 
                  <span style="font-size:0.8em;">IVA Incluido</span>
               </span>
            {/if}
         {/if}
      {/if}
   {/foreach}
{else}
    {if $configuration.display_prices_tax_incl}
            {math assign="precio_con_iva" equation="x * y" x=$product.price_amount y=1.21}
               <span itemprop="price" class="price" content="{$precio_con_iva|number_format:2}">{$precio_con_iva|number_format:2:",":""} 
                  <span style="font-size:0.8em;">IVA Incluido</span>
               </span>
            {else}
               <span itemprop="price" class="price" content="{$product.price_amount}">{$product.price} 
                  <span style="font-size:0.8em;">IVA Incluido</span>
               </span>
            {/if}
{/if}