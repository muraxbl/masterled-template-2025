<div class="homebanners-heading">
	<h2>Masterled: tu tienda LED de confianza</h2>
</div>
<!-- ENVIO GRATUITO -->
<div class="banner-element">
	<div class="img"><img border="0" src="https://www.masterled.es/themes/masterled/assets/img/bannershome/fast-delivery-icon.jpg" alt="{l s='Envíos globales. Coste en península 5,15€. Gratuitos para compras superiores a 60€ (Particular)' d='Shop.Theme.Homebanners'}"></div>
	<div class="copy">
		{if $customer.is_logged}
			{if $customer.id_default_group == '30' OR $customer.id_default_group == '31' OR $customer.id_default_group == '32'}
				<h3>Envíos globales desde 6€ + IVA</h3>
				<p>O envía a tu propia agencia. Realizamos drop-shipping en tu nombre</p>
			{elseif $customer.id_default_group == '4'}
				<h3>Envío gratuito a partir de 75€ + IVA</h3>
				<p>Entregas en 24/48h en península. Envío inmediato para pedidos realizados antes de las 18h de lunes a jueves, antes de las 17h los viernes.</p>
			{elseif $customer.id_default_group == '33' OR $customer.id_default_group == '40' OR $customer.id_default_group == '19'}
				<h3>Envío gratuito a partir de 90€ + IVA</h3>
				<p>Entregas en 24/48h en península. Envío inmediato para pedidos realizados antes de las 18h de lunes a jueves, antes de las 17h los viernes.</p>
				<p>Drop-shipping con envío anónimo disponible</p>
			{else}
				<h3>Envío gratuito a partir de 60€ + IVA</h3>
				<p>Entregas en 24/48h en península. Envío inmediato para pedidos realizados antes de las 18h de lunes a jueves, antes de las 17h los viernes.</p>
			{/if}
		{else}
			<h3>Envío gratuito a partir de 60€*</h3>
			<p>Transporte península 6,23€*. Haz tu pedido antes de las 18h y recíbelo en 24/48 horas. Realizamos envíos a cualquier parte del mundo. <a href="{$urls.pages.contact}" class="btn btn-primary white-link block-link mblock-h">Pide tu presupuesto</a></p>

		{/if}
	</div>
</div>
<div class="banner-element">
	<div class="img"><img border="0" src="https://www.masterled.es/themes/masterled/assets/img/bannershome/phone-order.jpg" alt="{l s='Envíos globales. Coste en península 5,15€. Gratuitos para compras superiores a 60€ (Particular)' d='Shop.Theme.Homebanners'}"></div>
	<div class="copy">
		<h3>¡Tu pedido por teléfono!</h3>
		<p>Sin complicaciones. Llámanos y uno de nuestros agentes te ayudará con tu pedido. <br><small>L-J: 8:30 - 18:00h | V: 8:30 - 17:00h</small>. <a href="tel:+34986954005" class="btn btn-primary white-link block-link mblock-h">LLÁMANOS</a></p>
		
		
	</div>
</div>
<div class="banner-element">
	<div class="img"><img border="0" src="https://www.masterled.es/themes/masterled/assets/img/bannershome/securepayment.jpg" alt="{l s='Envíos globales. Coste en península 5,15€. Gratuitos para compras superiores a 60€ (Particular)' d='Shop.Theme.Homebanners'}"></div>
	<div class="copy">
		<h3>Tu compra segura</h3>
		<p>Rápido, cómodo y sobre todo fiable. Disponemos de pasarelas de pago seguro a través de tarjeta de crédito y débito, Bizum, PayPal, Google Pay o Apple Pay. <a href="{url entity='cms' id='6' id_lang=$language.id}">Lee más...</a></p>
	</div>
</div>
<div class="banner-element">
	<div class="img"><img border="0" src="https://www.masterled.es/themes/masterled/assets/img/bannershome/warranty.jpg" alt="{l s='Envíos globales. Coste en península 5,15€. Gratuitos para compras superiores a 60€ (Particular)' d='Shop.Theme.Homebanners'}"></div>
	<div class="copy">
		<h3>Hasta 5 años de garantía</h3>
		<p>Confianza y calidad aseguradas. Disfruta de una garantía mínima de 3 años, y hasta 5 años en productos seleccionados. <a href="{url entity='cms' id=12 id_lang=$language.id}">Lee más...</a></p>
	</div>
</div>
