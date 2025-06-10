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
<!doctype html>
<html lang="{$language.iso_code}">

  <head>
  <script>
  document.addEventListener('DOMContentLoaded', () => {

  const isMobile = /Mobi|Android/i.test(navigator.userAgent);
  const isSlowConnection = navigator.connection && (
    navigator.connection.effectiveType === '2g' ||
    navigator.connection.saveData
  );

  if (isMobile || isSlowConnection) return;

  const isAllowedURL = (url) => {
    try {
      const u = new URL(url, location.href);
      const path = u.pathname;

      const denyList = [
        '/content/',
        '/contactenos',
        '/contact-us',
        '/nous-contacter',
        '/contattaci',
        '/kontaktieren-sie-uns',
        '/module/',
        '/modules/',
        '/busqueda',
        '/search',
      ];
      if (denyList.some(bad => path.includes(bad))) return false;
      {literal}
      const isCategory = /^\/[a-z]{2}\/\d{2,5}-[\w-]+$/.test(path);
      const isProduct = /^\/[a-z]{2}\/[\w-]+\/\d{3,8}(-\d+)?-[\w-]+\.html$/.test(path);
      const isHome = /^\/$/.test(path);
      {/literal}

      return isCategory || isProduct || isHome;
    } catch (e) {
      return false;
    }
  };

  const links = document.querySelectorAll('a[href]');

  links.forEach(link => {
    const url = link.href;

    if (!isAllowedURL(url)) return;

    link.addEventListener('pointerenter', () => {
      {literal}
      if (document.querySelector('script[data-spec="${url}"]')) return;
      {/literal}
      const ruleScript = document.createElement("script");
      ruleScript.type = "speculationrules";
      ruleScript.textContent = JSON.stringify({
        prerender: [
          {
            source: "list",
            urls: [url]
          }
        ]
      });
      ruleScript.dataset.spec = url;
      document.head.appendChild(ruleScript);

      console.log("✅ Speculation rule añadida para:", url);
    }, { once: true });
  });
});

</script>

    {if $page.page_name == 'cms'}

      {if isset($cms['id'])}        
        {if $cms['id'] == 18}
            <link rel="stylesheet" href="{$urls.base_url}/modules/ml_masterlux/views/css/style.css" type="text/css" media="all">
        {/if}
      {elseif isset($cms.id)}        
        {if $cms.id == 18}
            <link rel="stylesheet" href="{$urls.base_url}/modules/ml_masterlux/views/css/style.css" type="text/css" media="all">
        {/if}
      {/if}
    {/if}
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
    <style>
      .products.row {
        margin-left: 0 !important;
        margin-right: 0 !important;
      }
      #products {
        container-type: inline-size;
        container-name: product-list;
      }
      @container product-list (width > 539) and (width < 1080px) {
        .products.row {
          grid-template-columns: repeat(auto-fit, minmax(min(264px, 100%), 1fr)) !important;
        }

      }
      #products .products .product-miniature {
        margin:0 !important;
      }
    </style>
  
  </head>
