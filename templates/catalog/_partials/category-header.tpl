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
<div id="js-product-list-header">
    {if isset($smarty.get.id_category) && $smarty.get.id_category == 93}
    
    {else}
    
    {/if}
        
    {if isset($smarty.get.category) AND $smarty.get.category == '188'}
    <style>
        .combina-container {
            display: flex;
            flex-wrap: nowrap;
            gap: 1%;
            margin-bottom: 2.5rem;
        }
        .combina-container a {
            position: relative;
            transition: all .2s ease-out;
        }
        a.textil-enlace {
            display: block;
            flex: 1 1 48%;
            aspect-ratio: 2 / 1;
            background-image: url(https://www.masterled.es/themes/masterled/assets/img/textil-cable.jpg);
            background-size: cover;
        }
        a.canalizacion-enlace {
            display: block;
            flex: 1 1 48%;
            background-image: url(https://www.masterled.es/themes/masterled/assets/img/canalizacion.jpg);
            text-align: right;
            background-size: cover;
        }
        .combina-container a span {
            position: absolute;
            top:50%;
            left: 50%;
            transform: translate(-50%, -50%);
            -webkit-transform: translate(-50%, -50%);
            font-weight: bold;
            color:white;
            font-size: clamp(12px, 2.5em, 26px);
            transition: all .2s ease-out;
        }
        .combina-container a > .combina-overlay {
            position:absolute;top:0;left:0;right:0;bottom:0;background:rgba(0,0,0,0.5);transition:all .2s ease-out;
        }
        .combina-container a:hover .combina-overlay {
            opacity:0.3
        }
        .combina-container a:hover > span {
            text-shadow: 0 0 9px rgba(0,0,0,0.4);
        }
    </style>
    <div>
                <h2>Combínalos con:</h2>
                <div class="combina-container" style="display:flex;">
                    <a href="" class="textil-enlace"><div class="combina-overlay"></div> <span>Cable textil</span></a>
                    <a href="" class="canalizacion-enlace"><div class="combina-overlay"></div><span>Canalización metálica</span></a>
                </div>
            </div>
    
</div>
{/if}
<div class="row">
    <div class="col-xs-12">
        {block name="faceted_search"}
        
        {hook h='displayCategoryFilters'}
        {/block}
    </div>
</div>
