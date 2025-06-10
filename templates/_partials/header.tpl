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
{block name="hook_extra" append}
<style>
  
</style>
{/block}
{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}
{block name='header_top'}
  <div class="header-top">
    {if $page.page_name == 'index'}
      <h1 style="display:none;text-indent: -999999px;">Iluminación LED para el hogar, comercio e industria. Masterled.es</h1>
    {/if}
        <!-- LOGO -->
        <div class="menu-icon main-hamburger" onclick="toggleMenu()">
          <span class="material-symbols-outlined">
            menu
          </span>
        </div>
        <div class="logo-wrapper" id="_desktop_logo"><!--<img class="logobrillo" border="0" src="{$urls.img_url}logo-brillo.png">-->
                <a href="{$urls.base_url}">
                  {if isset($smarty.get.logo)}
                      {if $smarty.get.logo == '1'}
                          <img class="imglogo" src="https://desarrollo.masterled.es/themes/master_beta/assets/img/logo-web3.webp?ver=202515051234" alt="{$shop.name}">
                      {elseif $smarty.get.logo == '2'}
                          <img class="imglogo" src="https://desarrollo.masterled.es/themes/master_beta/assets/img/logo-web3.webp?ver=202515051234" alt="{$shop.name}">
                      {else}
                          <img class="imglogo" src="https://desarrollo.masterled.es/themes/master_beta/assets/img/logo-web3.webp" alt="{$shop.name}">
                      {/if}
                  {else}
                      <img class="imglogo" src="https://desarrollo.masterled.es/themes/master_beta/assets/img/logo-web3.webp" alt="{$shop.name}">
                  {/if}

                  
                </a>

        </div>
        <!-- MAIN MENU -->
        
          
          {*hook h='displayTop'*}
          {include file='_partials/menu_header.tpl'}

        <!-- BOTONES NAVEGACION -->
      <div class="nav-icons">
            <div class="icon-square" id="search-icon">
                <span class="material-symbols-outlined">
                    search
                </span>
            </div>
            <div class="icon-square" id="contact-button">
                <span class="material-symbols-outlined">
                    perm_phone_msg
                </span>
            </div>
            <div class="icon-square" id="{if $customer.is_logged}account-button-logged{else}account-button{/if}">
                {if $customer.is_logged}<a href="#" role="button" id="user-dropdown-toggle">{/if}
                <span class="material-symbols-outlined{if $customer.is_logged} is_logged{/if}">
                      person
                  </span>
                {if $customer.is_logged}</a>{/if}
                  {if $customer.is_logged}
                    <ul aria-labelledby="user-dropdown" class="user-dropdown-menu">
                      <li><a href="{$urls.pages.addresses}">{l s='Mis direcciones' d='Shop.Theme.Customer'}</a></li>
                      <li><a href="{$urls.pages.history}">{l s='Mis pedidos' d='Shop.Theme.Customer'}</a></li>
                      <li><a href="{$urls.pages.discount}">{l s='Mis cupones' d='Shop.Theme.Customer'}</a></li>
                      <li><a href="{$urls.pages.identity}">{l s='Mis datos personales' d='Shop.Theme.Customer'}</a></li>
                      <li><a href="{$urls.pages.my_account}">{l s='Mi cuenta' d='Shop.Theme.Customer'}</a></li>
                      <li><a href="{$urls.pages.wishlist}">{l s='Mis favoritos' d='Shop.Theme.Customer'}</a></li>
                      <hr>
                      <li><a href="{$urls.actions.logout}">{l s='Cerrar sesión' d='Shop.Theme.Customer'}</a></li>
                    </ul>
                  {/if}
              
            </div>
            <div class="icon-square relative" id="cart-on">
<a href="{$urls.pages.cart}?action=show">
          <span class="material-symbols-outlined">
                    shopping_cart
                </span>
