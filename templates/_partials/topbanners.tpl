{assign var='banners' value=[
    [
        'img' => "pre-black-", 
        'type' => 'category', 
        'url' => '90', 
        'text' => [
            1 => 'Mecanismos Vintage Cerámicos', 
            2 => 'Mecanismos Vintage Cerámicos', 
            4 => 'Mecanismos Vintage Cerámicos', 
            5 => 'Mecanismos Vintage Cerámicos', 
            6 => 'Mecanismos Vintage Cerámicos', 
            7 => 'Mecanismos Vintage Cerámicos'
        ]
    ]
]
}

{assign var=randomindex value=$banners|@array_rand}

<style>
	#top-banners {
		max-width: 1660px;
		float:none;
		margin-left: auto;
		margin-right: auto;

	}
	
	.probanner-wrap  {
		max-width: 1660px;
		float: none;
		margin-left: auto;
		margin-right:auto;
	}
	#top-banners > .banner1 a:nth-of-type(odd) {
		background-image: url('https://masterled.es/themes/masterled/assets/img/banners/banner-atex-{$language.iso_code}.jpg');

	}
	#top-banners > .swiper {
		overflow: hidden;
		margin-left: unset !important;
		margin-right: unset !important;

	}
	#top-banners a span {
		opacity:0;
	}
	#top-banners > .banner1 a:nth-of-type(even) {
		background-image: url('https://www.masterled.es/themes/masterled/assets/img/banners/porcelanicos-{$language.iso_code}.jpg');

	}
	#top-banners > .banner2 a {
		background-image: url('{$urls.img_url}banners/cct-ajustable-{$language.iso_code}.jpg');



	}
	#top-banners > .banner3 a {
		background-image: url('{$urls.img_url}banners/outlet-{$language.iso_code}.jpg');


	}
	.swiper-pagination {
		position: absolute;
		bottom: 0 !important;
		margin-bottom: 1rem !important;
		left: 50% !important;
		transform: translateX(-50%);
		z-index: 99;

	}
	.swiper-pagination-bullet {
	    width: 20px;
	    height: 20px;
	    display: inline-block;
}
</style>
<div id="top-banners">

	<div class="banner-mid mid banner1">
		<a href="{url entity='search'}?s=ATEX">{l s='Iluminación Industrial antideflagraciones para atmósferas potencialmente explosivas y peligrosas, como industria química, maderera, alimentaria, plataformas petrolíferas, etc.' d='Shop.Theme.Topbanners'}</a>
	</div>
	<div class="banner-mid mid1 banner2">
		<a href="{url entity='search'}?s=CCT">{l s='Compra apliques de pared con carga inalámbrica, puerto USB y luz de lectura' d='Shop.Theme.Topbanners'}</a>
	</div>
	<div class="banner-mid mid2 banner3">
		<a href="{url entity='category' id=254 id_lang=$language.id}">{l s='Precios con grandes descuentos para nuestros productos outlet en liquidación' d='Shop.Theme.Topbanners'}</a>
	</div>
	
</div>
<div class="probanner-wrap">
	<div class="pro-banner d-599-none">
		<div>
			<img border="0" src="{$urls.img_url}banners/pro-symbol.png"></div><div class="pro-text"><h2>Precios especiales para profesionales del sector<br>
			<span style="font-size:0.6em;font-weight:300">Instaladores y distribuidores de iluminación o material eléctrico</span></h2></div><div><a href="#">INFÓRMATE</a>
		</div>
	</div>
	<div class="pro-banner pro-banner-mobile d-599-block" style="">
		<img border="0" src="{$urls.img_url}masterpro.webp" style="max-width:100%;height:auto;flex: 0 0 100% !important">
	</div>
</div>