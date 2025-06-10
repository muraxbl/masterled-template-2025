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

 {* COMPORTAMIENTO SELECTIVO SI LA PÁGINA == CMS ID 7 (Profesionales y distribuidores *}
{if $page.page_name == 'cms' && $cms.id == 7}
{assign var=procontact value=false}
{if $customer.is_logged}
{if $customer.id_default_group == 4 OR $customer.id_default_group == 12 OR $customer.id_default_group == 15 OR $customer.id_default_group == 18 OR $customer.id_default_group == 22 OR $customer.id_default_group == 30 OR $customer.id_default_group == 31 OR $customer.id_default_group == 32 OR $customer.id_default_group == 33}
{assign var=procontact value=true}
{/if}
{/if}
{/if}
 {* FIN *}
<section class="contact-form">
  <form action="{$urls.pages.contact}" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"{/if}>

    {if $notifications}
      <div class="col-xs-12 alert {if $notifications.nw_error}alert-danger{else}alert-success{/if}">
        <ul>
          {foreach $notifications.messages as $notif}
            <li>{$notif}</li>
          {/foreach}
        </ul>
      </div>
    {/if}

    {if !$notifications || $notifications.nw_error}
      <section class="form-fields">

        <div class="mb-3 row">
          <div class="col-md-9 col-md-offset-3">
            <h3>{l s='Contact us' d='Shop.Theme.Global'}</h3>
          </div>
        </div>

        <div class="mb-3 row" {if $page.page_name == 'cms' && $cms.id == 7}style="display:none"{/if}>
          <label class="col-md-3 form-control-label">{l s='Subject' d='Shop.Forms.Labels'}</label>
          <div class="col-md-6">
            <select name="id_contact" class="form-control form-control-select">
              {if $page.page_name == 'cms' && $cms.id == 7}
              <option value="4">Información Alta profesional</option>
              {else}
              {foreach from=$contact.contacts item=contact_elt}
                <option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
              {/foreach}
              {/if}
            </select>
          </div>
        </div>

        <div class="mb-3 row">
          <label class="col-md-3 form-control-label">{l s='Email address' d='Shop.Forms.Labels'}</label>
          <div class="{if $page.page_name == 'cms' && $cms.id == 7}col-md-9{else}col-md-6{/if}">
            <input
              class="form-control"
              name="from"
              type="email"
              value="{$contact.email}"
              placeholder="{l s='your@email.com' d='Shop.Forms.Help'}"
            >
          </div>
        </div>

        {if $contact.orders}
          <div class="mb-3 row">
            <label class="col-md-3 form-control-label">{l s='Order reference' d='Shop.Forms.Labels'}</label>
            <div class="col-md-6">
              <select name="id_order" class="form-control form-control-select">
                <option value="">{l s='Select reference' d='Shop.Forms.Help'}</option>
                {foreach from=$contact.orders item=order}
                  <option value="{$order.id_order}">{$order.reference}</option>
                {/foreach}
              </select>
            </div>
            <span class="col-md-3 form-control-comment">
              {l s='optional' d='Shop.Forms.Help'}
            </span>
          </div>
        {/if}

        {if $contact.allow_file_upload}
          <div class="mb-3 row">
            {if $page.page_name == 'cms' && $cms.id == 7}
            {if !$procontact}
            <label class="col-md-3 form-control-label">{l s='Incluir copia del epígrafe IAE' d='Shop.Forms.Labels'} <span style="color:#ff0000">*</span></label>
            {else}
            <label class="col-md-3 form-control-label">{l s='¿Deseas adjuntar algún archivo?' d='Shop.Forms.Labels'}</label>
            {/if}
            {else}
            <label class="col-md-3 form-control-label">{l s='Attachment' d='Shop.Forms.Labels'}</label>
            {/if}
            <div class="{if $page.page_name =='cms' && $cms.id == 7}col-md-9{else}col-md-6{/if}">
              <input type="file" name="fileUpload" class="filestyle" data-buttonText="{l s='Choose file' d='Shop.Theme.Actions'}">
            </div>
            {if $page.page_name == 'cms' && $cms.id == 7}
            {if $procontact}
            <span class="col-md-3 form-control-comment">
              {l s='optional' d='Shop.Forms.Help'}
            </span>
            {/if}
            {else}
            <span class="col-md-3 form-control-comment">
              {l s='optional' d='Shop.Forms.Help'}
            </span>
            {/if}
          </div>
        {/if}

        <div class="mb-3 row">
          {if $page.page_name == 'cms' && $cms.id == 7}
          {if !$procontact}
          <label class="col-md-3 form-control-label">{l s='Introduce los datos de tu empresa/negocio. Nombre fiscal, CIF/NIF, Dirección de facturación y Nº de teléfono' d='Shop.Forms.Labels'}</label>
          {else}
          <label class="col-md-3 form-control-label">{l s='¿En qué podemos ayudarte?' d='Shop.Forms.Labels'}</label>
          {/if}
          {else}
          <label class="col-md-3 form-control-label">{l s='Message' d='Shop.Forms.Labels'}</label>
          {/if}
          <div class="col-md-9">
            <textarea
              class="form-control"
              name="message"
              placeholder="{if $page.page_name == 'cms' && $cms.id == 7}{l s='Déjanos tus datos y el motivo de tu consulta' d='Shop.Forms.Help'}{else}{l s='How can we help?' d='Shop.Forms.Help'}{/if}"
              rows="3"
            >{if $contact.message}{$contact.message}{/if}</textarea>
          </div>
        </div>

        {if isset($id_module)}
          <div class="mb-3 row">
            <div class="offset-md-3">
              {hook h='displayGDPRConsent' id_module=$id_module}
            </div>
          </div>
        {/if}

      </section>

      <footer class="form-footer text-sm-right">
        <style>
          input[name=url] {
            display: none !important;
          }
        </style>
        <input type="text" name="url" value=""/>
        <input type="hidden" name="token" value="{$token}" />
        <input class="btn btn-primary" type="submit" name="submitMessage" value="{l s='Send' d='Shop.Theme.Actions'}">
        {if $page.page_name =='cms' && $cms.id == 7}
        {if $procontact}
        {else}
        <div class="col-xs-12 mtop20" style="text-align:left"><span class="stext"><span style="color:#ff0000">*</span> Válidos documentos donde se aprecie la actividad que desarrolla o epígrafe en el que está inscrito.<br>Ejemplos: alta censal (036, 037) o licencia de instalador.</span>
        </div>
        {/if}
        {/if}
      </footer>
    {/if}

  </form>
</section>
