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
{block name='head_charset'}
  <meta charset="utf-8">
{/block}
{block name='head_ie_compatibility'}
  <meta http-equiv="x-ua-compatible" content="ie=edge">
{/block}




{block name='head_seo'}
  <title>
    {block name='head_seo_title'}
      {$page.meta.title} {if $page.page_name == 'index'} - {l s ='Tu tienda LED de confianza' d='Shop.Theme.Head'}{/if}
    {/block}
  </title>
  <meta name="description" content="{block name='head_seo_description'}{$page.meta.description}{/block}">
  <meta name="keywords" content="{block name='head_seo_keywords'}{$page.meta.keywords}{/block}">
  {if $page.meta.robots !== 'index'}
  <meta name="robots" content="{$page.meta.robots}">
  {/if}
  {if $page.canonical}
  {if isset($smarty.get.page)}
    <link rel="canonical" href="{$page.canonical|regex_replace:'/\?.*/':''}">
  {else}
    <link rel="canonical" href="{$page.canonical}">
  {/if}
  
  {/if}
  {if !$page.canonical}
    {if $page.page_name == 'new-products' OR $page.page_name == 'best-sales' OR $page.page_name == 'contact'}

      <link rel="canonical" href="{$urls.current_url|regex_replace:'/\?.*/':''}">

    {/if}
  {/if}
{block name='head_hreflang'}
{foreach from=$urls.alternative_langs item=pageUrl key=code}
{assign var=idioma value=$code|substr:0:2}
{if $page.page_name == 'product'}
{if isset($smarty.get.id_product_attribute) && $smarty.get.id_product_attribute <> 0}
{else}
{if $idioma == $language.iso_code}{*{continue}*}{/if}
  <link rel="alternate" href="{$pageUrl}" hreflang="{$code}">
{/if}
{else}
  <link rel="alternate" href="{$pageUrl}" hreflang="{$code}">
{/if}
{/foreach}
{/block}
{/block}

{block name='head_viewport'}

  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1">

{/block}

{block name='head_icons'}
  <link rel="icon" type="image/vnd.microsoft.icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
  <link rel="shortcut icon" type="image/x-icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
{/block}

{block name='stylesheets'}
  {include file="_partials/stylesheets.tpl" stylesheets=$stylesheets}
{/block}

{block name='javascript_head'}
  {include file="_partials/javascript.tpl" javascript=$javascript.head vars=$js_custom_vars}
{/block}
{if $page.page_name == 'index'}
{block name='og_index'}
<meta property="og:title" content="{$page.meta.title}" />
<meta property="og:type" content="website" />
<meta property="og:url" content="{$urls.current_url}" />
<meta property="og:image" content="{$urls.img_ps_url}masterled-hero.png" />

{/block}
{/if}
{block name='hook_header'}
  {$HOOK_HEADER nofilter}
{/block}

{block name='hook_extra'}
<style>
  {if $page.page_name != 'index'} 
@media (max-width:767px) {
  #displaysearchbartop {
  top:50px !important;
}
  #header .header-nav {
    z-index:999;
  }

}
{/if}
{if $page.page_name == 'cms'}
  {if $cms['id'] == 7}
    .page-header h1 {
      display: block;
      position: relative;
      max-width: 1200px;
      float: none;
      margin-left: auto;
      margin-right: auto
    }
  {/if}
{/if}
.ts-wdg-loc-hp-wrapper {
    display: block !important;
    max-width: 1660px;
    float: none;
    margin-left: auto;
    margin-right: auto;
}
</style>
{/block}

{if $page.page_name == 'index'}
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
/>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

{/if}
<script src="https://integrations.etrusted.com/applications/widget.js/v2" async defer></script>
