{if isset($products[0]['precioMinimo'])}
              {foreach from=$products item='product_price'}

              {if $product_price.id_product == $product.id_product}
              {if $product_price.precioMinimo['noTax'] > 0}
              <span itemprop="price" class="price" content="{$product_price.precioMinimo['noTax']}" >
                desde 
                {if $product.price_amount > $product.price_tax_exc}
                  {$product_price.precioMinimo['tax']|number_format:2:",":"."}€
                {else}
                  {$product_price.precioMinimo['noTax']|number_format:2:",":"."}€ 
                {/if}
                 {if $product.price_amount > $product.price_tax_exc}
                  <small style="font-size:0.65em;">IVA Incluido</small>
                {else}
                   <span style="font-size:0.65em;">+ IVA</span>
                {/if}
              </span>
              {else}
              {if $product.id_category_default == 254}
                {math assign=precio_sin_descuento equation="(x * 10) / 6" x=$product.price_amount}
                <span class="price anterior" style="text-decoration: rgba(0,0,0,0.8) line-through solid;color: #aaa;font-size:1.5em;line-height:1.8;position: relative;font-weight:300 !important">{$precio_sin_descuento|number_format:2:",":"."}€</span>
                <br>
              {/if}
              <span itemprop="price" class="price" content="{$product.price_amount}">

                {$product.price} 
                 {if $product.price_amount > $product.price_tax_exc}
                  <span style="font-size:0.65em;">IVA Incluido</span>
                {else}
                   <span style="font-size:0.65em;">+ IVA</span>
                {/if}
              </span>
              {/if}
              {/if}
              {/foreach}
              {else}
              <span itemprop="price" class="price" content="{$product.price_amount}">
                {$product.price} 
                 {if $product.price_amount > $product.price_tax_exc}
                  <span style="font-size:0.8em;">IVA Incluido</span>
                {else}
                   <span style="font-size:0.8em;">+ IVA</span>
                {/if}
              </span>
              {/if}