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
<section class="product-discounts">
  {if $product.quantity_discounts}
    {block name='product_discount_table'}
      <div class="volume-discount-box">
        <div class="discount-header">
          <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="currentColor">
            <path
              d="M446-80q-15 0-30-6t-27-18L103-390q-12-12-17.5-26.5T80-446q0-15 5.5-30t17.5-27l352-353q11-11 26-17.5t31-6.5h287q33 0 56.5 23.5T879-800v287q0 16-6 30.5T856-457L503-104q-12 12-27 18t-30 6Zm0-80 353-354v-286H513L160-446l286 286Zm253-480q25 0 42.5-17.5T759-700q0-25-17.5-42.5T699-760q-25 0-42.5 17.5T639-700q0 25 17.5 42.5T699-640ZM480-480Z" />
          </svg>
          <h3>Descuentos por volumen</h3>
        </div>
        <ul class="discount-list">
        {foreach from=$product.quantity_discounts item='quantity_discount' name='quantity_discounts'}
          <li><span class="tier">📦 {l s='+ de' d='Shop.Theme.Catalog'} {$quantity_discount.quantity} {l s="unidades" d='Shop.Theme.Catalog'}</span>
        {if $quantity_discount.reduction_type == 'percentage'}
          {assign var="precio_con_descuento" value=$product.price_without_reduction_without_tax - ($product.price_without_reduction_without_tax*$quantity_discount.reduction)}
          <span class="price_volume">{$precio_con_descuento|number_format:5:",":"."}€</span>
        {else}
          <span class="price_volume">{$quantity_discount.price|number_format:2:",":"."}€</span>
        {/if}
          </li>
        {/foreach}
        </ul>
        <p class="note">⚡ Descuento automático en el carrito</p>
      </div>
      <!-- Muestra precios por cantidad -->

      {*   

<!-- CODIGO ORIGINAL -->
   <table class="table-product-discounts">
        <thead>
        <tr>
          <th>{l s='Quantity' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Precio' d='Shop.Theme.Catalog'}</th>
        </tr>
        </thead>
        <tbody>
        {foreach from=$product.quantity_discounts item='quantity_discount' name='quantity_discounts'}
          <tr data-discount-type="{$quantity_discount.reduction_type}" data-discount="{$quantity_discount.real_value}" data-discount-quantity="{$quantity_discount.quantity}">
            <td>{$quantity_discount.quantity}</td>
            <td>{$quantity_discount.price|number_format:2:".":","}€</td>
          </tr>
        {/foreach}
        </tbody>
      </table>
*}
    {/block}
  {/if}
</section>