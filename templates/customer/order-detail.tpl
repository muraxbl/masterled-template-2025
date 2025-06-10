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
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Order details' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {block name='order_infos'}
    <div id="order-infos">
      <div class="box">
          <div class="row">
            <div class="col-xs-{if $order.details.reorder_url}9{else}12{/if}">
              <strong>
                {l
                  s='Order Reference %reference% - placed on %date%'
                  d='Shop.Theme.Customeraccount'
                  sprintf=['%reference%' => $order.details.reference, '%date%' => $order.details.order_date]
                }
              </strong>
            </div>
            {if $order.details.reorder_url}
              <div class="col-xs-3 text-xs-right">
                <a href="{$order.details.reorder_url}" class="button-primary">{l s='Reorder' d='Shop.Theme.Actions'}</a>
              </div>
            {/if}
            <div class="clearfix"></div>
          </div>
      </div>
      

      <div class="box">
          <ul>
            <li><strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong> {$order.carrier.name}</li>
            <li><strong>{l s='Payment method' d='Shop.Theme.Checkout'}</strong> {$order.details.payment}</li>

            {if $order.details.invoice_url}
              <li>
                <a href="{$order.details.invoice_url}">
                  {l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}
                </a>
              </li>
            {/if}

            {if $order.details.recyclable}
              <li>
                {l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}
              </li>
            {/if}

            {if $order.details.gift_message}
              <li>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}</li>
              <li>{l s='Message' d='Shop.Theme.Customeraccount'} {$order.details.gift_message nofilter}</li>
            {/if}
          </ul>
      </div>
    </div>
  {/block}
 {block name='order_carriers'}
    {if $order.shipping}
      <div class="box">
        <h3><a id="shipping">{l s='Envío' d='Shop.Theme.Checkout'}</a></h3>
        <table class="table table-striped table-bordered d-none d-sm-none d-md-block">
          <thead class="thead-default">
            <tr>
              <th>{l s='Date' d='Shop.Theme.Global'}</th>
              <th>{l s='Carrier' d='Shop.Theme.Checkout'}</th>
              <th>{l s='Weight' d='Shop.Theme.Checkout'}</th>
              <th>{l s='Shipping cost' d='Shop.Theme.Checkout'}</th>
              <th>{l s='Tracking number' d='Shop.Theme.Checkout'}</th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$order.shipping item=line}
              <tr>
                <td>{$line.shipping_date}</td>
                <td>{$line.carrier_name}</td>
                <td>{$line.shipping_weight}</td>
                <td>{$line.shipping_cost}</td>
                <td>
              {if $line.tracking}
                {assign var=seguimiento value=" "|explode:$line.tracking}
                {if $seguimiento.0 == 'MRW'}
                  {*
                  <a target="_blank" href="https://www.mrw.es/seguimiento_envios/MRW_resultados_consultas.asp?modo=nacional&envio={$seguimiento.1}">{$line.tracking nofilter}</a>
                  *}
                {assign var=mrwindividual value="/"|explode:$seguimiento.1}
                MRW <br>
                {foreach $mrwindividual as $bulto}
                  {if $bulto@index == 0}
                    <a target="_blank" href="https://www.mrw.es/seguimiento_envios/MRW_resultados_consultas.asp?modo=nacional&envio={$bulto}">{$bulto}</a><br>
                  {else}
                    {assign var=retroceder value=$bulto|count_characters}

                    {assign var=numeromrwinicial value=$mrwindividual[0]|substr:0:-$retroceder}
                    <a target="_blank" href="https://www.mrw.es/seguimiento_envios/MRW_resultados_consultas.asp?modo=nacional&envio={$numeromrwinicial}{$bulto}">{$numeromrwinicial}{$bulto}</a><br>
                    
                  {/if}
                {/foreach}
                {elseif $seguimiento.0 == 'NACEX'}
                  {assign var="nacex" value="/"|explode:$seguimiento.1}
                  <a target="_blank" href="http://www.nacex.es/seguimientoDetalle.do?agencia_origen={$nacex.0}&numero_albaran={$nacex.1}&estado=1&internacional=0&externo=N&usr=null&pas=null">{$line.tracking nofilter}</a>
                {elseif $seguimiento.0 == 'GLS'}
                  {if $order.addresses.delivery.id_country == '6'}
                    <a target="_blank" href="https://m.gls-spain.es/e/{$seguimiento.1}/{$order.addresses.delivery.postcode}">{$line.tracking nofilter}</a>
                  {else}
                    {assign var=glsindividual value="/"|explode:$seguimiento.1}
                    GLS:<br>
                    {if $glsindividual|@count gt 1}

                      {foreach $glsindividual as $numero}
                        {if $numero@index > 0}
                          <a target="_blank" href="https://www.gls-spain.es/es/ayuda/seguimiento-envio/?match={if $numero|count_characters > 3}{$glsindividual.0|substr:0:-4}{else}{$glsindividual.0|substr:0:-3}{/if}{$numero}&international=1">{if $numero|count_characters > 3}{$glsindividual.0|substr:0:-4}{else}{$glsindividual.0|substr:0:-3}{/if}{$numero}</a><br>
                        {else}
                          <a target="_blank" href="https://www.gls-spain.es/es/ayuda/seguimiento-envio/?match={$glsindividual.0}&international=1">{$glsindividual.0}</a><br>
                        {/if}
                      {/foreach}
                    {else}
                      <a target="_blank" href="https://www.gls-spain.es/es/ayuda/seguimiento-envio/?match={$seguimiento.1}&international=1">{$seguimiento.1}</a>
                    {/if}
                {/if}
                {elseif $seguimiento.0 == 'SEUR'}
                {assign var=seurindividual value="/"|explode:$seguimiento.1}
                SEUR <br>
                {foreach $seurindividual as $bulto}
                  {if $bulto@index == 0}
                    <a target="_blank" href="https://www.seur.com/miseur/mis-envios/detalle?tracking={$bulto}">{$bulto}</a><br>
                  {else}
                    {assign var=retroceder value=$bulto|count_characters}

                    {assign var=numeroinicial value=$seurindividual[0]|substr:0:-$retroceder}
                    <a target="_blank" href="https://www.seur.com/miseur/mis-envios/detalle?tracking={$numeroinicial}{$bulto}">{$numeroinicial}{$bulto}</a><br>
                    
                  {/if}
                {/foreach}
                {elseif $seguimiento.0 == 'TIPSA'}
                {$seguimiento.0} 
                  <a target="_blank" href="https://www.tip-sa.com/es/localizacion-envios">036001036001{$seguimiento.1}</a>
                 
                {elseif $seguimiento.0 == 'ONTIME' OR $seguimiento.0 == 'ENVIALIA'}
                  {$seguimiento.0}
                 <a target="_blank" href="https://core.ontime.es/ords/r/ontime/portalcliente999/url-seguimiento-consignatario?p_param1=003628{$seguimiento.1}&p_param2={$order.addresses.delivery.postcode}">003628{$seguimiento.1}</a>
                
                {else}
                {$line.tracking nofilter}
                {/if}
              {/if}
                </td>
              </tr>
            {/foreach}
          </tbody>
        </table>
        <div class="d-md-none shipping-lines">
          {foreach from=$order.shipping item=line}
            <div class="shipping-line">
              <ul>
                <li>
                  <strong>{l s='Date' d='Shop.Theme.Global'}</strong> {$line.shipping_date}
                </li>
                <li>
                  <strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong> {$line.carrier_name}
                </li>
                <li>
                  <strong>{l s='Weight' d='Shop.Theme.Checkout'}</strong> {$line.shipping_weight}
                </li>
                <li>
                  <strong>{l s='Shipping cost' d='Shop.Theme.Checkout'}</strong> {$line.shipping_cost}
                </li>
                <li>
                  <strong>{l s='Tracking number' d='Shop.Theme.Checkout'}</strong>   

              {if $line.tracking}
                {assign var=seguimiento value=" "|explode:$line.tracking}
                {if $seguimiento.0 == 'MRW'}
                  <a target="_blank" href="https://www.mrw.es/seguimiento_envios/MRW_resultados_consultas.asp?modo=nacional&envio={$seguimiento.1}">{$line.tracking nofilter}</a>
                {elseif $seguimiento.0 == 'NACEX'}
                  {assign var="nacex" value="/"|explode:$seguimiento.1}
                  <a target="_blank" href="http://www.nacex.es/seguimientoDetalle.do?agencia_origen={$nacex.0}&numero_albaran={$nacex.1}&estado=1&internacional=0&externo=N&usr=null&pas=null">{$line.tracking nofilter}</a>
                {elseif $seguimiento.0 == 'GLS'}
                  {if $order.addresses.delivery.id_country == '6'}
                    <a target="_blank" href="https://m.gls-spain.es/e/{$seguimiento.1}/{$order.addresses.delivery.postcode}">{$line.tracking nofilter}</a>
                  {else}
                    <a target="_blank" href="https://www.gls-spain.es/en/receiving-parcels/shipping-tracking/?match={$seguimiento.1}&international=1">{$line.tracking nofilter}</a>
                  {/if}
                {elseif $seguimiento.0 == 'SEUR'}
                  {assign var=seurindividual value="/"|explode:$seguimiento.1}
                SEUR <br>
                {foreach $seurindividual as $bulto}
                  {if $bulto@index == 0}
                    <a target="_blank" href="https://www.seur.com/miseur/mis-envios/detalle?tracking={$bulto}">{$bulto}</a><br>
                  {else}
                    {assign var=retroceder value=$bulto|count_characters}

                    {assign var=numeroinicial value=$seurindividual[0]|substr:0:-$retroceder}
                    <a target="_blank" href="https://www.seur.com/miseur/mis-envios/detalle?tracking={$numeroinicial}{$bulto}">{$numeroinicial}{$bulto}</a><br>
                    
                  {/if}
                {/foreach}
                {elseif $seguimiento.0 == 'TIPSA'}
                  <a target="_blank" href="https://www.tip-sa.com/es/localizacion-envios">{$seguimiento.0} 036001036001{$seguimiento.1}</a>
                {elseif $seguimiento.0 == 'ONTIME' OR $seguimiento.0 == 'ENVIALIA'}
                  {$seguimiento.0}
                  <a target="_blank" href="https://core.ontime.es/ords/r/ontime/portalcliente999/url-seguimiento-consignatario?p_param1=003628{$seguimiento.1}&p_param2={$order.addresses.delivery.postcode}">003628{$seguimiento.1}</a>
                {else}
                {$line.tracking nofilter}
                {/if}
              {/if}
                </li>
              </ul>
            </div>
          {/foreach}
        </div>
      </div>
    {/if}
  {/block}
  {block name='order_history'}
    <section id="order-history" class="box">
      <h3>{l s='Follow your order\'s status step-by-step' d='Shop.Theme.Customeraccount'}</h3>
      <table class="table table-striped table-bordered table-labeled d-none d-sm-block">
        <thead class="thead-default">
          <tr>
            <th>{l s='Date' d='Shop.Theme.Global'}</th>
            <th>{l s='Status' d='Shop.Theme.Global'}</th>
          </tr>
        </thead>
        <tbody>
          {foreach from=$order.history item=state}
            <tr>
              <td>{$state.history_date}</td>
              <td>
                <span class="label label-pill {$state.contrast}" style="background-color:{$state.color}">
                  {$state.ostate_name}
                </span>
              </td>
            </tr>
          {/foreach}
        </tbody>
      </table>
      <div class="d-none d-sm-none history-lines">
        {foreach from=$order.history item=state}
          <div class="history-line">
            <div class="date">{$state.history_date}</div>
            <div class="state">
              <span class="label label-pill {$state.contrast}" style="background-color:{$state.color}">
                {$state.ostate_name}
              </span>
            </div>
          </div>
        {/foreach}
      </div>
    </section>
  {/block}

  {if $order.follow_up}
    <div class="box">
      <p>{l s='Click the following link to track the delivery of your order' d='Shop.Theme.Customeraccount'}</p>
      <a href="{$order.follow_up}">{$order.follow_up}</a>
    </div>
  {/if}

  {block name='addresses'}
    <div class="addresses">
      {if $order.addresses.delivery}
        <div class="col-lg-6 col-md-6 col-sm-6">
          <article id="delivery-address" class="box">
            <h4>{l s='Delivery address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.delivery.alias]}</h4>
            
            <address>{$order.addresses.delivery.formatted nofilter}</address>
          </article>
        </div>
      {/if}

      <div class="col-lg-6 col-md-6 col-sm-6">
        <article id="invoice-address" class="box">
          <h4>{l s='Invoice address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.invoice.alias]}</h4>
          <address>{$order.addresses.invoice.formatted nofilter}</address>
        </article>
      </div>
      <div class="clearfix"></div>
    </div>
  {/block}

  {$HOOK_DISPLAYORDERDETAIL nofilter}

  {block name='order_detail'}
    {if $order.details.is_returnable}
      {include file='customer/_partials/order-detail-return.tpl'}
    {else}
      {include file='customer/_partials/order-detail-no-return.tpl'}
    {/if}
  {/block}

 

  {block name='order_messages'}
    {include file='customer/_partials/order-messages.tpl'}
  {/block}
{/block}
