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
{extends file='layouts/layout-error.tpl'}

{block name='content'}

  <section id="main" style="background-color:#00338e;">

    {block name='page_header_container'}
      <header class="page-header">
        {block name='page_header_logo'}
        <div class="logo"><img src="{$shop.logo}" alt="logo"style="max-width:100%;"></div>
        {/block}

        {block name='hook_maintenance'}
          {$HOOK_MAINTENANCE nofilter}
        {/block}

        {block name='page_header'}
          <h1 style="color:#ffffff;">{block name='page_title'}{l s='We\'ll be back soon.' d='Shop.Theme.Global'}{/block}</h1>
        {/block}
      </header>
    {/block}

    {block name='page_content_container'}
    <style>
      #content > p {
      color:#FFFFFF !important;
      }
    </style>
      <section id="content" class="page-content page-maintenance;color:#ffffff !important;">

        {block name='page_content'}
          {$maintenance_text nofilter}
        {/block}
      </section>
    {/block}

    {block name='page_footer_container'}

    {/block}

  </section>

{/block}
