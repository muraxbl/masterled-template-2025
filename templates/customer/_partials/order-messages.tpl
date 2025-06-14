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
{block name='order_messages_table'}
  {if $order.messages}

    <div class="box messages">
    {*  <h3><a data-toggle="collapse" href="#collapseMessages" role="button" aria-expanded="false" aria-controls="collapseMessages" style="color:#333;text-decoration: none;cursor:hand">{l s='Messages' d='Shop.Theme.Customeraccount'}</a></h3> *}
      <h3><a data-toggle="collapse" href="#collapseMessages" role="button" aria-expanded="false" aria-controls="collapseMessages" style="color:#333;text-decoration: none;cursor:hand">{l s='Messages' d='Shop.Theme.Customeraccount'}</a></h3>

      {foreach from=$order.messages item=message}
      {if $message.date_add|date_format:"%Y" >= 2019}
        {*<div class="message row collapse" id="collapseMessages">*}
        <div class="message row" {if $message.is_new_for_me == 1}style="background-color:rgba(0,255,0,0.1);"{/if}>
          <div class="col-sm-4">
            {$message.name}<br/>
            {$message.message_date}
          </div>
          <div class="col-sm-8">
            {$message.message nofilter}
          </div>
        </div>
      {/if}
      {/foreach}
    </div>
  {/if}
{/block}

{block name='order_message_form'}
  <section class="order-message-form box">
    <form action="{$urls.pages.order_detail}" method="post">

      <header>
        <h3>{l s='Add a message' d='Shop.Theme.Customeraccount'}</h3>
        <p>{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Customeraccount'}</p>
      </header>

      <section class="form-fields">

        <div class="mb-3 row">
          <label class="col-md-3 form-control-label">{l s='Product' d='Shop.Forms.Labels'}</label>
          <div class="col-md-5">
            <select name="id_product" class="form-control form-control-select">
              <option value="0">{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
              {foreach from=$order.products item=product}
                <option value="{$product.id_product}">{$product.name}</option>
              {/foreach}
            </select>
          </div>
        </div>

        <div class="mb-3 row">
          <label class="col-md-3 form-control-label"></label>
          <div class="col-md-9">
            <textarea rows="3" name="msgText" class="form-control"></textarea>
          </div>
        </div>

      </section>

      <footer class="form-footer text-sm-center">
        <input type="hidden" name="id_order" value="{$order.details.id}">
        <button type="submit" name="submitMessage" class="btn btn-primary form-control-submit">
          {l s='Send' d='Shop.Theme.Actions'}
        </button>
      </footer>

    </form>
  </section>
{/block}
