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
{block name='cart_detailed_totals'}
{assign var=tasa value=false}
{assign var=resta value=0}
 {foreach from=$cart.products item=product}
    {if isset($ml_excesos)}
      {if $product.id_product == $ml_excesos.excesos_product_id}
        {$tasa = true}
        {$resta = $product.price_without_reduction_without_tax}
        
        {break}
      {/if}
    {/if}
  {/foreach}
<div class="cart-detailed-totals">

  <div class="card-block">
    {foreach from=$cart.subtotals item="subtotal"}
      {if $subtotal.value && $subtotal.type !== 'tax'}
      {if $subtotal.type !== 'shipping'}
        <div class="cart-summary-line" id="cart-subtotal-{$subtotal.type}">
        {if 'products' == $subtotal.type}
          <a class="verarticulos" href="#cart-products">
        {/if}
          <span class="label{if 'products' === $subtotal.type} js-subtotal{/if}">
            {if 'products' == $subtotal.type}
              {$cart_summary = " "|explode:$cart.summary_string}
              {if $tasa == true}{$cart_summary.0|floatval-1} {$cart_summary.1}{else}{$cart.summary_string}{/if}
            {elseif "gift_wrapping" == $subtotal.type}
              {l s='Envío anónimo' d='Shop.Theme.Checkout'}
            {else}
              {$subtotal.label}
            {/if}
          </span>
          <span class="value">
            {if 'discount' == $subtotal.type}-&nbsp;{/if}

            {if 'products' == $subtotal.type}
              
              {if $tasa==true}
              
                {assign var=totalproductos value=$subtotal.amount-$resta}
                {Tools::displayPrice($totalproductos,$currency)}
              {else}
                {$subtotal.value}
              {/if}
            {else}
              {$subtotal.value}
            {/if}
          </span>
          {if 'products' == $subtotal.type}
          </a>
        {/if}
          {if $subtotal.type === 'shipping'}
              <div><small class="value">{hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}</small></div>
          {/if}
        </div>
        {/if}
      {/if}
    {/foreach}
  </div>

  {block name='cart_summary_totals'}
    {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
  {/block}

  {block name='cart_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block}
</div>
{/block}
