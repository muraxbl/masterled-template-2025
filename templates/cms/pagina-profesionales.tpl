{assign var=espro value=false}
{assign var=esoferta value=false}
{if $customer.is_logged}
{if $customer.id_default_group == 4 OR $customer.id_default_group == 12 OR $customer.id_default_group == 15 OR $customer.id_default_group == 18 OR $customer.id_default_group == 22 OR $customer.id_default_group == 33}
{assign var=espro value=true}

{elseif $customer.id_default_group == 30 OR $customer.id_default_group == 31 OR $customer.id_default_group == 32}
{assign var=esoferta value=true}
{/if}
{/if}
<div class="row mw1200">
<div class="col-xs-12 col-md-12 mw1200">
<h2 style="font-size: 3.4em;font-weight:bold; color: #00338e; text-align:center;"><img border="0" src="/img/cms/masterlogo.png"/><br>{l s='El camino' d='Shop.Cms.Profesional'} <span style="color:#ff0000;text-shadow: 2px 0 0 #fff, -2px 0 0 #fff, 0 2px 0 #fff, 0 -2px 0 #fff, 1px 1px #fff, -1px -1px 0 #fff, 1px -1px 0 #fff, -1px 1px 0 #fff;">{l s='+ seguro' d='Shop.Cms.Profesional'}</span><br><span style="font-size: 0.5em;">{l s='para el profesional' d='Shop.Cms.Profesional'}</span></h2>
</div>
<div class="row clavesprof"></div>
</div>
<div class="row" style="height: 40px;"> </div>
<p class="mw1200"><a class="btn btn-primary xltext registernow" href="{$urls.pages.register}">{l s='Regístrate ahora' d='Shop.Cms.Profesional'}</a></p>
<div class="row" style="height: 40px;"> </div>
<div class="row mbotom40 greyback paddvertical"><!-- BLOQUE TEXTO -->
<div class="push-xs-1 col-xs-2 col-sm-2 col-md-2 col-lg-2"><img src="/img/cms/shield.svg" alt="" style="float: right; vertical-align: middle; width: 100%; max-width: 100px;" /></div>
<div class="push-xs-1 col-sm-8 col-xs-8 col-md-8 col-lg-8">
<h2 style="font-size: 2.2em; color: #00338e;">{l s='Seguro de Garantía' d='Shop.Cms.Profesional'}</h2>
{if $espro OR $esoferta}{l s='Aumentamos la garantía mínima de todos nuestros productos a' d='Shop.Cms.Profesional'} <strong style="color: #ff0000;">{l s='3 años' d='Shop.Cms.Profesional'}</strong>{else}{l s='Mejoramos las condiciones de garantía de todos los productos.' d='Shop.Cms.Profesional'}{/if}</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 h40px"></div>
<!-- FIN BLOQUE TEXTO --> <!-- BLOQUE TEXTO -->
<div class="push-xs-1 col-xs-2 col-sm-2 col-md-2 col-lg-2"><img src="/img/cms/shield.svg" alt="" style="float: right; vertical-align: middle; width: 100%; max-width: 100px;" /></div>
<div class="push-xs-1 col-sm-8 col-xs-8 col-md-8 col-lg-8">
<h2 style="font-size: 2.2em; color: #00338e;">{l s='Seguro de mejor precio' d='Shop.Cms.Profesional'}</h2>{if $espro OR $esoferta}{l s='Te' d='Shop.Cms.Profesional'} <strong style="color: #ff0000;">{l s='aseguramos' d='Shop.Cms.Profesional'}</strong> {l s='el mejor precio, y si encuentras el mismo artículo más barato, te lo mejoramos' d='Shop.Cms.Profesional'}{else}<strong style="color:#ff0000">{l s='Te aseguramos' d='Shop.Cms.Profesional'}</strong> {l s='siempre el mejor precio' d='Shop.Cms.Profesional'}{/if}</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 h40px"></div>
<!-- FIN BLOQUE TEXTO --> <!-- BLOQUE TEXTO -->
<div class="push-xs-1 col-xs-2 col-sm-2 col-md-2 col-lg-2"><img src="/img/cms/shield.svg" alt="" style="float: right; vertical-align: middle; width: 100%; max-width: 100px;" /></div>
<div class="push-xs-1 col-sm-8 col-xs-8 col-md-8 col-lg-8">
<h2 style="font-size: 2.2em; color: #00338e;">{l s='Seguro de devolución de material' d='Shop.Cms.Profesional'}</h2>{if $espro OR $esoferta}{l s='Recogemos el material sobrante de obra cuando acabes la instalación, ahora con mejores condiciones' d='Shop.Cms.Profesional'} <strong style="color: #ff0000;">*</strong>{else}{l s='Mejores condiciones en políticas de devoluciones' d='Shop.Cms.Profesional'}{/if}</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 h40px"></div>
<!-- FIN BLOQUE TEXTO --> <!-- BLOQUE TEXTO -->
<div class="push-xs-1 col-xs-2 col-sm-2 col-md-2 col-lg-2"><img src="/img/cms/shield.svg" alt="" style="float: right; vertical-align: middle; width: 100%; max-width: 100px;" /></div>
{*<div class="push-xs-1 col-sm-8 col-xs-8 col-md-8 col-lg-8">
<h2 style="font-size: 2.2em; color: #00338e;">{l s='Seguro de atención fin de semana' d='Shop.Cms.Profesional'}</h2>{if $espro OR $esoferta}{l s='Soporte urgencias fin de semana.' d='Shop.Cms.Profesional'}<br />· {l s='Via whatsapp en el' d='Shop.Cms.Profesional'} <strong style="color: #ff00000;">610 639 156</strong><br />· {l s='Por correo electrónico en' d='Shop.Cms.Profesional'} <strong style="color: #ff0000;">masterled@homekit.es</strong>{else}{l s='Soporte fines de semana' d='Shop.Cms.Profesional'} <strong style="color:#ff0000">{l s='solo' d='Shop.Cms.Profesional'}</strong> {l s='para profesionales' d='Shop.Cms.Profesional'}{/if}</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 h40px"></div>
<!-- FIN BLOQUE TEXTO --> <!-- BLOQUE TEXTO -->
<div class="push-xs-1 col-xs-2 col-sm-2 col-md-2 col-lg-2"><img src="/img/cms/shield.svg" alt="" style="float: right; vertical-align: middle; width: 100%; max-width: 100px;" /></div>*}
<div class="push-xs-1 col-sm-8 col-xs-8 col-md-8 col-lg-8">
<h2 style="font-size: 2.2em; color: #00338e;">{l s='Seguro de trato personalizado' d='Shop.Cms.Profesional'}</h2>{if $espro OR $esoferta}{l s='En' d='Shop.Cms.Profesional'} <span class="planer masterblue ltext">master</span><span class="planer mastergreen ltext">led</span><span class="planer masterblue stext">.es</span> {l s='como profesional, tienes un asesor personal para lo que necesites. Si aún no lo conoces, solicítalo.' d='Shop.Cms.Profesional'}{else}{l s='Te asignamos un asesor personal para lo que necesites'  d='Shop.Cms.Profesional'}{/if}</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 h40px"></div>
<div class="col-xs-12 col-md-6 push-md-3 stext">{if $espro OR $esoferta}<strong style="color: #ff0000;">*</strong> {l s='Plazo máximo de 30 días, para materiales sin usar y en su embalaje original.' d='Shop.Cms.Profesional'}{/if}</div>
<!-- FIN BLOQUE TEXTO --></div>
<div class="row mw1200 paddvertical">
	{*if $espro OR $esoferta}<div class="col-xs-12 textcenter"><a href="#" class="btn btn-primary stext asesor" style="font-weight: 300;">{l s='Quiero que me llame mi asesor' d='Shop.Cms.Profesional'}</a></div>{/if*}
