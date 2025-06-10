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
<style>


</style>
<div class="product-add-to-cart">
  {if !$configuration.is_catalog}
    <span class="control-label d-none d-md-block">{l s='Quantity' d='Shop.Theme.Catalog'}</span>

    {block name='product_quantity'}
      <div class="product-quantity clearfix">

        <div class="qty">
          <button class="qty-count qty-count--minus" data-action="minus" type="button">-</button>
          <input class="product-qty" type="number"
            name="qty"
            id=""
            value="{$product.quantity_wanted}"
            class="input-group"
            min="{$product.minimal_quantity}"
            aria-label="{l s='Quantity' d='Shop.Theme.Actions'}">
          <button class="qty-count qty-count--add" data-action="add" type="button">+</button>
      </div>

        <div class="add">
          <button
            class="btn btn-primary add-to-cart"
            data-button-action="add-to-cart"
            type="submit"
            {if !$product.add_to_cart_url}
              disabled
            {/if}
          >
            <i class="material-icons shopping-cart">&#xE547;</i><span>
            {if $product.quantity > 0}
            <span class="d-inline d-md-none">
              {l s='Añadir' d='Shop.Theme.Actions'}
            </span>
            <span class="d-none d-md-inline">
              {l s='Add to cart' d='Shop.Theme.Actions'}
            </span>
            
            {else}
            {l s='Reservar' d='Shop.Theme.Actions'}
            {/if}
          </span>
          </button>
        </div>

        {hook h='displayProductActions' product=$product}
      </div>
    {/block}
    {block name='displayAfterAddToCart'}
{hook h='displayAfterAddToCart'}
{/block}
    {if $customer.is_logged}
    {if $customer.id_default_group == '3'}
         <div id="profesional-banner-producto">
        <h3>{l s='Descuentos especiales para el profesional' d='Shop.Theme.Product'}</h3>
        <ul><li>Descuento directo sobre la tarifa PVP</li><li>Descuentos por volumen</li><li>Presupuestos garantizados 60 días</li><li>Asistencia técnica telefónica</li></ul></span> <a class="pro-href"  href="{url entity='cms' id=7 id_lang=$language.id}">{l s='¡REGÍSTRATE!' d='Shop.Theme.Product'}</a>
      </div>
    {else}
    {/if}
    {else}
     <div id="profesional-banner-producto">
        <h3>{l s='Descuentos especiales para el profesional' d='Shop.Theme.Product'}</h3>
        <ul><li>Descuento directo sobre la tarifa PVP</li><li>Descuentos por volumen</li><li>Presupuestos garantizados 60 días</li><li>Asistencia técnica telefónica</li></ul></span> <a class="pro-href"  href="{url entity='cms' id=7 id_lang=$language.id}">{l s='¡REGÍSTRATE!' d='Shop.Theme.Product'}</a>
      </div>
    {/if}

    {block name='product_availability'}
      <span id="product-availability">
        {if $product.quantity > 0}
          {if $customer.is_logged}
          {$esprofesional = ['4','30','31','32','33','40']}
            {if in_array($customer.id_default_group, $esprofesional)}
              <span class="" style="padding: 8px 12px;border:1px solid #00b611;color:#00b611; font-size:1em;display:  block">
                {if $product.quantity <= 50}
                  {l s='Quedan menos de 50 unidades' d='Shop.Theme.Disponibilidad'} 
                {elseif $product.quantity > 50 && $product.quantity <= 100}
                  {l s='+ de 50 unidades' d='Shop.Theme.Disponibilidad'} 
                {elseif $product.quantity > 100 && $product.quantity <= 250}
                  {l s='+ de 100 unidades' d='Shop.Theme.Disponibilidad'} 
                {elseif $product.quantity > 250 && $product.quantity <= 500}
                  {l s='+ de 250 unidades' d='Shop.Theme.Disponibilidad'} 
                {elseif $product.quantity > 500 && $product.quantity <= 1000}
                  {l s='+ de 500 unidades' d='Shop.Theme.Disponibilidad'} 
                {elseif $product.quantity > 1000 && $product.quantity <= 2000}
                  {l s='+ de 1000 unidades' d='Shop.Theme.Disponibilidad'} 
                {elseif $product.quantity > 2000 && $product.quantity <= 3000}
                  {l s='+ de 2000 unidades' d='Shop.Theme.Disponibilidad'} 
                {elseif $product.quantity > 3000 && $product.quantity <= 5000}
                  {l s='+ de 3000 unidades' d='Shop.Theme.Disponibilidad'} 
                {elseif $product.quantity > 5000}
                  {l s='+de 5000 unidades' d='Shop.Theme.Disponibilidad'} 
                {/if}
              {l s='disponibles' d='Shop.Theme.Disponibilidad'}</span>
            {else}
             {* <i class="material-icons rtl-no-flip" >&#xE5CA;</i> {l s='En Stock' d='Shop.Theme.Product'} *}
            {/if}
          {else}
          {*  <i class="material-icons rtl-no-flip" >&#xE5CA;</i> {l s='En Stock' d='Shop.Theme.Product'} *}
          {/if}

        {else}{*SIN STOCK*}
         {* {if $product.allow_oosp}
          <span class="product_reservalabel"><i class="material-icons rtl-no-flip" style="color:white;transform:scaleX(-1);-webkit-transform:scaleX(-1)">history</i>
          {if $product.available_now}
            {$product.available_now}: {"+55 days"|date_format}
          {else}
            {l s='Reserva: ' d='Shop.Theme.Catalog'}{$product.available_later}
          {/if}</span>
          {else}
          <span class="product_agotadolabel"><i class="material-icons" style="color:white">&#xE14B;</i>
          {l s='Agotado' d='Shop.Theme.Product'}</span>
          {/if} *}
        {/if} 
      </span>
    {/block}

    {block name='product_minimal_quantity'}
      <p class="product-minimal-quantity">
        {if $product.minimal_quantity > 1}
          {l
          s='The minimum purchase order quantity for the product is %quantity%.'
          d='Shop.Theme.Checkout'
          sprintf=['%quantity%' => $product.minimal_quantity]
          }
        {/if}
      </p>
    {/block}
  {/if}
</div>

