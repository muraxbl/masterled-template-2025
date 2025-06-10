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
{if $elements}
{assign var='elements_1' value=[]}
  {$elements_1[0] = [
    'image' => $urls.img_url|cat:'icons/trustwidget/seguro.svg',
    'text' => $elements[0].text|escape:'html':'UTF-8'
  ]}
  {$elements_1[1] = [
    'image' => $urls.img_url|cat:'icons/trustwidget/shipping.svg',
    'text' => $elements[1].text|escape:'html':'UTF-8'
  ]}
  {$elements_1[2] = [
    'image' => $urls.img_url|cat:'icons/trustwidget/cambio.svg',
    'text' => $elements[2].text|escape:'html':'UTF-8'
  ]}
  {$elements_1[3] = [
    'image' => $urls.img_url|cat:'icons/trustwidget/warranty.svg',
    'text' => $elements[3].text|escape:'html':'UTF-8'
  ]}  

  <div id="block-reassurance">
    <ul>
      {foreach from=$elements_1 item=element}
        <li>
          <div class="block-reassurance-item">
            <img width="25" src="{$element.image}" alt="{$element.text}">
            <span class="h6">{$element.text}</span>
          </div>
        </li>
      {/foreach}
    </ul>
  </div>
{/if}
