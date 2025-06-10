<!-- LOGIN / REGISTRO MODAL -->
<div id="authentication-modal">
    <div class="contact-modal-header">
            <h2 class="contact-modal-title">Accede o regístrate</h2>
            <button class="contact-close-btn close-auth-button">×</button>
    </div>

  <div class="auth-modal-content">

    <div class="auth-content">
      <div class="element" id="auth-login">
        {if $page.page_name != 'authentication'}
        <button class="social-login-link" id="show-login-form">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            height="25px"
            viewBox="0 -960 960 960"
            fill="#666"
          >
            <path
              d="M146.67-160q-27 0-46.84-19.83Q80-199.67 80-226.67v-506.66q0-27 19.83-46.84Q119.67-800 146.67-800h666.66q27 0 46.84 19.83Q880-760.33 880-733.33v506.66q0 27-19.83 46.84Q840.33-160 813.33-160H146.67ZM480-454.67 146.67-670v443.33h666.66V-670L480-454.67Zm0-66.66 330.67-212H150l330 212ZM146.67-670v-63.33V-226.67-670Z"
            />
          </svg>
          <span
            >{l s='Empieza con tu correo electrónico'
            d='Shop.Theme.Login'}</span
          >
        </button>
        <form id="unified-login-form" method="post">
          <input type="hidden" id="form_mode" name="form_mode" value="" />
          <div class="mb-3" id="email-group">
            <label for="email_input"
              >{l s='Empieza con tu email'
              d='Shop.Theme.RegistrationForm'}</label
            >
            <div id="email-wrapper">
              <span class="material-symbols-outlined inline-block">email</span
              ><input
                type="email"
                id="email_input"
                name="email"
                class="form-control"
                required
                placeholder="user@domain.com"
              />
            </div>
            <small id="email-status" class="form-text text-muted"></small>
          </div>

          <div id="password-container" class="mb-3" style="display: none">
            <label for="password_login_input"
              >{l s='Bienvenido otra vez. Introduce tu contraseña' d='Shop.Theme.Customeraccount'}</label
            >
            <div id="passwd-wrapper">
              <span class="material-symbols-outlined inline-block">lock</span
              ><input
                type="password"
                id="password_login_input"
                name="password"
                class="form-control"
                placeholder=".........."
              />
            </div>
          </div>

          <div id="register-fields" style="display: none">
            <p>Parece que todavía no tienes cuenta. ¡Introduce tus datos y regístrate!</p>
            <div class="mb-3">
              <label for="firstname_input"
                >{l s='Nombre / Razón social'
                d='Shop.Theme.RegistrationForm'}</label
              >
              <div id="firstname_wrapper">
                <span class="material-symbols-outlined inline-block"
                  >id_card</span
                ><input
                  type="text"
                  id="firstname_input"
                  name="firstname"
                  class="form-control"
                  placeholder="Name"
                />
              </div>
            </div>

            <div class="mb-3">
              <label for="lastname_input"
                >{l s='Apellidos' d='Shop.Theme.RegistrationForm'}</label
              >
              <div id="lastname_wrapper">
                <span class="material-symbols-outlined inline-block"
                  >id_card</span
                ><input
                  type="text"
                  id="lastname_input"
                  name="lastname"
                  class="form-control"
                  placeholder="Lastname"
                />
              </div>
            </div>

            <div class="mb-3">
              <label for="password_register_input"
                >{l s='Contraseña' d='Shop.Theme.RegistrationForm'}</label
              >
              <div id="password-reg_wrapper">
                <span class="material-symbols-outlined inline-block">lock</span
                ><input
                  type="password"
                  id="password_register_input"
                  name="password"
                  class="form-control"
                  placeholder=".........."
                />
              </div>
            </div>
          </div>

          <button
            type="submit"
            id="submit-button"
            class="btn btn-primary w-100"
          >
            {l s='Continuar' d='Shop.Theme.RegistrationForm'}
          </button>
        </form>
        {else}
        <h3>
          Ya estás en la página de autentificacion. ¡Puedes cerrar este pop up!
        </h3>
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
      <div class="element" id="social-login">
        <span style="display:block;width:100%;text-align:center;font-size:1.4rem;font-weight:400;" class="mt-5">{l s='O continua con:' d='Shop.Theme.Login'}</span>
        <div style="display:flex;">
            {hook h='displayCustomerLoginForm'}
        </div>
      </div>
    </div>
  </div>
