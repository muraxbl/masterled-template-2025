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
      <style>
        html {
          scroll-behavior: smooth;
          -webkit-scroll-behavior: smooth;
          -moz-scroll-behavior: smooth
        }
        #content {
          display: flex;
          flex-wrap: wrap;
          justify-content: center;
          min-height: 1000px;
        }
        #content > *{
        	flex: 0 0 50%;
        }
        .bfheader {
          max-width: 600px;
          width: auto;
          height: auto;
          transform: translate(0, -70px);
        }
        .black-header-info {
        	padding: 20px 4% 20px 16%;
          font-family: 'Montserrat', sans-serif !important;
        }
        .black-container {
          width: 100%;
          flex: 1 0 100% !important;
          background-color: white;
          /*min-height: 1000px;*/
          margin-left:  -30px;
          margin-right:   -30px;
          color: #222 !important;
        }
        .promo-list * {
          /*color: #222 !important;*/
        }
        .read-more-black {
          display: block;
          justify-content:  center;
          color: white !important ;
          position:   relative;
          clear:  both;
          margin-top: 40px;
        }
        .read-more-black > a > i {
          color: white !important ;
          font-size: 4em;
          position:   absolute  ;
          top: 0;
          left: 50%;
          transform:  translate(-50%, 0);
        }
        @media (min-width: 480px) {
          .black-container  {
            margin-left: -35px;
          margin-right:   -35px;
          }
        }
        @media (min-width: 480px) and (max-width: 750px) {
          .bfheader {
            transform: translate(0, -50px);
          }
        }
        @media (max-width: 479px) {
          .bfheader {
            transform: translate(0, -80px);
          }
        }
        @media (min-width: 769px) and (max-width: 995px) {
        	.black-header-info {
        		flex:  1 1 60% !important;
	        	padding: 0px 4% 20px 10%;
	        	min-height: 400px;

        	}
        	.black-header-info + p {
        		flex:  1 1 40% !important;
        	}
        	.bfheader {
 				max-width: 600px;
  				width: auto;
  				height: auto;
  				transform: translate(0, 0px);
			}
	        .read-more-black {
	        	margin-top: 0;

	        }
        }
      @media (max-width: 768px) {
        	#content {
        		width: 100%;
        	}
			    #content > *{
        		flex: 1 0 100%;
        	}
	        #content {
    			flex-wrap: nowrap;
          		justify-content: center;
          		min-height: 1000px;
          		flex-direction: column;
        	}
        	.black-header-info + p {
        		text-align: center;
        		order: 1;
			    }
			    .black-header-info {
				    order: 2;
				    padding: 0 10px 10px 10px;
				    position: relative;
			    }
			    .black-container {
				    width: auto;
				    order:  3;
				    margin-top:  4em;

			    }
			    .read-more-black {
				    position: absolute;
				    top: 0;
				    left: 50%;
				    z-index: 3;
			    }
			    .read-more-black > a > i {
				    transform: translate(-50%, -260%);
			    }
			    #wrapper > .container-fluid {
				    margin-top: 50px;
			    }

      }
      .promo-list {
        padding: 15px;
        max-width: 1460px; border-radius: 6px; float: none; margin-left: auto; margin-right: auto;
        box-shadow 0 0 22px -5px rgba(0,0,0,0.2);
        margin-top:  30px;
      }
      .promo-list > h2:nth-of-type(1) {
        font-size: 3em;
        float: none;
        margin:  10px auto 2.5em auto;
        text-align: center;
      }
      .promo-list > h2 {
        font-family: 'Montserrat', sans-serif;
        font-weight: 400;
      }
      .promo-list > h2:nth-of-type(2) {
        text-align: center;
      }
      h2#ofertadeldia {
        color: white; font-size: 3em;
        padding: 1em 2em;
        background:#222;
      }
    .products {
    display:grid !important;
    grid-gap: 60px;
    gap: 60px;

    }
    h2#ofertadeldia + .featured-products > .products {
    display: flex !important;
    }
    h2#ofertadeldia + .featured-products > .products > article {
    max-width: 300px !important;
    }
  .products > article {
    margin:0 !important;
    width:auto !important;
    box-shadow: 0 0 22px -5px rgba(0,0,0, 0.2);

  }
  .product-flags > .discount {
    font-size: 1.5em !important;
    font-weight: bold !important;
    background-color: blue !important;
    padding: 10px 12px !important;
  }
  .regular-price {
    font-size: 1.2em !important;
    font-weight: bold !important;
    color: #eee !important;
  }
  .product-in-list {
    display:grid;
    grid-template-columns:100%;
    grid-template-areas: 'imagen' 'disponibilidad' 'nombre' 'precio' 'variantes' 'caracteristicas';
    grid-template-rows: minmax(min-content, max-content) minmax(20px, 2fr) minmax(20px, 2fr) auto minmax(20px, 2fr) minmax(40px,2fr);
    padding:10px;
    /*grid-template-rows:auto;*/
    position:relative;
    /*border:1px solid rgba(0,0,0,0.3);
    box-shadow: 0 0 10px -3px rgba(0,0,0,0.4);*/
    transition:box-shadow 0.2s ease-in;
  }
  .product-in-list:hover {
    box-shadow: 0 16px 15px -3px rgba(0,0,0, 0.5) !important;
  }
  .product-in-list--image-container {
    grid-area:imagen;

  }
  .product-in-list--image-container > a {
    display: block;
    width: 100%;height: 100%;
  }
  .product-in-list--image-container img {
    width:100% !important;
    height:auto !important;
  }
  .product-in-list--image-container .referencia {
    margin-top:0 !important;
  }
  .product-in-list--product-stock {
    grid-area:disponibilidad;
    padding:10px 0px;
  }
  .product-in-list--product-stock .product-in-stock {
    font-size:0.9em;font-weight: normal;padding: 4px 7px;background-color:green;color: white;
  }
  .product-in-list--product-stock .product-out-of-stock {
    font-size:0.9em;font-weight:normal;padding: 4px 7px;background-color:orange;color: white;
  }
  .product-in-list--product-name {
    grid-area:nombre;
    padding:0 5px;
  }
  .product-in-list--product-name .product-name {
    font-size:0.85em !important;
    font-weight: 400 !important;
    color:#666 !important;
    margin-bottom: 0 !important;
  }
  .product-in-list--product-name .product-name > a {
    color:#666 !important;
  }
  .product-in-list--product-price {
    grid-area:precio;
    padding:10px 5px;

  }
  .product-in-list--product-price .price {
    font-size:1.7em;
    font-weight: 400;
    color:#ff3c00;
  }
  .product-in-list--product-features {
    grid-area:caracteristicas;
    padding:5px 5px;
    font-size:0.7em;
    font-weight: lighter ;
    color:black;
    text-align:   center;
    display: flex;
    justify-content: center;
    align-items: center;

  }
  .product-in-list--product-features > span {
    margin:  auto 4px;
  }
  .product-in-list--product-features.grey {
        background-color:#eee;
      }
  .product-in-list--product-variants {
    grid-area:variantes;
    padding:0px 5px 15px 5px;
  }

  .product-in-list--product-variants > .product_temperatures {
    width:calc(100% - 1em);
    text-align:   center;
    margin-right: auto;
    float: none;
    margin-left: auto;
  }
    .product-in-list--product-variants > .hiddendiv {
      min-height:20px;
  }
  .product-in-list--product-variants > div + div {
    display:none;
  }
  .product-in-list--product-variants > .availabletext {
    display: block;
    width: 100%;
    padding: 0 0.5rem;
    text-align: center;
    font-size:  0.7em;
  }
  .product-in-list > .quickviewwrap  {
    position: absolute;
    opacity: 0;
    bottom: 0%;
    right: 0%;
    padding: 12px 14px;
    z-index: 2;
    background: #fff;
    text-align: center;
    width: 60px;
    height:60px;
    border-radius: 50%;
    overflow: hidden;
    -webkit-border-radius: 50%;
    transition: transform 0.01s, opacity 0.05s;
    -webkit-transition: transform 0.01s, opacity 0.05s;
    -moz-transition: transform 0.01s, opacity 0.05s;
    filter:  drop-shadow(0 0 4px rgba(0,0,0,0.3));
    display: flex;
    justify-content:  center;
    align-items:  center;
    
  }
  .quickviewwrap .material-icons {
    transform:rotate(0);
  }
  .product-in-list:hover > .quickviewwrap {
    opacity:1;
    transform:rotate(0) translate(15px, 15px);
        transition: transform 0.01s, opacity 0.3s;
    -webkit-transition: transform 0.01s, opacity 0.3s;
    -moz-transition: transform 0.01s, opacity 0.3s;

  }

  @media(min-width:1200px) {
    .products{
      grid-template-columns: repeat(5,1fr);
      grid-gap: 40px 30px;
      gap: 40px 30px;
    }
  }
  @media(max-width:1199px) {
    .products{
      grid-template-columns: repeat(3,1fr);
      grid-gap: 40px 20px;
      gap: 40px 20px;
    }
  }
  @media(min-width:480px) and (max-width: 767px) {
    .products{
      grid-template-columns: repeat(2,1fr);
      grid-gap: 15px 10px;
      gap: 15px 10px;
      padding-top:20px;

    }
  }
