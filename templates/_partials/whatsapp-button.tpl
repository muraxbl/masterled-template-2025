<div class="floating-wpp">
	<div class="floating-wpp-button" style="width: 50px; height: 50px; background-color: transparent;" id="whatsButton">
		<img src="{$urls.img_url}whapp.svg" width="10">
		<div class="floating-wpp-button-image">
		</div>
	</div>
	<div class="floating-wpp-popup">
		<div class="floating-wpp-head" style="background-color: rgb(37, 211, 102);">
			<span><img style="float:left;border-radius:20px;margin-right:4px;" src="{$urls.img_url}iconwhats.jpg" width="40" height="40" border="0" align="left"> <span style="display:inline;float:left;margin-top:12px">{l s='¡Envíanos un Whatsapp!' d='Shop.Theme.Whatsapp'}</span></span><strong class="cerrarwh" id="closewh">×</strong>
		</div>
		<div class="floating-wpp-message">{l s='Agréganos a tus contactos: +34610639156' d='Shop.Theme.Whatsapp'}
		</div>
		<div class="floating-wpp-message">{l s='¿En qué podemos ayudarte?' d='Shop.Theme.Whatsapp'}
		</div>
		<form id="whatsend" target="_blank" action="https://wa.me/34610639156" method="get">
		<div class="floating-wpp-input-message">
			<input type="hidden" name="phone" value="+34610639156"><textarea name="text"></textarea>
			<div id="sendwhats" class="floating-wpp-btn-send"><!--?xml version="1.0" encoding="UTF-8" standalone="no"?--><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="isolation:isolate" viewBox="0 0 20 18" width="20" height="18"><defs><clipPath id="_clipPath_fgX00hLzP9PnAfCkGQoSPsYB7aEGkj1G"><rect width="20" height="18"></rect></clipPath></defs><g clip-path="url(#_clipPath_fgX00hLzP9PnAfCkGQoSPsYB7aEGkj1G)"><path d=" M 0 0 L 0 7.813 L 16 9 L 0 10.188 L 0 18 L 20 9 L 0 0 Z " fill="rgb(46,46,46)"></path></g></svg>
			</div>
		</div>
		</form>
	</div>
</div>