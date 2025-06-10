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

{function name="categories" nodes=[] depth=0}
  {strip}
    {if $nodes|count}
      <ul class="category-sub-menu">
        {foreach from=$nodes item=node}
        {if $node.id == 254}{continue}{/if}
          <li data-depth="{$depth}" {if $node.children}class="haschildren closeli"{/if} {if $page.page_name == 'category' && $page.page_name != 'product'}{if $category.id && $node.id == $category.id}id="currentCat"{/if}{/if}>
            {if $depth===0}
              <a href="{$node.link}">
                {if $node.id == 190}
                  {assign var=solarled value=" "|explode:$node.name}
                  {foreach from=$solarled item=parte name=nodename}
                    {if $parte|strstr:"SOLAR" OR $parte|strstr:"SOLAIRE" OR $parte|strstr:"SOLARE"}
                      <span class="solar">{$parte}</span>{if $smarty.foreach.nodename.last}{else}&nbsp;{/if}
                    {else}
                      {$parte}{if $smarty.foreach.nodename.last}{else}&nbsp;{/if}
                    {/if}
                  {/foreach}
                {else}
                  {$node.name}
                {/if}
              </a>
              {if $node.children}
                {* OLD CODE
                {if $depth > 0}<div class="navbar-toggler collapse-icons" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="material-icons add">&#xE145;</i>
                  <i class="material-icons remove">&#xE15B;</i>
                </div>{/if}
                *}
                <div class="subli" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {else}
              <a class="category-sub-link{if $page.page_name == 'category' && $page.page_name != 'product'}{if $node.id == $category.id} currentcatlink"{/if}{/if}" href="{$node.link}">
                {if $node.id == 190}
                  {assign var=solarled value=" "|explode:$node.name}
                  {foreach from=$solarled item=parte name=nodename}
                    {if $parte|strstr:"SOLAR" OR $parte|strstr:"SOLAIRE" OR $parte|strstr:"SOLARE"}
                      <span class="solar">{$parte}</span>{if $smarty.foreach.nodename.last}{else}&nbsp;{/if}
                    {else}
                      {$parte}{if $smarty.foreach.nodename.last}{else}&nbsp;{/if}
                    {/if}
                  {/foreach}
                {else}
                  {$node.name}
                {/if}
              </a>
              {if $node.children}
               {* OLD CODE
               <span class="arrows" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="material-icons arrow-right">&#xE315;</i>
                  <i class="material-icons arrow-down">&#xE313;</i>
                </span>*}
                <div class="subli" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {/if}
          </li>
        {/foreach}
        {foreach from=$nodes item=node}
        {if $node.id == 254}
        <li data-depth="{$depth}" {if $node.children}class="haschildren closeli"{/if} {if $page.page_name == 'category' && $page.page_name != 'product'}{if $category.id && $node.id == $category.id}id="currentCat"{/if}{/if}>
              <a href="{$node.link}">
                <span style="color:red">{$node.name}</span>
              </a>
          </li>
        {break}
        {/if}
        {/foreach}
      </ul>
    {/if}
  {/strip}
{/function}
<div class="block-categories d-none d-sm-none d-md-block">
  <ul class="category-top-menu">
    <li><a class="text-uppercase h6" href="{$categories.link nofilter}">{$categories.name}</a></li>
    <li>{categories nodes=$categories.children}</li>
  </ul>
</div>
