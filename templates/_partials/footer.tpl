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



 <div class="container-fluid block-social" style="">
 <div class="row">
     <div class="col-xs-12 social-container" style="display:none">
      <span>{l s='Síguenos en nuestras redes' d='Shop.Theme.Global'}</span>
         <ul>
           <li class="facebook"><a href="https://www.facebook.com/Masterled.Iluminacion" target="_blank">Facebook</a></li>
           <li class="twitter"><a href="https://twitter.com/Masterled_es" target="_blank">Twitter</a></li>
           <li class="youtube"><a href="https://www.youtube.com/channel/UC9qZX1Hq8Bf1VomzkcqW89g" target="_blank">YouTube</a></li>
           <li class="instagram"><a href="https://www.instagram.com/desarrollo.masterled.es/" target="_blank">Instagram</a></li>
       </ul>
     </div>
 </div>
 
</div>

<div class="container">
  <div class="row">
    {block name='hook_footer_before'}
      {*hook h='displayFooterBefore'*}
    {/block}

  </div>
</div>
<div class="footer-container">
  <div class="container">
    <div class="row">
      {block name='hook_footer'}
        {hook h='displayFooter'}
      {/block}
    </div>
    <div class="row">
      {block name='hook_footer_after'}
        <div class="col-xs-12 d-none">
          {l s='¿Necesitas ayuda?' d='Shop.Theme.Global'}
          <div class="footer-contact">
            <a href="tel:+34986954005" class="footer-phone">986 954 005</a><br>
            <a href="tel:+34886311868" class="footer-phone">886 311 868</a><br>
            <a href="mailto:masterled@homekit.es">
              <i class="material-icons rtl-no-flip">email</i>
              <span class="footer-email">masterled@homekit.es</span>
            </a>
          </div>
          {hook h='displayFooterAfter'}
        </div>
      {/block}
    </div>
  </div>
</div>
<style>
.footer-social-links {
  padding: 30px 0;
  background: #f8f9fa;
}

.social-icons {
  display: flex;
  justify-content: center;
  gap: 20px;
}

.social-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  color: #fff;
  transition: background 0.3s ease, color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
}

.social-icon:hover {
  transform: translateY(-3px);
  box-shadow: 0 5px 10px -3px rgba(0,0,0,0.4);
  background:white;
  color:#000000;
}

.social-icon svg {
  width: 20px;
  height: 20px;
  fill: currentColor;
}

.facebook {
  background: #3b5998;
}

.twitter {
  background: #000000;
}

.instagram {
  background: linear-gradient(45deg, #405de6, #5851db, #833ab4, #c13584, #e1306c, #fd1d1d);
}

.youtube {
  background: #ff0000;
}

.bluesky {
  background: #1da1f2;
}
</style>

<div class="footer-social-links">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 text-center">
        <div class="social-icons">
          <a href="https://www.facebook.com/Masterled.Iluminacion" target="_blank" class="social-icon facebook" title="{l s='Síguenos en Facebook' d='Shop.Theme.Global'}">
            <svg viewBox="0 0 320 512"><path d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z"/></svg>
          </a>
          <a href="https://twitter.com/Masterled_es" target="_blank" class="social-icon twitter" title="{l s='Síguenos en X' d='Shop.Theme.Global'}">
            <svg viewBox="0 0 512 512"><path d="M389.2 48h70.6L305.6 224.2 487 464H345L233.7 318.6 106.5 464H35.8L200.7 275.5 26.8 48H172.4L272.9 180.9 389.2 48zM364.4 421.8h39.1L151.1 88h-42L364.4 421.8z"/></svg>
          </a>
          <a href="https://www.instagram.com/masterled.es/" target="_blank" class="social-icon instagram" title="{l s='Síguenos en Instagram' d='Shop.Theme.Global'}">
            <svg viewBox="0 0 448 512"><path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"/></svg>
          </a>
          <a href="https://www.youtube.com/channel/UC9qZX1Hq8Bf1VomzkcqW89g" target="_blank" class="social-icon youtube" title="{l s='Síguenos en YouTube' d='Shop.Theme.Global'}">
            <svg viewBox="0 0 576 512"><path d="M549.655 124.083c-6.281-23.65-24.787-42.276-48.284-48.597C458.781 64 288 64 288 64S117.22 64 74.629 75.486c-23.497 6.322-42.003 24.947-48.284 48.597-11.412 42.867-11.412 132.305-11.412 132.305s0 89.438 11.412 132.305c6.281 23.65 24.787 41.5 48.284 47.821C117.22 448 288 448 288 448s170.78 0 213.371-11.486c23.497-6.321 42.003-24.171 48.284-47.821 11.412-42.867 11.412-132.305 11.412-132.305s0-89.438-11.412-132.305zm-317.51 213.508V175.185l142.739 81.205-142.739 81.201z"/></svg>
          </a>
          <a href="https://bsky.app/profile/masterled.es" target="_blank" class="social-icon bluesky" title="{l s='Síguenos en Bluesky' d='Shop.Theme.Global'}">
            <svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewbox="0 0 576 512">
 <path d="m135.72 44.03c66.496 49.921 138.02 151.14 164.28 205.46 26.262-54.316 97.782-155.54 164.28-205.46 47.98-36.021 125.72-63.892 125.72 24.795 0 17.712-10.155 148.79-16.111 170.07-20.703 73.984-96.144 92.854-163.25 81.433 117.3 19.964 147.14 86.092 82.697 152.22-122.39 125.59-175.91-31.511-189.63-71.766-2.514-7.3797-3.6904-10.832-3.7077-7.8964-0.0174-2.9357-1.1937 0.51669-3.7077 7.8964-13.714 40.255-67.233 197.36-189.63 71.766-64.444-66.128-34.605-132.26 82.697-152.22-67.108 11.421-142.55-7.4491-163.25-81.433-5.9562-21.282-16.111-152.36-16.111-170.07 0-88.687 77.742-60.816 125.72-24.795z" fill="currentColor"/>
</svg>
          </a>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="footer-payment-information">
  <div class="visa-payment" title="{l s='Pagos seguros con VISA' d='Shop.Theme.Global'}"></div>
  <div class="mastercard-payment" title="{l s='Pagos seguros con Mastercard' d='Shop.Theme.Global'}"></div>
  <div class="paypal-payment" title="{l s='Pagos seguros con Paypal' d='Shop.Theme.Global'}"></div>
  <div class="applepay-payment" title="{l s='Pagos seguros con Apple Pay' d='Shop.Theme.Global'}"></div>
  <div class="googlepay-payment" title="{l s='Pagos seguros con Google Pay' d='Shop.Theme.Global'}"></div>
  <div class="sequra-payment" title="{l s='Pagos seguros con SeQura' d='Shop.Theme.Global'}"></div>
  <div class="transfer-payment" title="{l s='Pagos seguros por Transferencia bancaria' d='Shop.Theme.Global'}"> </div>
  <div class="bizum-payment" title="{l s='Pagos seguros con Bizum' d='Shop.Theme.Global'}"></div>
</div>
<div class="footer-bottom">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 d-flex justify-content-center">
        <p class="copyright"> 
          {block name='copyright_link'}
            {l s='%copyright% %year% - Masterled.es Iluminación LED' sprintf=['%prestashop%' => 'PrestaShop™', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
          {/block}
        </p>
        <p class="design">Diseño y desarrollo por <a href="https://www.masterled.es" target="_blank">Masterled</a></p>
      </div>
    </div>
  </div>