</div>
<hr />
<div class="row mw1200 paddvertical">
<div class="col-xs-12 textcenter beneficios-cabecera">
<h2>{l s='Además, estos beneficios' d='Shop.Cms.Profesional'}</h2>
</div>
</div>
<div class="row mw1200 beneficios">
<div class="col-xs-12 col-md-6"><i class="material-icons"> local_shipping </i> <br /><span><strong>{l s='Tu envío GRATIS en 24 / 48 horas en península.' d='Shop.Cms.Profesional'}</strong><br><br><span class="stext">{l s='a partir de 75€ + IVA' d='Shop.Cms.Profesional'}</span></span></div>
<div class="col-xs-12 col-md-6"><i class="material-icons"> card_membership </i><br /> <span><strong>{l s='Todavía más descuentos' d='Shop.Cms.Profesional'}</strong><br><br> {l s='Si deseas realizar un pedido de gran volumen, llama o escríbenos, y realizaremos un presupuesto personalizado sin ningún compromiso.' d='Shop.Cms.Profesional'}</span></div>
<div class="col-xs-12 col-md-6"><i class="material-icons"> build </i><br /><span><strong>{l s='Servicio técnico de por vida' d='Shop.Cms.Profesional'}</strong><br><br>{l s='Si necesitas asesoramiento, dispones de' d='Shop.Cms.Profesional'} <strong>{l s='apoyo técnico' d='Shop.Cms.Profesional'}</strong> {l s='por parte de personal cualificado durante toda la vida útil de tus luminarias.' d='Shop.Cms.Profesional'}</span></div>
<div class="col-xs-12 col-md-6"><i class="material-icons"> perm_data_setting </i><br /><span><strong>{l s='Productos a medida' d='Shop.Cms.Profesional'}</strong><br><br> {l s='Fabricamos tu producto siguiendo tus pautas. Indícanos la potencia que necesitas, temperatura de color, ángulo de apertura... y te ofreceremos precio y plazo de entrega.' d='Shop.Cms.Profesional'}</span></div>
</div>
<div class="row mw1200 mtop40 paddvertical"></div>
<div class="row mbotom40 greyback paddvertical accesopro">
<div class="col-xs-12 col-md-6 push-md-3 paddvertical mbottom40 stext">
<h2>{l s='¿Cómo acceder a estas ventajas?' d='Shop.Cms.Profesional'}</h2>
{l s='¿Eres instalador? ¿Te dedicas a la venta o distribución de material de iluminación? ¿Tienes una emrpesa reformas o construcción? Regístrate como cliente profesional en unos sencillos pasos y empieza a disfrutar de los beneficios de ser cliente profesional' d='Shop.Cms.Profesional'} <span class="planer masterblue">master</span><span class="planer mastergreen">led</span><span class="planer masterblue">.es</span>.</div>
<div class="col-xs-12"></div>
<div class="row mw1200 paddvertical">
<div class="col-xs-12 col-md-4">
<h3>1. {l s='Rellena el formulario de registro' d='Shop.Cms.Profesional'}</h3>
<span class="stext"> {l s='Accede a nuestro' d='Shop.Cms.Profesional'} <a href="{$urls.pages.register}"><strong>{l s='Formulario de registro' d='Shop.Cms.Profesional'}</strong></a>, {l s='y rellena los datos solicitados. Adjunta un documento de alta censal dónde se aprecie el epígrafe/actividad que desarrollas, o licencia de instalador eléctrico.' d='Shop.Cms.Profesional'}</span></div>
<div class="col-xs-12 col-md-4">
<h3>2. {l s='Revisamos tu solicitud de alta' d='Shop.Cms.Profesional'}</h3>
<span class="stext"> {l s='Cada alta se verifica de forma manual, de modo que una vez registrado, tendrás disponible la' d='Shop.Cms.Profesional'} <strong>{l s='tarifa general' d='Shop.Cms.Profesional'}</strong>. {l s='Una vez aprobada tu solicitud, te enviaremos un correo electrónico informándote del alta' d='Shop.Cms.Profesional'}</span></div>
<div class="col-xs-12 col-md-4">
<h3>3. {l s='Comienza a disfrutar de tu tarifa Profesional' d='Shop.Cms.Profesional'}</h3>
<span class="stext"> {l s='A partir de la recepción del correo electrónico confirmando la activación de tu tarifa, podrás comenzar a disfrutar de todas las ventajas de ser un cliente Profesional' d='Shop.Cms.Profesional'} <span class="planer masterblue ltext">master</span><span class="planer mastergreen ltext">led</span><span class="masterblue planer mtext">.es</span></span></div>
</div>
</div>
<div class="row mbotom40 paddvertical accesopro">
<div class="col-xs-12 col-md-6 push-md-3 paddvertical stext">
<h2>{l s='¿Tienes alguna duda?' d='Shop.Cms.Profesional'}</h2>
<p>{l s='Estamos a tu disposición para aclarar cualquier posible duda que pueda surgir. Contacta con nuestro servicio de atención comercial escribiéndonos a la dirección' d='Shop.Cms.Profesional'} masterled@homekit.es, {l s='o llamándonos por teléfono al número' d='Shop.Cms.Profesional'} <strong style="color: #ff0000;">986 954 005</strong> {l s='o al' d='Shop.Cms.Profesional'} <strong style="color: #ff0000;">886 311 868</strong> {l s='(Números fijos nacionales) en horario comercial, de Lunes a Jueves de 8:30 a 18:00h, y Viernes de 8:30 a 17:00h.' d='Shop.Cms.Profesional'}</p>
{if $espro OR $esoferta}
<p style="display:none">{l s='Alternativamente, también puedes contactar con nosotros rellenando el siguiente formulario.' d='Shop.Cms.Profesional'}</p>
{else}
<p style="display:none">{l s='Si prefieres que gestionemos tu alta, puedes rellenar el formulario a continuación con los datos de tu empresa, adjuntando un alta censal o documento similar, y te contestaremos lo antes posible.' d='Shop.Cms.Profesional'}</p>
{/if}
</div>
<div class="col-xs-12"></div>
</div>
