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
<div id="_desktop_user_info">
  <div class="user-info">
    {if $logged}
      <a
        class="logout d-none d-sm-none d-md-block"
        href="{$logout_url}"
        rel="nofollow"
      >
        <i class="material-icons">&#xE7FF;</i>
        {l s='Sign out' d='Shop.Theme.Actions'}
      </a>
      <a
        class="account"
        href="{$my_account_url}"
        title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
        rel="nofollow"
      >
        <i class="material-icons d-md-none logged">&#xE7FF;</i>
        <span class="d-none d-sm-none d-md-block" title="{$customerName}">{$customerName}</span>
      </a>
    {else}
      <a
        href="{if $page.page_name == 'cart' OR $page.page_name == 'checkout'}{$urls.pages.authentication}?back=cart{else}{$my_account_url}{/if}"
        title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
        rel="nofollow"
      >
        <i class="material-icons">&#xE7FF;</i>
        <span class="d-none d-sm-none d-md-block">{l s='Sign in' d='Shop.Theme.Actions'}</span>
      </a>
    {/if}
  </div>
</div>
