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
* @author PrestaShop SA <contact@prestashop.com>
    * @copyright 2007-2019 PrestaShop SA and Contributors
    * @license https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
    * International Registered Trademark & Property of PrestaShop SA
    *}
    {assign var="variantes_names" value=['Temperatura color','Color','Temperatura de cor','Température de couleur','Farbtemperatur','Temperatura del colore']}
    <div class="product-variants">
        {foreach from=$groups key=id_attribute_group item=group}
        {if !empty($group.attributes)}
        <div class="clearfix product-variants-item">
            {if !in_array($group.group_name, $variantes_names)}
            {if $group.attributes|@count == 1}
            {else}
            <span class="control-label">{$group.name}</span>
            {/if}
            {/if}
            {if $group.group_type == 'select'}
            <select class="form-control form-control-select" id="group_{$id_attribute_group}" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]">
                {foreach from=$group.attributes key=id_attribute item=group_attribute}
                <option value="{$id_attribute}" title="{$group_attribute.name}" {if $group_attribute.selected} selected="selected" {/if}>{$group_attribute.name} </option> {/foreach} </select> {elseif $group.group_type=='color' } <ul id="group_{$id_attribute_group}">
                    {if $group.attributes|@count gt 1}
                    {$atributos = 1}
                    {else}
                    {$atributos = 0}
                    {/if}
                    {foreach from=$group.attributes key=id_attribute item=group_attribute}
                    {if $product.id == 1719}
                    {if $id_attribute == 26}
                    {continue}
                    {/if}
                    {/if}
                    {if $atributos == 1}
                    {$stockproducto = $group.attributes_quantity[{$id_attribute|intval}]}
                    {else}
                    {$stockproducto = $product.quantity}
                    {/if}
                    <li class="input-container">
                        <label>
                            <input class="input-color" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" {if $group_attribute.selected} checked="checked" {/if}> <span {if $group_attribute.html_color_code && !$group_attribute.texture}class="color" style="background-color: {$group_attribute.html_color_code}" {/if} {if $group_attribute.texture}class="color texture" style="background-image: url({$group_attribute.texture})" {/if}><span class="sr-only">{$group_attribute.name}</span></span>
                        </label>&nbsp;
                        <span id="product-availability">
                            <span class="{if  $stockproducto > 0 }product_enstocklabel{else}{if $product.allow_oosp}product_reservalabel{else}product_agotadolabel{/if}{/if}">
                                <i class="material-icons rtl-no-flip" style="color:white;{if $stockproducto <= 0}transform:scaleX(-1);-webkit-transform:scaleX(-1){/if}">{if $stockproducto > 0}&#xE5CA;{else}{if $product.allow_oosp}history{else}clear{/if}{/if}</i>&nbsp;
                                {if $group.attributes_quantity[{$id_attribute|intval}] > 0}
                                {l s='En Stock' d='Shop.Theme.Disponibilidad'}
                                {if $product.id_category_default == 254}
                                - {$group.attributes_quantity[{$id_attribute|intval}]} {l s='Unidades disponibles' d='Shop.Theme.Disponibilidad'}
                                {/if}
                                {else}
                                {if $product.allow_oosp}{l s='Reserva: ' d='Shop.Theme.Catalog'}
                                {*{if $product.available_now}
                                {$product.available_now}: ~ {"+55 days"|date_format:"%d/%m/%Y"}
                                {else}
                                {l s='Reserva: ' d='Shop.Theme.Catalog'}
                                {$product.available_later}
                                {/if}
                                *}
                                {if $fecha_reabastecimiento != ""}
                                {$fecha_reabastecimiento}
                                {else}
                                {if $product.available_later}
                                {$product.available_later}
                                {else}
                                ~ {"+55 days"|date_format:"%d/%m/%Y"}
                                {/if}
                                {/if}
                                {else}{l s='Agotado' d='Shop.Theme.Disponibilidad'}{/if}
                                {/if}</span>
                            }
                        </span>
                    </li>
                    {/foreach}
                    </ul>
                    {elseif $group.group_type == 'radio'}
                      {if $group.attributes|@count gt 0}
                        <ul id="group_{$id_attribute_group}">
                          <style>
                            .product-variants .input-container {
                              border: none !important;
                              margin: 0 .625rem 0.7rem 0;
                              position: relative;
                            }
                            .product-variants .input-container label {
                                width: 100%;
                                text-align: left;
                                padding: .5rem;
                                border: 2px solid rgba(0, 0, 0, 0);
                                margin: 0 .625rem 0.7rem 0;
                                border-radius: 7px;
                                /* padding: .5rem; */
                                transition: all .3s ease-out;
                                position: relative;
                                display: grid;
                                grid-template-areas:
                                    "input copy"
                                    "input availability";
                                grid-template-columns: 50px 1fr;
                                align-items: center;
                                align-content: center;
                                grid-template-rows: max-content;
                            }
                            .product-variants li.input-container > label::before {
                                content: '';
                                position: absolute;
                                top: 0;
                                left: 0;
                                bottom: 0;
                                right: 0;
                                border: 1px solid rgba(0, 0, 0, 0.1);
                                border-radius: 7px;
                            }
                            .product-variants li.input-container:hover > label {
                              border:2px solid rgba(25,35,150,.6);

                            }
                            .product-variants li.input-container > input:checked + label {
                              border:2px solid rgba(25,35,150,.6);

                            }
                            .product-variants li.input-container >  input {
                              display:none;margin:0;width: 0;height: 0;
                            }
                            .product-variants li.input-container > label > .span-input {
                              grid-row-start: 1;
                              gris-row-end: 2;
                              grid-area: input;
                              display:flex;
                              justify-content: center;
                              align-items: center;
                              position: relative;
                              transition: all .2s ease-out;
                            }
                            .product-variants li.input-container > label > .span-input > .check-pretty {
                              border-radius: 100vw;
                              width: 25px;
                              height: 25px;
                              background:#fafafa ;
                              position: relative;
                              color:#ccc;
                              transition: all .2s ease-out;
                            }
                            .product-variants li.input-container > label > .span-input > .check-pretty::after {
                              content:'\e5ca';
                              width:100%;
                              height: 100%;
                              font-family: 'Material symbols outlined';
                              font-size: 1.2rem;
                              position: absolute;
                              top:50%;
                              left:50%;
                              transform:translate(-40%, -38%);
                            }
                            
                            .product-variants li.input-container > input:checked + label > .span-input > .check-pretty {
                              color:#FFF;
                              background:#bad406;
                            }
                            .product-variants li.input-container > label > .radio-label {
                              grid-area: copy;
                            }
                            .product-variants li.input-container > label > .product-availability {
                              grid-area: availability;
                            }
                            #product-availability {
                              font-weight: 300;
                            }
                            .variante_color {
                              border-radius: 100vw;
                              border: 2px solid rgba(0,0,0,0.2);
                              padding:2px;
                              height: 25px;
                              width: 25px;
                              position: absolute;
                              right: .5rem;
                              top: 50%;
                              transform: translate(0, -50%);
                              overflow: hidden;

                            }
                            .variante_color > span {
                              display: block;
                              width:100%;
                              height: 100%;
                              border-radius: 100vw;
                            }
                            .variante_color >.c21 {
                              background: #fafafa;
                            }
                            .variante_color >.c25 {
                              background: #ffed65;
                            }
                            .variante_color >.c26 {
                              background: rgb(251,63,63);
                              background: linear-gradient(
                              90deg,
                              rgba(255, 0, 0, 1) 0%,
                              rgba(255, 154, 0, 1) 10%,
                              rgba(208, 222, 33, 1) 20%,
                              rgba(79, 220, 74, 1) 30%,
                              rgba(63, 218, 216, 1) 40%,
                              rgba(47, 201, 226, 1) 50%,
                              rgba(28, 127, 238, 1) 60%,
                              rgba(95, 21, 242, 1) 70%,
                              rgba(186, 12, 248, 1) 80%,
                              rgba(251, 7, 217, 1) 90%,
                              rgba(255, 0, 0, 1) 100%
                              );
                            }
                            .variante_color >.c70 {
                              background: blue;
                            }
                            .variante_color >.c86 {
                              background: #fff9ae;
                            }
                            .variante_color >.c87 {
                              background: red;
                            }
                            .variante_color >.c88 {
                              background: green;
                            }
                            .variante_color >.c92 {
                              background: pink;
                            }
                            .variante_color >.c104 {
                              background: rgb(251,63,63);
                              background: linear-gradient(
                              90deg,
                              rgba(255, 0, 0, 1) 0%,
                              rgba(255, 154, 0, 1) 10%,
                              rgba(208, 222, 33, 1) 20%,
                              rgba(79, 220, 74, 1) 30%,
                              rgba(63, 218, 216, 1) 40%,
                              rgba(47, 201, 226, 1) 50%,
                              rgba(28, 127, 238, 1) 60%,
                              rgba(95, 21, 242, 1) 70%,
                              rgba(186, 12, 248, 1) 80%,
                              rgba(251, 7, 217, 1) 90%,
                              rgba(255, 0, 0, 1) 100%
                              );
                            }
                            .variante_color >.c120 {
                              background: rgb(250,250,250);
                              background: -moz-linear-gradient(90deg, rgba(250,250,250,1) 0%, rgba(250,250,250,1) 25%, rgba(255,255,213,1) 26%, rgba(255,255,213,1) 66%, rgba(215,217,255,1) 67%);
                              background: -webkit-linear-gradient(90deg, rgba(250,250,250,1) 0%, rgba(250,250,250,1) 25%, rgba(255,255,213,1) 26%, rgba(255,255,213,1) 66%, rgba(215,217,255,1) 67%);
                              background: linear-gradient(90deg, rgba(250,250,250,1) 0%, rgba(250,250,250,1) 25%, rgba(255,255,213,1) 26%, rgba(255,255,213,1) 66%, rgba(215,217,255,1) 67%);
                              filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#fafafa",endColorstr="#d7d9ff",GradientType=1);
                            }
                            .variante_color >.c139 {
                              background: orange;
                            }
                            .variante_color >.c158 {
                              background: rgb(251,63,63);
                              background: linear-gradient(
                              90deg,
                              rgba(255, 0, 0, 1) 0%,
                              rgba(255, 154, 0, 1) 10%,
                              rgba(208, 222, 33, 1) 20%,
                              rgba(79, 220, 74, 1) 30%,
                              rgba(63, 218, 216, 1) 40%,
                              rgba(47, 201, 226, 1) 50%,
                              rgba(28, 127, 238, 1) 60%,
                              rgba(95, 21, 242, 1) 70%,
                              rgba(186, 12, 248, 1) 80%,
                              rgba(251, 7, 217, 1) 90%,
                              rgba(255, 0, 0, 1) 100%
                              );
                            }
                            .variante_color >.c164 {
                              background: #d243ff;
                            }

                          </style>
                            {if $group.attributes|@count gt 1}
                              {$atributos = 1}
                            {else}
                              {$atributos = 0}
                            {/if}
                              {if $group.attributes|@count == 0}
                              {else}
                                {foreach from=$group.attributes key=id_attribute item=group_attribute}
                                  {if $product.id == 1719}
                                    {if $id_attribute == 26}
                                      {continue}
                                    {/if}
                                  {/if}
                                  {if $atributos == 1}
                                    {$stockproducto = $group.attributes_quantity[{$id_attribute|intval}]}
                                  {else}
                                    {$stockproducto = $product.quantity}
                                  {/if}
                                  <li class="input-container">
                                      <input class="input-radio" id="{$id_attribute}" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" {if $group_attribute.selected} checked="checked" {/if}>
                                      <label for="{$id_attribute}">
                                          <span class="span-input">
                                            <span class="check-pretty"></span>
                                          </span>
                                          <span class="radio-label">{$group_attribute.name}</span>
                                          <span id="product-availability">
                                              <span style="{if  $stockproducto > 0 }color:green;{else}{if $product.allow_oosp}color:orange;{else}color:red{/if}{/if}">
                                                  <i class="material-icons rtl-no-flip" style="{if $stockproducto <= 0}transform:scaleX(-1);-webkit-transform:scaleX(-1);color:orange{else}color:green;{/if}">
                                                      {if $stockproducto > 0}
                                                      &#xE5CA;
                                                      {else}
                                                      {if $product.allow_oosp}
                                                      history
                                                      {else}
                                                      clear
                                                      {/if}
                                                      {/if}</i>&nbsp;
                                                  {if $stockproducto > 0}
                                                  En Stock
                                                  {if $product.id_category_default == 254}
                                                  - {$group.attributes_quantity[{$id_attribute|intval}]}
                                                  {if $stockproducto > 1}
                                                  {l s='Unidades disponibles' d='Shop.Theme.Disponibilidad'}
                                                  {else}
                                                  {l s='Unidad Disponible' d='Shop.Theme.Disponibilidad'}
                                                  {/if}
                                                  {/if}
                                                  {else}
                                                  {if $product.allow_oosp}{l s='Reserva: ' d='Shop.Theme.Catalog'}
                                                  {*{if $product.available_now}
                                                  {$product.available_now}: ~ {"+55 days"|date_format:"%d/%m/%Y"}
                                                  {else}
                                                  {l s='Reserva: ' d='Shop.Theme.Catalog'}
                                                  {$product.available_later}
                                                  {/if}
                                                  *}
                                                  {if $fecha_reabastecimiento != ""}
                                                  {$fecha_reabastecimiento}
                                                  {else}
                                                  {if $product.available_later}
                                                  {$product.available_later}
                                                  {else}
                                                  ~ {"+55 days"|date_format:"%d/%m/%Y"}
                                                  {/if}
                                                  {/if}
                                                  {else}
                                                  {l s='Agotado' d='Shop.Theme.Disponibilidad'}
                                                  {/if}
                                                  {/if}</span>
                                          </span>
                                          
                                          <div class="variante_color">
                                            <span class="c{$id_attribute}">
                                            </span>
                                          </div>
                                          
                                      </label>
                                  </li>
                                {/foreach}
                              {/if}
                        </ul>
                      {/if}
                    {/if}
        </div>
        {/if}
        {/foreach}
    </div>