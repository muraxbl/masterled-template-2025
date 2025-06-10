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

<div class="card-block cart-summary-subtotals-container">

  {foreach from=$cart.subtotals item="subtotal"}
    {if $subtotal.type == 'shipping' AND $subtotal.amount == 0}
          {if isset($cart.id_address_delivery)}
            {assign var=pais value="No"}
            {foreach from=$customer.addresses item="direccion"}
              {if $direccion.id == $cart.id_address_delivery}
                {$pais = $direccion.country}
                {break}               
              {/if}
            {/foreach}
            {if $pais == 'España'}
            
            {else}
              {continue}
            {/if}
          {else}
            {continue}
          {/if}
      {/if}
    {if $subtotal.value && $subtotal.type !== 'tax'}
      <div class="cart-summary-line cart-summary-subtotals" id="cart-subtotal-{$subtotal.type}">

        <span class="label" {if $subtotal.type == 'shipping' AND $cart.id_address_delivery == 0}style="display:none;"{/if}>
          {if $subtotal.type == 'gift_wrapping' && $language.iso_code == 'fr'}
          Expédition anonyme
          {elseif $subtotal.type == 'gift_wrapping' && $language.iso_code == 'de'}
          Unmarkierter Versand
          {elseif $subtotal.type == 'gift_wrapping' && $language.iso_code == 'pt'}
          Transporte não marcado
          {elseif $subtotal.type == 'gift_wrapping' && $language.iso_code == 'it'}
          Spedizione anonima
          {else}
            {$subtotal.label}
          {/if}
          
          
        </span>
        
        <span class="value" {if $subtotal.type == 'shipping' AND $cart.id_address_delivery == 0}style="display:none;"{/if}>
            {if $subtotal.type == 'products'}
            {assign var=resta value=0}
            {if isset($ml_excesos.excesos_price) AND $ml_excesos.excesos_price > 0}
                {assign var=resta value=$ml_excesos.excesos_price}
            {/if}

            {$subtotal.amount - $resta|number_format:2:",":""} €
          {else}
            {$subtotal.value}
          {/if}
        </span>
      </div>
    {/if}
  {/foreach}
   {if isset($ml_excesos.excesos_price) AND $ml_excesos.excesos_price    > 0}
        <div class="cart-summart-line cart-summary-subtotals" id="cart-subtotal-tasa">
          <span class="label">
            {l s='Tasa medidas especiales' d='Shop.Themes.Checkout'}
          </span>
          <span class="value" style="float:right">{$ml_excesos.excesos_price|number_format:2:",":""} €</span>
        </div>
      {/if}

</div>