@media(max-width:479px)  {
    .products{
      grid-template-columns: repeat(2,auto);
      grid-gap: 15px 10px;
      gap: 15px 10px;
      padding-top:20px;

    }
  }
  .black-history {

    width: 78%; border-radius: 8px; box-shadow: 0 0 20px -8px rgba(0,0,0,0.4); float:none; clear:both; margin-right:auto; margin-left:auto; padding:2em 4em;
    font-family: 'Montserrat', sans-serif;
    font-weight: 300;
    margin-top: 40px;
    margin-bottom: 40px;
  }
  .black-history h2 {
    color: #222;
    font-weight: 600;
  }
  .btnregister {
    position: relative;
    padding: 15px 20px;
    background: white;
    border: 1px solid #00338e;
    float: none;
    margin: 20px auto 20px auto;
    display:  block ;
    
    border-radius:  6px;
    text-transform:   uppercase ;
    font-size:  1.2em;
    font-weight:  bold;
    font-family:  'Montserrat', sans-serif;
    text-align:   center;

  }
  .btnregister:hover {
    background-color: #00338e;
    color:white;
    border: 1px solid white;

  }
  .blockcart a {
    color:white !important;
  }
</style>
    {block name='head'}
      {include file='_partials/head.tpl'}
      <link rel="stylesheet" href="/modules/paypal/views/css/paypal_fo.css" type="text/css" media="all">
    {/block}
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600&family=Noto+Sans:wght@300;400;500&display=swap" rel="stylesheet">
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}">

    {block name='hook_after_body_opening_tag'}
      {hook h='displayAfterBodyOpeningTag'}
    {/block}

    <main>
      {block name='product_activation'}
        {include file='catalog/_partials/product-activation.tpl'}
      {/block}
           <header id="header">

        {block name='header'}
          {include file='_partials/header-noinfo.tpl'}
        {/block}
      </header>

      {block name='notifications'}
        {include file='_partials/notifications.tpl'}
      {/block}

      <section id="wrapper" style="background: #111 !important">
        {hook h="displayWrapperTop"}
        <div class="container-fluid paddingtop50" style="padding-bottom:50px;">          
          {block name="content_wrapper"}
            <div id="content-wrapper" >
              {hook h="displayContentWrapperTop"}
{block name='content'}

  <section id="main">

    {block name='page_header_container'}
      {block name='page_title' hide}
        <header class="page-header">
        </header>
      {/block}
    {/block}
	{block name='page_content_container'}
  		<section id="content" class="page-content page-cms page-cms-{$cms.id}" style="background: #111 !important; color:white !important;">
    		{block name='cms_content'}
        <div class="col promo-list"><span style="display: block; position: relative; float: none; width: 700px;max-width: 80%; padding: 2em;margin:auto">¿Quieres ser el primero en enterarte de nuestras promociones y novedades? ¡Apúntate a nuestro newsletter!</span>
<iframe data-w-type="embedded" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://xmwkr.mjt.lu/wgt/xmwkr/z62/form?c=1a9d4570" width="100%"></iframe>

<script type="text/javascript" src="https://app.mailjet.com/pas-nc-embedded-v1.js"></script><hr style="height:200px">
        </div>
    		{/block}

		    {block name='hook_cms_dispute_information'}
      			{hook h='displayCMSDisputeInformation'}
    		{/block}

		    {block name='hook_cms_print_button'}
      			{hook h='displayCMSPrintButton'}
    		{/block}
		  </section>
	{/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}

  </section>

{/block}
              {hook h="displayContentWrapperBottom"}
            </div>
          {/block}

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
    </main>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}
  </body>

</html>