</div>
<!-- /LOGIN REGISTRO MODAL -->

<!-- CONTACT MODAL -->
<div id="contact-modal" class="contact-modal-overlay">
        <div class="contact-modal-header">
            <h2 class="contact-modal-title">Contacto</h2>
            <button class="close-contact-button contact-close-btn">×</button>
        </div>
        
        <div class="contact-modal-content">
            <!-- Ubicación -->
            <div class="contact-section contact-location-section">
                <div class="contact-section-header">
                    <div class="contact-section-icon">
                        <span class="material-symbols-outlined">location_on</span>
                    </div>
                    <div class="contact-section-title">¿Dónde estamos?</div>
                </div>
                <div class="contact-section-content">
                    <div><strong>Avenida Alcalde Lavadores, 122</strong></div>
                    <div>36214, Vigo, Pontevedra</div>
                    <div style="aspect-ratio: 1 / 1.15">
                    <a href="https://maps.app.goo.gl/i8sZheqFqKH3KnU19"><img border="0" style="object-fit: cover;width:100%;height:100%;" src="{$urls.img_url}maps-masterled.png" alt="Mapa de ubicación de Masterled en Vigo"></a>
                    </div>
                </div>
            </div>

            <!-- Horario -->
            <div class="contact-section contact-hours-section">
                <div class="contact-section-header">
                    <div class="contact-section-icon">
                        <span class="material-symbols-outlined">
                            schedule
                        </span>
                    </div>
                    <div class="contact-section-title">Horario comercial</div>
                </div>
                <div class="contact-section-content">
                    <div class="contact-business-hours">
                        <div><strong>L-J:</strong> 8:30 - 18:00h</div>
                        <div><strong>V:</strong> 8:30 - 17:00h</div>
                    </div>
                </div>
            </div>

            <!-- Teléfonos -->
            <div class="contact-section contact-contact-section">
                <div class="contact-section-header">
                    <div class="contact-section-icon">
                        <span class="material-symbols-outlined">
                            perm_phone_msg
                        </span>
                    </div>
                    <div class="contact-section-title">Llámanos</div>
                </div>
                <div class="contact-section-content">
                    <div style="margin-bottom: 8px; font-size: 11px;">Asesoramiento y soporte técnico:</div>
                    <div class="contact-contact-info">
                        <a href="tel:986954005" class="contact-phone-number">986 954 005</a>
                        <a href="tel:886311868" class="contact-phone-number">886 311 868</a>
                    </div>
                    <a href="https://wa.me/34684775761" class="contact-whatsapp-btn" style="color:white !important">
                        WhatsApp: 684 775 761
                    </a>
                </div>
            </div>

            <!-- Formulario -->
            <div class="contact-section contact-form-section">
                <div class="contact-section-header">
                    <div class="contact-section-icon"><span class="material-symbols-outlined">
phone_forwarded
</span></div>
                    <div class="contact-section-title">¡Te llamamos!</div>
                </div>
                <div class="contact-section-content">
                    <div style="margin-bottom: 12px; font-size: 11px;">
                        Déjanos tus datos y contactaremos contigo.
                    </div>
                    <form class="contact-contact-form" onsubmit="submitForm(event)">
                        <div class="contact-form-group">
                            <label class="contact-form-label" for="name">Nombre</label>
                            <input type="text" id="name" class="contact-form-input" placeholder="Tu nombre" required>
                        </div>
                        <div class="contact-form-group">
                            <label class="contact-form-label" for="phone">Teléfono</label>
                            <input type="tel" id="phone" class="contact-form-input" placeholder="Tu teléfono" required>
                        </div>
                        <button type="submit" class="contact-submit-btn">Enviar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
