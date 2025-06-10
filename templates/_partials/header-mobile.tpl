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
{block name="hook_extra" append}
<style>
  
</style>
{/block}
{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}
{block name='header_top'}
  <div class="header-top">
    {if $page.page_name == 'index'}
      <h1 style="display:none;text-indent: -999999px;">Iluminación LED para el hogar, comercio e industria. Masterled.es</h1>
    {/if}
        <!-- LOGO -->
        <div class="menu-icon main-hamburger" onclick="toggleMenu()">
          <svg id="i1" class="icon" width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
        <rect id="first" width="26" height="2" x="0" y="6" rx="0" ry="0" fill="currentColor"/>
        <rect id="aspa2" width="26" height="2" x="0" y="14" rx="0" ry="0" fill="currentColor" />
        <rect id="aspa1" width="26" height="2" x="0" y="14" rx="0" ry="0" fill="currentColor" />
        <rect id="third" width="26" height="2" x="0" y="22" rx="0" ry="0" fill="currentColor"/>
      </svg>
        </div>
          <div class="nav-icons search-mobile">
            <div class="icon-square" id="search-icon">
                <span class="material-symbols-outlined">
                    search
                </span>
            </div>
        </div>
        <div class="logo-wrapper" id="_mobile_logo"><!--<img class="logobrillo" border="0" src="{$urls.img_url}logo-brillo.png">-->
                <a href="{$urls.base_url}">
                  {if isset($smarty.get.logo)}
                      {if $smarty.get.logo == '1'}
                          <img class="imglogo" src="https://desarrollo.masterled.es/themes/master_beta/assets/img/logo-web3.webp?ver=202515051234" alt="{$shop.name}">
                      {elseif $smarty.get.logo == '2'}
                          <img class="imglogo" src="https://desarrollo.masterled.es/themes/master_beta/assets/img/logo-web3.webp?ver=202515051234" alt="{$shop.name}">
                      {else}
                          <img class="imglogo" src="https://desarrollo.masterled.es/themes/master_beta/assets/img/logo-web3.webp" alt="{$shop.name}">
                      {/if}
                  {else}
                      <img class="imglogo" src="https://desarrollo.masterled.es/themes/master_beta/assets/img/logo-web3.webp" alt="{$shop.name}">
                  {/if}

                  
                </a>

        </div>
        <!-- MAIN MENU -->
        
          
          {*hook h='displayTop'*}
          {include file='_partials/menu_header.tpl'}

        <!-- BOTONES NAVEGACION -->
      <div class="nav-icons">
            <div class="icon-square" id="contact-button">
                <span class="material-symbols-outlined">
                    call
                </span>
            </div>
            <div class="icon-square" id="{if $customer.is_logged}account-button-logged{else}account-button{/if}">
                {if $customer.is_logged}<a href="#" role="button" id="user-dropdown-toggle">{/if}
                <span class="material-symbols-outlined{if $customer.is_logged} is_logged{/if}">
                      person
                  </span>
                {if $customer.is_logged}</a>{/if}
                  {if $customer.is_logged}
                    <ul aria-labelledby="user-dropdown" class="user-dropdown-menu">
                      <li><a href="{$urls.pages.addresses}">{l s='Mis direcciones' d='Shop.Theme.Customer'}</a></li>
                      <li><a href="{$urls.pages.history}">{l s='Mis pedidos' d='Shop.Theme.Customer'}</a></li>
                      <li><a href="{$urls.pages.discount}">{l s='Mis cupones' d='Shop.Theme.Customer'}</a></li>
                      <li><a href="{$urls.pages.identity}">{l s='Mis datos personales' d='Shop.Theme.Customer'}</a></li>
                      <li><a href="{$urls.pages.my_account}">{l s='Mi cuenta' d='Shop.Theme.Customer'}</a></li>
                      <li class="fav"><a href="{$urls.pages.wishlist}">{l s='Mis favoritos' d='Shop.Theme.Customer'}</a></li>
                      <hr>
                      <li><a href="{$urls.actions.logout}">{l s='Cerrar sesión' d='Shop.Theme.Customer'}</a></li>
                    </ul>
                  {/if}
              
            </div>
            <div class="icon-square relative" id="cart-on">
              <a href="{$urls.pages.cart}?action=show">
                <span class="material-symbols-outlined">
                  shopping_cart
                </span>
                <span class="products_in_cart">{if isset($cart) && $cart.products_count == 0}0{else}{$cart.products_count}{/if}</span>
              </a>
      
            </div>
        </div>
      
  </div>
  {hook h='displayNavFullWidth'}
{/block}
{include file='_partials/modales_header_mobile.tpl'}
