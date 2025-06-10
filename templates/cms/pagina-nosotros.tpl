
<div class="row mw1200">
<div class="col-xs-12 col-md-12 mw1200">
<h2 style="font-size: 3.4em;font-weight:bold; color: #00338e; text-align:center;">{l s='Bienvenidos a' d='Shop.Cms.About'}<br><img border="0" src="/img/cms/masterlogo.png"/></h2>
</div>
</div>
<div class="row" style="height: 40px;"> </div>
<div class="row" style="height: 40px;"> </div>
<div class="row greyback" style="padding:6px 0">

</div>
<div class="row mw1200 nosotrosdiv bloquetexto">
	{assign var="fileinit" value='cms/about-us-'}
	{assign var="ext" value=".tpl"}
	{assign var=archivo value="{$fileinit}{$language.iso_code}{$ext}"}
	<pre style="display:none">{$archivo}</pre>
	{include file={$archivo}}
	{*if $language.iso_code == 'es'}
	{include file='cms/about-us-es.tpl'}
	{/if}
	{if $language.iso_code == 'pt'}
	{include file='cms/about-us-pt.tpl'}
	{/if}
	{if $language.iso_code == 'en'}
	{include file='cms/about-us-en.tpl'}
	{/if}
	{if $language.iso_code == 'fr'}
	{include file='cms/about-us-fr.tpl'}
	{/if}
	{if $language.iso_code == 'de'}
	{include file='cms/about-us-de.tpl'}
	{/if}
	{if $language.iso_code == 'it'}
	{include file='cms/about-us-it.tpl'}
	{/if*}

</div>
<hr />
<div class="row mw1200 paddvertical">
<div class="col-xs-4 push-xs-1 col-md-2 push-md-3"><a href="https://www.google.com/maps/place/MASTERLED/@42.216819,-8.6963377,18z/data=!4m5!3m4!1s0x0:0x7df93e1531b0b850!8m2!3d42.2166591!4d-8.6968958"><img border="0" src="/img/cms/pin.png" alt="{l s='Encuéntranos aquí' d='Shop.Theme.AboutUs'}"></a>
</div>
<div class="col-xs-6 push-xs-1 col-md-4 push-md-3">
<strong>{l s='Puedes encontrarnos en' d='Shop.Cms.About'}</strong><br>
<small><a href="https://www.google.com/maps/place/MASTERLED/@42.216819,-8.6963377,18z/data=!4m5!3m4!1s0x0:0x7df93e1531b0b850!8m2!3d42.2166591!4d-8.6968958" target="_blank">Avda. Alcalde Lavadores, 122</a><br>36214, Vigo<br>Pontevedra<br><a href="tel:+34986954005">986 954 005</a> - <a href="tel:+34886311868">886 311 868</a>
</div>
</div>
<div class="row mbotom40 greyback paddvertical mapamaster">

</div>
<div class="row mbotom40 paddvertical accesopro">

</div>