<span class="products_in_cart">{if isset($cart) && $cart.products_count == 0}0{else}{$cart.products_count}{/if}</span>
              </a>

      
            </div>
        </div>
      
  </div>
  {hook h='displayNavFullWidth'}
{/block}
<!-- LOGIN / REGISTRO MODAL -->
<div id="authentication-modal">
  <div class="auth-wrapper">
    <div class="close-auth-button">
      <span class="material-symbols-outlined">
        close
      </span>
    </div>
    <div class="auth-header">
      <ul>
        <li id="auth-login-tab" class="tab-active"><h2>{l s='Acceder' d='Shop.Theme.Header'}</h2></li>
        <li id="auth-register-tab"><h2>{l s='Registrarse' d='Shop.Theme.Header'}</h2></li>
        {*<li id="auth-register-tab"><h2>{l s='Crear cuenta' d='Shop.Theme.Header'}</h2></li>*}
      </ul>
    </div>
    <div class="auth-content">
      <div class="element" id="auth-login">
      {if $page.page_name != 'authentication'}
      <form id="unified-login-form" method="post">
        <input type="hidden" id="form_mode" name="form_mode" value="">
        <div class="mb-3" id="email-group">
          <label for="email_input">{l s='Dirección de correo electrónico' d='Shop.Theme.RegistrationForm'}</label>
          <div id="email-wrapper">
            <span class="material-symbols-outlined inline-block">email</span><input type="email" id="email_input" name="email" class="form-control" required placeholder="user@domain.com">
          </div>
          <small id="email-status" class="form-text text-muted"></small>
        </div>

        <div id="password-container" class="mb-3" style="display:none;">
            <label for="password_login_input">{l s='Contraseña' d='Shop.Theme.Customeraccount'}</label>
            <div id="passwd-wrapper">
                <span class="material-symbols-outlined inline-block">lock</span><input type="password" id="password_login_input" name="password" class="form-control" placeholder="..........">
            </div>
        </div>

        <div id="register-fields" style="display:none;">
          <div class="mb-3">
            <label for="firstname_input">{l s='Nombre / Razón social' d='Shop.Theme.RegistrationForm'}</label>
            <div id="firstname_wrapper">
                <span class="material-symbols-outlined inline-block">id_card</span><input type="text" id="firstname_input" name="firstname" class="form-control" placeholder="Name">
            </div>
          </div>

          <div class="mb-3">
            <label for="lastname_input">{l s='Apellidos' d='Shop.Theme.RegistrationForm'}</label>
            <div id="lastname_wrapper">
                <span class="material-symbols-outlined inline-block">id_card</span><input type="text" id="lastname_input" name="lastname" class="form-control" placeholder="Lastname">
            </div>
          </div>

          <div class="mb-3">
            <label for="password_register_input">{l s='Contraseña' d='Shop.Theme.RegistrationForm'}</label>
            <div id="password-reg_wrapper">
                <span class="material-symbols-outlined inline-block">lock</span><input type="password" id="password_register_input" name="password" class="form-control" placeholder="..........">
            </div>
          </div>
        </div>

        <button type="submit" id="submit-button" class="btn btn-primary w-100">
          {l s='Continuar' d='Shop.Theme.RegistrationForm'}
        </button>
      </form>

      <span style="display:block;width:100%;text-align:center;font-size:2rem;font-weight:800;">- O -</span>
      {hook h='displayCustomerLoginForm'}
      {/if} 
      <script>
  document.addEventListener("DOMContentLoaded", function () {
    const emailGroup = document.getElementById("email-group");
    const emailWrapper = document.getElementById("email-wrapper");
    let emailInput = document.getElementById("email_input");
    let submitButton = document.getElementById("submit-button");
    let passwordContainer = document.getElementById("password-container");
    let registerFields = document.getElementById("register-fields");
    const formMode = document.getElementById("form_mode");
    const emailStatus = document.getElementById("email-status");
    function setActiveTab(tabId) {
      const loginTab = document.getElementById("auth-login-tab");
      const registerTab = document.getElementById("auth-register-tab");

      if (loginTab && registerTab) {
        loginTab.classList.remove("tab-active");
        registerTab.classList.remove("tab-active");

        const targetTab = document.getElementById(tabId);
        if (targetTab) {
          targetTab.classList.add("tab-active");
        }
      }
    }


    if (!emailGroup || !emailWrapper || !emailInput || !submitButton || !passwordContainer || !registerFields) {
      console.error("Uno o más elementos no se encontraron en el DOM.");
      return;
    }

    const validEmailDomains = [".com", ".net", ".org", ".info", ".edu", ".gov", ".mil", ".int", ".biz",
      ".name", ".pro", ".coop", ".aero", ".museum", ".asia", ".cat", ".jobs", ".mobi", ".tel", ".travel",
      ".us", ".ca", ".mx", ".br", ".ar", ".cl", ".co", ".ve", ".pe", ".uy", ".py", ".bo", ".ec",
      ".fr", ".de", ".uk", ".it", ".es", ".pt", ".nl", ".be", ".ch", ".se", ".no", ".fi", ".dk", ".pl",
      ".ru", ".ua", ".by", ".lt", ".lv", ".ee", ".cz", ".sk", ".hu", ".ro", ".bg", ".gr", ".si", ".hr", ".ba",
      ".tr", ".il", ".sa", ".ae", ".ir", ".in", ".pk", ".bd", ".lk", ".np", ".my", ".sg", ".ph", ".id", ".th",
      ".vn", ".cn", ".tw", ".jp", ".kr", ".hk", ".mo", ".au", ".nz", ".za", ".ng", ".ke", ".gh", ".eg", ".dz",
      ".xyz", ".top", ".site", ".online", ".tech", ".store", ".blog", ".club", ".design", ".news", ".art",
      ".music", ".love", ".fun", ".media", ".solutions", ".guru", ".digital", ".live", ".games", ".agency",
      ".systems", ".academy", ".finance", ".consulting", ".today", ".community", ".support", ".center",
      ".company", ".ventures", ".photography", ".network", ".social", ".marketing", ".management", ".events",
      ".lawyer", ".accountant", ".engineer", ".doctor", ".health", ".science", ".review", ".expert", ".wiki", ".me"];



    let checkingEmail = false;
    let debounceTimer;

    function hasValidDomain(email) {
      return validEmailDomains.some(domain => email.endsWith(domain));
    }

    function showLoading(state) {
      if (!submitButton) return;
      if (state) {
        submitButton.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Validando...';
        submitButton.disabled = true;
      } else {
        submitButton.innerHTML = "Continuar";
        submitButton.disabled = false;
      }
    }

    function resetForm() {
      passwordContainer.style.display = "none";
      registerFields.style.display = "none";
      submitButton.innerHTML = "Continuar";
      formMode.value = "";

      document.querySelector("#password_login_input").disabled = true;
      document.querySelectorAll("#register-fields input").forEach(input => input.disabled = true);

      emailStatus.textContent = "";
    }

    function replaceEmailInputWithText(email) {
      const span = document.createElement("span");
      span.id = "validated-email";
      span.textContent = email + " ";

      const changeLink = document.createElement("a");
      changeLink.href = "#";
      changeLink.textContent = "(cambiar)";
      changeLink.style.marginLeft = "5px";
      changeLink.addEventListener("click", function (e) {
        e.preventDefault();
        restoreEmailInput(email);
        resetForm();
        emailInput.focus(); // autofocus al volver a editar
      });

      emailWrapper.innerHTML = "";
      emailWrapper.appendChild(span);
      emailWrapper.appendChild(changeLink);

      const hiddenInput = document.createElement("input");
      hiddenInput.type = "hidden";
      hiddenInput.name = "email";
      hiddenInput.value = email;
      emailWrapper.appendChild(hiddenInput);
    }

    function restoreEmailInput(previousEmail = "") {
      emailWrapper.innerHTML = '<input type="email" id="email_input" name="email" class="form-control" value="' + previousEmail + '" required>';
      emailInput = document.getElementById("email_input");
      emailInput.addEventListener("input", handleEmailInput);
    }

    function applyValidationStyles(input, isValid) {
      input.classList.remove("is-valid", "is-invalid");
      if (isValid) {
        input.classList.add("is-valid");
      } else {
        input.classList.add("is-invalid");
      }
    }

    function handleEmailInput() {
      clearTimeout(debounceTimer);
      const email = emailInput.value.trim();

      if (email.length === 0) {
        resetForm();
        applyValidationStyles(emailInput, false);
        emailStatus.textContent = "Introduce un correo válido.";
        return;
      }

      if (!hasValidDomain(email)) {
        applyValidationStyles(emailInput, false);
        emailStatus.textContent = "Domino de correo no reconocido.";
        return;
      }

      debounceTimer = setTimeout(() => {
        if (checkingEmail) return;

        checkingEmail = true;
        showLoading(true);
        emailStatus.textContent = "Verificando dirección de correo...";

        fetch("/index.php?fc=module&module=ml_customlogin&controller=checkemail&email=" + encodeURIComponent(email))
          .then(response => response.json())
          .then(data => {
            checkingEmail = false;
            showLoading(false);

            replaceEmailInputWithText(email);
            applyValidationStyles(emailInput, true);
            emailStatus.textContent = "";

            if (data.exists) {
              formMode.value = "login";
              passwordContainer.style.display = "block";
              registerFields.style.display = "none";
              submitButton.innerHTML = "Iniciar sesión";

              document.querySelector("#password_login_input").disabled = false;
              document.querySelectorAll("#register-fields input").forEach(input => input.disabled = true);
              setActiveTab("auth-login-tab");

              // Autofocus en login
              document.querySelector("#password_login_input").focus();

            } else {
              formMode.value = "register";
              passwordContainer.style.display = "none";
              registerFields.style.display = "block";
              submitButton.innerHTML = "Registrarse";

              document.querySelector("#password_login_input").disabled = true;
              document.querySelectorAll("#register-fields input").forEach(input => input.disabled = false);
              setActiveTab("auth-register-tab");

              // Autofocus en registro
              document.querySelector("#firstname_input").focus();
            }
          })
          .catch(error => {
            checkingEmail = false;
            showLoading(false);
            applyValidationStyles(emailInput, false);
            emailStatus.textContent = "Error al validar el correo.";
            console.error("Error en la validación del email:", error);
          });
      }, 600);
    }

    emailInput.addEventListener("input", handleEmailInput);

    // Submit del formulario
    document.getElementById("unified-login-form").addEventListener("submit", function (e) {
      const mode = formMode.value;

      if (!mode) {
        e.preventDefault();
        alert("Por favor, introduce un correo válido antes de continuar.");
        return;
      }

      const hiddenSubmit = document.createElement("input");
      hiddenSubmit.type = "hidden";
      const prestashopAuthUrl = '{$urls.pages.authentication|escape:'javascript':'UTF-8'}';

      if (mode === "login") {
        hiddenSubmit.name = "submitLogin";
        hiddenSubmit.value = "1";
      } else if (mode === "register") {
        hiddenSubmit.name = "submitCreate";
        hiddenSubmit.value = "1";
      }
      this.action = prestashopAuthUrl + (mode === 'register' ? '?create_account=1' : '');


      this.appendChild(hiddenSubmit);
    });
  });
