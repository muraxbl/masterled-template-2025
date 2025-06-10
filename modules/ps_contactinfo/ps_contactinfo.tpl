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

<div class="block-contact col-12 col-md-3 links wrapper">
  <div class="">
    <p class="h4 block-contact-title">{l s='Store information' d='Shop.Theme.Global'}</p>
      {$contact_infos.address.formatted nofilter}
      {if $contact_infos.phone}
        <br>
        <br>
        {* [1][/1] is for a HTML tag. *}
        <span>
        <span class="material-symbols-outlined align-middle" style="transform: scale(-1,1);">phone_enabled</span>
        {l s='[1]%phone%[/1]'
          sprintf=[
          '[1]' => '<span>',
          '[/1]' => '</span>',
          '%phone%' => $contact_infos.phone
          ]
          d='Shop.Theme.Global'
        }
        </span>
      {/if}
      {if $contact_infos.fax}
        <br>
        {* [1][/1] is for a HTML tag. *}
        {l
          s='Fax: [1]%fax%[/1]'
          sprintf=[
            '[1]' => '<span>',
            '[/1]' => '</span>',
            '%fax%' => $contact_infos.fax
          ]
          d='Shop.Theme.Global'
        }
      {/if}
      {if $contact_infos.email}
        <br>
        {* [1][/1] is for a HTML tag. *}
        <span>
        <span class="material-symbols-outlined align-middle">mail</span>
        {l
          s='[1]%email%[/1]'
          sprintf=[
            '[1]' => '<a href="mailto:'|cat:$contact_infos.email|cat:'" class="dropdown">',
            '[/1]' => '</a>',
            '%email%' => $contact_infos.email
          ]
          d='Shop.Theme.Global'
        }
        </span>
      {/if}
  </div>
  <div class="d-none">
    <div class="title">
      <a class="h3" href="{$urls.pages.stores}">{l s='Store information' d='Shop.Theme.Global'}</a>
    </div>
  </div>
</div>
