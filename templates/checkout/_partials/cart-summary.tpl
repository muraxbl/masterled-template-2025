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
<section id="js-checkout-summary" class="card js-cart" data-refresh-url="{$urls.pages.cart}?ajax=1&action=refresh">
  <div class="card-block">
    {if $page.page_name == 'checkout'}<a class="btn btn-secondary" style="margin:4px 0 10px 0;" href="{$urls.pages.cart}?action=show"><span style="font-weight: bold;">{l s='Editar carrito' d='Shop.Theme.Checkout'}</span></a>{/if}
    <br>
    {block name='hook_checkout_summary_top'}
      {hook h='displayCheckoutSummaryTop'}
    {/block}

    {block name='cart_summary_products'}
      <div class="cart-summary-products">
<p>PRODUCTOS PRODUCTOS</p>
        <p>
          {if $page.page_name=='checkout'}
            {$cart_summary = " "|explode:$cart.summary_string}
            {if isset($ml_excesos.excesos_price) AND $ml_excesos.excesos_price > 0}
              {$cart_summary.0|floatval-1} {$cart_summary.1}
            {else}
              {$cart.summary_string}
            {/if}
          {else}
            {$cart.summary_string}
          {/if}
          
        </p>

        <p>
          <a href="#" data-toggle="collapse" data-target="#cart-summary-product-list">
            {l s='show details' d='Shop.Theme.Actions'}
            <i class="material-icons">expand_more</i>
          </a>
        </p>

        {block name='cart_summary_product_list'}
          <div class="collapse" id="cart-summary-product-list">
            <ul class="media-list">
              {foreach from=$cart.products item=product}
              {if isset($ml_excesos)}
              {if $product.id_product == $ml_excesos.excesos_product_id}{continue}{/if}
              {/if}

                <li class="media">{include file='checkout/_partials/cart-summary-product-line.tpl' product=$product}</li>
              {/foreach}
            </ul>
          </div>
        {/block}
      </div>
    {/block}

  {block name='cart_summary_subtotals'}
    {include file='checkout/_partials/cart-summary-subtotals.tpl' cart=$cart}
  {/block}

  </div>

  {block name='cart_summary_totals'}
    {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
  {/block}

  {block name='cart_summary_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block}

</section>