</script>   
      </div>
      {*<div class="element" id="auth-register">
        <form id="register-form" action="https://desarrollo.masterled.es/es/autentificacion" method="get">
            <input type="hidden" name="create_account" value="1">
             <div class="firstnamewrapper">
              <label for="firstname" class="form-control-label required" >{l s='Nombre / Razón social' d='Shop.Theme.Login'}</label>
              <div class="sec-2">
                <span class="material-symbols-outlined inline-block">id_card</span>
                <input id="firstname" name="firstname" placeholder="Nombre" type="text" class="form-control" required="required" autocomplete="given-name, organization">
              </div>
            </div>
            <div class="lastnamewrapper">
              <label for="lastname" class="form-control-label required" >{l s='Apellidos' d='Shop.Theme.Login'}</label>
              <div class="sec-2">
                <span class="material-symbols-outlined inline-block">id_card</span>
                <input name="lastname" type="text" class="form-control" required="required" autocomplete="family-name" placeholder="">
                <ion-icon class="show-hide" name="eye-outline"></ion-icon>
              </div>
            </div>
            <div class="email">
              <label for="email" class="form-control-label required" >{l s='Correo electrónico' d='Shop.Theme.Login'}</label>
              <div class="sec-2">
                <span class="material-symbols-outlined inline-block">mail</span>
                <input name="email" type="email" class="form-control" required="required" autocomplete="email" placeholder="">
                <ion-icon class="show-hide" name="eye-outline"></ion-icon>
              </div>
            </div>
            <button id="submit-registration" type="submit" class="btn btn-primary" type="submit">{l s='Registro' d='Shop.Theme.Login'}</button>
        </form>
      </div>*}
    </div>
  </div>