<body id="{$page.page_name}" class="{$page.body_classes|classnames}">
    {block name='hook_after_body_opening_tag'}
      {hook h='displayAfterBodyOpeningTag'}
    {/block}

    <main>
      {block name='product_activation'}
        {include file='catalog/_partials/product-activation.tpl'}
      {/block}
      {if $page.page_name != 'pagenotfound'}
    {block name='shop_infos'}
      <section id="infos">
        <div class="shop-infos-button"></div>
        <div class="shop-infos-wrap">
        {include file='_partials/shop-infos.tpl'}
        </div>
      </section>
      {/block}
      {/if}
      <header id="header">

      {block name='header'}
        {if Context::getContext()->isMobile() && !Context::getContext()->isTablet()}
          {include file='_partials/header-mobile.tpl'}
        {else}
          {include file='_partials/header.tpl'}
        {/if}

      {/block}
      </header>
      {block name='notifications'}
        {include file='_partials/notifications.tpl'}
      {/block}

      <section id="wrapper"{if $page.page_name == 'cms'}{if $cms['id'] == 7} class="fondoProfesional"{elseif $cms['id'] == 4} class="whiteback"{/if}{/if}>
        {block name="mega_menu"}
            {include file='_partials/mega-menu.tpl'}
        {/block}
        {hook h="displayWrapperTop"}
          {block name='searchBarTop'}
          {*include file='_partials/searchbar-top.tpl'*}
          {/block}

          <!-- Bloque categorías principales -->
          {if $page.page_name == 'index'}
          {block name='hero_estacional'}
          <div class="container-fluid">
            {include file='_partials/hero-home.tpl'}
          </div>
          {/block}
          {block name="categorieshome"}
            <div class="container-fluid ">
              <div class="categorieshome-wrapper" style="margin: 0 -14px 0 -14px;background: #fafafa;">
                <div class="block">
                  <div class="homecat">
                    <div class="col">
                      {include file='_partials/categories-home.tpl'}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          {/block}
          {/if}
          <!-- / -->

          <!-- Bloque de banners página principal -->
          {if $page.page_name == 'index'}
          {block name='sliderhome'}
          <div class="container-fluid">
            <div>
              <div class="col py-4">  
                {hook h='displaySliderHome'}
                {include file='_partials/topbanners.tpl'}
              </div>
            </div>
          </div>              
          {/block}
         {/if}
        <!-- / -->
        {if $page.page_name == 'index'}
          <div class="container-fluid" style="padding:1rem 0; margin:1rem -15px 1rem -15px;background:#fafafa">
            <div class="review-container" style="max-width:1660px;width:90%;float:none;margin:4rem auto 0 auto; background:#fafafa;height:564px;">
              {hook h='displayHomeReviews'}
            </div>
          </div>

        {/if}
          
        <div class="container-fluid " style="{if $page.page_name != 'index'}padding-bottom:50px;{/if}{if $page.page_name == 'cms'}{if $cms['id'] == 7}padding-left:0;padding-right:0;{elseif $cms['id'] == 4}padding-left:0;padding-right:0;{/if}{/if}">
          {if $page.page_name != 'index'}
          <div class="row">
            {block name='breadcrumb'}
            {include file='_partials/breadcrumb.tpl'}
            {/block}
          </div>
          {/if}
          {if $page.page_name=='category'}
        <div class="block-category category-header-wrapper" style="min-height:0">
          <div class="category-info">
            {if $listing.pagination.items_shown_from == 1}
              <div class="block-category ">
                <h1 class="category-title">{$category.name|lower}</h1>
                  <div class="block-category-inner" style="position:relative">
                    {*
                    {if $category.description}
                      <div id="category-description" class="text-muted">{$category.description nofilter}</div>
                      <div class="icon-read-more"></div>
                    {/if}
                    *}
                    </div>
                </div>
            {/if}
          </div>
          {if $subcategories}
          <div class="lista-subcategorias">
                   
            <div class="block-category-inner">
                <ul class="subcategories-list">
                    {foreach from=$subcategories item=subcategory}

                    <li><a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">

                    {assign var=catimagen value="{$smarty.const._PS_CAT_IMG_DIR_}{$subcategory.id_category}.jpg"}
                    {if $catimagen|file_exists}
                    {assign var=catimagen_size value=getimagesize($catimagen)}
                    <img class="replace-2x" style="margin:5px; max-width:60px" src="{$urls.img_cat_url}{$subcategory.id_category}.jpg" alt="{$subcategory.name|escape:'html':'UTF-8'}"  />{/if}</a>
        
                    <h5 style="max-width:{if $catimagen|file_exists}{$catimagen_size[0]+20}px{else}100px{/if}"><a class="subcategory-name" href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}">{$subcategory.name|truncate:30:'...'|escape:'html':'UTF-8'}</a></h5>
                    </li>
                    {/foreach}
                </ul>
            </div>
            
          </div>
          {/if}
        </div>
  

          {/if}
          {block name="left_column"}
          {if $page.page_name != 'index'}
          <div class="row">
          {/if}
            <div id="left-column" class="col-xs-12 col-sm-3 col-md-2">
              {if $page.page_name == 'product'}
                {hook h='displayLeftColumnProduct'}
              {else}
                {hook h="displayLeftColumn"}
              {/if}
            </div>
          {/block}


          {block name="content_wrapper"}
            <div id="content-wrapper" class="left-column right-column col-sm-9 col-md-10">
              {hook h="displayContentWrapperTop"}
              {block name="content"}
                <p></p>
              {/block}
                  <div class="parallax-container">
        <!-- Living Room Section -->
        <section class="parallax-section living-section">
            <div class="parallax-bg" style="background-image: url('img/salon1.avif');"></div>
            <div class="content-overlay">
                <div class="text-content">
                    <div class="section-tag">Iluminación Integral</div>
                    <h1 class="main-title">SALÓN<br>COMEDOR</h1>
                    <p class="description">
                        Transforma tu espacio de vida con soluciones de iluminación que combinan funcionalidad y elegancia. 
                        Desde iluminación ambiental hasta focos direccionales para crear el ambiente perfecto.
                    </p>
                    <a href="#" class="cta-button">Ver Productos</a>
                </div>
                <div class="image-grid">
                    <div class="room-card">
                        <img src="img/apliquesalon.jpg" alt="Salón moderno" class="room-image">
                        <div class="room-overlay">
                            <div class="room-title">Apliques de pared</div>
                            <div class="room-subtitle">Calidez y carácter</div>
                        </div>
                    </div>
                    <div class="room-card">
                        <img src="img/salon3.avif" alt="Downlights y plafones" class="room-image">
                        <div class="room-overlay">
                            <div class="room-title">Downlights y plafones</div>
                            <div class="room-subtitle">Diseño Contemporáneo</div>
                        </div>
                    </div>
                    <div class="room-card">
                        <img src="img/lampara-colgante-afra.jpg" alt="Iluminación techo" class="room-image">
                        <div class="room-overlay">
                            <div class="room-title">Colgantes</div>
                            <div class="room-subtitle">Luz spot y decorativa</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Kitchen Section -->
        <section class="parallax-section kitchen-section">
            <div class="parallax-bg" style="background-image: url('img/cocina2.jpg');"></div>
            <div class="content-overlay">
                <div class="text-content">
                    <div class="section-tag">Funcionalidad Premium</div>
                    <h1 class="main-title">COCINA<br>MODERNA</h1>
                    <p class="description">
                        Iluminación especializada para cocinas que combina practicidad y estilo. 
                        Focos bajo mueble, Spots empotrados y de superficie y soluciones que mejoran tu experiencia culinaria.
                    </p>
                    <a href="#" class="cta-button">Explorar Cocinas</a>
                </div>
                <div class="image-grid">
                    <div class="room-card">
                        <img src="img/undercabinet.webp" alt="Cocina moderna" class="room-image">
                        <div class="room-overlay">
                            <div class="room-title">Iluminación Bajo Mueble</div>
                            <div class="room-subtitle">Precisión en el Trabajo</div>
                        </div>
                    </div>
                    <div class="room-card">
                        <img src="img/colgantecocina.jpg" alt="Isla cocina" class="room-image">
                        <div class="room-overlay">
                            <div class="room-title">Colgantes Isla</div>
                            <div class="room-subtitle">Foco Central</div>
                        </div>
                    </div>
                    <div class="room-card">
                        <img src="img/spotskitchen.jpg" alt="Spots cocina" class="room-image">
                        <div class="room-overlay">
                            <div class="room-title">Spots Empotrados</div>
                            <div class="room-subtitle">Luz General</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Bedroom Section -->
        <section class="parallax-section bedroom-section">
            <div class="parallax-bg" style="background-image: url('img/dormitorio.webp');"></div>
            <div class="content-overlay">
                <div class="text-content">
                    <div class="section-tag">Ambiente Relajante</div>
                    <h1 class="main-title">DORMITORIO<br>PRINCIPAL</h1>
                    <p class="description">
                        Crea el santuario perfecto con iluminación suave y regulable. 
                        Lámparas de pared, iluminación indirecta y soluciones que favorecen el descanso y la relajación.
                    </p>
                    <a href="#" class="cta-button">Ver Dormitorios</a>
                </div>
                <div class="image-grid">
                    <div class="room-card">
                        <img src="img/lampara-colgante-pastelo-1-negro.jpg" alt="Dormitorio" class="room-image">
                        <div class="room-overlay">
                            <div class="room-title">Luz Ambiente</div>
                            <div class="room-subtitle">Regulable y Cálida</div>
                        </div>
                    </div>
                    <div class="room-card">
                        <img src="img/apliquedormitorio2.jpg" alt="Aplique pared" class="room-image">
                        <div class="room-overlay">
                            <div class="room-title">Apliques de pared</div>
                            <div class="room-subtitle">Iluminación auxiliar y lectura</div>
                        </div>
                    </div>
                    <div class="room-card">
                        <img src="img/tira-led-5m-48w-m-ip20.jpg" alt="Iluminación indirecta" class="room-image" style="object-position:center bottom">
                        <div class="room-overlay">
                            <div class="room-title">Tiras LED</div>
                            <div class="room-subtitle">Iluminación Indirecta</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
            <div class="scroll-indicator">
        Desliza para explorar ↓
    </div>

    </div>
              {hook h="displayContentWrapperBottom"}
            </div>
            {if $page.page_name != 'index'}
              </div>
            {/if}

          {/block}
          {if $page.page_name == 'index'}
         {block name='bannershome'}
            <div class="homebannerfluid">
              <div class="row homebannerwrap">
                <div class="col">
                  {hook h='displayBannersHome'}
                  {include file='_partials/home-middle-banners.tpl'}
                </div>
              </div>
            </div>
          {/block}
          {hook h="displayHomeBottom"}
          {/if}
          {block name="right_column"}
            <div id="right-column" class="col-xs-12 col-sm-4 col-md-3">
              {if $page.page_name == 'product'}
                {hook h='displayRightColumnProduct'}
              {else}
                {hook h="displayRightColumn"}
              {/if}
            </div>
          {/block}
        </div>
        {hook h="displayWrapperBottom"}
      </section>
      <section id="infos-bottom">
      	<div class="container-fluid">
      	{*include file='_partials/info-bottom.tpl'*}
      	</div>
      </section>
      <footer id="footer">
        {block name="footer"}
          {include file="_partials/footer.tpl"}
        {/block}
      </footer>

    </main>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}

    {if $page.page_name == 'cms'}
      {if isset($cms['id'])}        
        {if $cms['id'] == 18}
          <script type="text/javascript" src="{$urls.base_url}/modules/ml_masterlux/views/js/masterlux.js"></script>
        {/if}
      {elseif isset($cms.id)}
        {if $cms.id == 18}
          <script type="text/javascript" src="{$urls.base_url}/modules/ml_masterlux/views/js/masterlux.js"></script>
        {/if}
      {else}
      {/if}
    {/if}
   {block name='extra_content'}
{/block}
{if $customer.is_logged}
<script>
$(document).ready(function () {
  // Configuración del MutationObserver
  const config = { childList: true, subtree: true };

  // Función para actualizar los precios
  function actualizarPrecios() {
    const grupo = {$customer.id_default_group};

    let iva = 1;
    let disc = 0;

    // Determinar valores de IVA y descuento
    switch (grupo) {
      case 3:
        iva = 1;
        disc = 0;
        break;
      case 4:
        iva = 0;
        disc = 12;
        break;
      case 30:
      case 33:
        iva = 0;
        disc = 22;
        break;
      default:
        iva = 1;
        disc = 0;
    }

    // Modificar los precios de los spans
    $('.sbProductPrice span').each(function () {
      let $span = $(this);

      // Verifica si ya tiene un precio original almacenado
      if (!$span.data('original-price')) {
        // Almacena el precio original en un atributo de datos
        let originalText = $span.text().trim();
        let originalPrice = parseFloat(originalText.replace(',', '.').replace(/\s*€/, '').replace('\u00A0', ''));

        if (!isNaN(originalPrice)) {
          $span.data('original-price', originalPrice); // Guarda el precio original
        }
      }

      // Recupera el precio original
      let originalPrice = $span.data('original-price');
      if (!isNaN(originalPrice)) {
        let priceWithoutVAT = originalPrice / 1.21;
        let discountedPrice = priceWithoutVAT * ((100 - disc) / 100);
        let finalPrice = iva ? discountedPrice * 1.21 : discountedPrice;
        let formattedPrice = finalPrice.toFixed(2).replace('.', ',') + '\u00A0€';
        $span.text(formattedPrice); // Actualiza el texto visible
      }
    });
  }

  // Callback para el MutationObserver
  const callback = function (mutationsList, observer) {
    for (let mutation of mutationsList) {
      if (mutation.type === 'childList') {
        actualizarPrecios();
      }
    }
  };

  // Crear el MutationObserver para monitorear los cambios en los precios
  const observer = new MutationObserver(callback);

  // Detectar si el contenedor existe
  function observarContenedor() {
    const targetNode = document.querySelector('.sbProductPrice');
    if (targetNode) {
      observer.observe(targetNode, config);
      console.log('Observando cambios en .sbProductPrice');
      console.log($('.sbProductPrice'));
    } else {
      setTimeout(observarContenedor, 1500); // Reintenta si no existe aún
    }
  }
  observarContenedor();

  // Escuchar eventos del input de búsqueda
  $('.sbSearch').on('input', function () {
    // Agrega un ligero retardo para esperar a que los resultados se generen
    setTimeout(actualizarPrecios, 500);
  });
});



</script>
{/if}
  </body>

</html>