</div>
<!-- /LOGIN REGISTRO MODAL -->

<!-- CONTACT MODAL -->

<div id="contact-modal">
  <div class="contact-wrapper">
    <div class="close-contact-button">
      <span class="material-symbols-outlined">
        close
      </span>
    </div>
    <div class="contact-inner row">
      <div class="col-xs-12 col-md-4" id="contact-map"><a href="https://www.google.com/maps/place/MASTERLED/@42.216819,-8.6963377,18z/data=!4m5!3m4!1s0x0:0x7df93e1531b0b850!8m2!3d42.2166591!4d-8.6968958"></a><img border="0" src="https://masterled.es/img/cms/mapamaster.jpg"></div>
      <div class="col-xs-12 col-md-8 contact-content">
        <div id="contact-horario" class="d-flex">
          <div>
            <span class="material-symbols-outlined">
              schedule
            </span>
          </div>
          <div>
            <h3>Horario comercial:</h3>
            <ul>
              <li>Lunes - Jueves: 8:30 - 18:00h</li>
              <li>Viernes: 8:30 - 17:00h</li>
            </ul>
          </div>
        </div>

        <div class="d-flex">
          <div>
            <span class="material-symbols-outlined">
              call
            </span>
          </div>
          <div>
            <h3>Llámanos</h3>
            <p>Te asesoramos ante cualquier duda o consulta sobre tu pedido, nuestros productos y servicios:</p>
            <ul>
              <li><a href="tel:+34986954005">986 954 005</a></li>
              <li><a href="tel:+34886311868">886 311 868</a></li>
            </ul>
          </div>
        </div>
        <div class="d-flex">
          <div>
            <img border="0" style="width:1.5em" src="{$urls.img_url}icons/whatsapp-icon.png">
          </div>
          <div>
            <h3>Whatsapp</h3>
            <p>Envíanos un mensaje y te contestaremos lo antes posible</p>
            <ul>
              <li><a href="http://wa.me/+34684775761">684 775 761</a></li>
              
            </ul>
          </div>
        </div>
        <div class="d-flex">
          <div>
            <span class="material-symbols-outlined">
              phone_forwarded
            </span>
          </div>
          <div>
            <h3>¡Te llamamos!</h3>
            <p>Déjanos tu número de teléfono y nombre y uno de nuestros agentes contactará contigo lo antes posible.</p>
            <form id="llamameForm">
            <input type="text" value="" class="form-control" name="nombre" placeholder="Su nombre"><br>
            <input type="text" value="" class="form-control" name="phone" placeholder="Nº Teléfono"><br>
            <input type="hidden" value="1" name="sent">
            <input type="hidden" value="Español (Spanish)" name="idioma">
            <input type="submit" class="btn btn-primary" name="submit" value="ENVIAR" id="enviar">
            <div id="emplacementRecaptcha"><div class="grecaptcha-badge" data-style="inline" style="width: 256px; height: 60px; box-shadow: gray 0px 0px 5px;"><div class="grecaptcha-logo"><iframe title="reCAPTCHA" width="256" height="60" role="presentation" name="a-mamsnvv1y8qk" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6LeaAisaAAAAAJflFloDK_LXyOerHN3xKI4SP6Qb&amp;co=aHR0cHM6Ly9tYXN0ZXJsZWQuZXM6NDQz&amp;hl=es&amp;type=image&amp;v=IyZ984yGrXrBd6ihLOYGwy9X&amp;size=invisible&amp;badge=inline&amp;cb=68zxgppcrs0k"></iframe></div><div class="grecaptcha-error"></div><textarea id="g-recaptcha-response" name="g-recaptcha-response" class="g-recaptcha-response" style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea></div><iframe style="display: none;"></iframe></div>
          </form>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>