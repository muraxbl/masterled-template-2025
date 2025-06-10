{extends file='page.tpl'}

{block name='page_title'}
  {l s='Log in or Register' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
<style>
.bg-shape {
            position: absolute;
            border-radius: 50%;
            opacity: 0.1;
            animation: float 6s ease-in-out infinite;
        }

        .bg-shape:nth-child(1) {
            width: 380px;
            height:380px;
            background: #ffdd00;
            top: 10%;
            left: 20%;
            animation-delay: 0s;
        }

        .bg-shape:nth-child(2) {
            width: 120px;
            height: 120px;
            background: #00468e;
            top: 70%;
            right: 20%;
            animation-delay: 2s;
        }

        .bg-shape:nth-child(3) {
            width: 60px;
            height: 60px;
            background: #bad406;
            bottom: 20%;
            left: 10%;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-70px) rotate(180deg); }
        }

        .login-container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(20px);
            border-radius: 1rem;
            padding: 3rem;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 1220px;
            position: relative;
            border: 1px solid rgba(255, 255, 255, 0.2);
            animation: slideIn 0.8s ease-out;
        }
        .login-inner-container {
            max-width: 500px;
            margin: 0 auto;
            float: none;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .logo-section {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo {
            color: #4285f4;
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 10px;
            position: relative;
        }

        .logo::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: linear-gradient(45deg, #4285f4, #34a853);
            border-radius: 2px;
        }

        .subtitle {
            color: #666;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .warranty-text {
            color: #888;
            font-size: 12px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
            font-size: 14px;
        }

        .input-container {
            position: relative;
        }

        .form-group input {
            width: 100%;
            padding: 15px 20px 15px 50px;
            border: 2px solid #e1e5e9;
            border-radius: 12px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }

        .form-group input:focus {
            outline: none;
            border-color: #4285f4;
            background: white;
            box-shadow: 0 0 0 3px rgba(66, 133, 244, 0.1);
        }

        .input-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-group input:focus + .input-icon {
            color: #4285f4;
        }

        .login-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            font-size: 14px;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .remember-me input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #4285f4;
        }

        .forgot-password {
            color: #4285f4;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .forgot-password:hover {
            color: #3367d6;
            text-decoration: underline;
        }

        .continue-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(45deg, #4285f4, #34a853);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .continue-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(66, 133, 244, 0.3);
        }

        .continue-btn:active {
            transform: translateY(0);
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 30px 0;
            color: #999;
            font-size: 14px;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: #e1e5e9;
        }

        .divider span {
            padding: 0 20px;
        }

        .register-section {
            text-align: center;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 12px;
            margin-top: 20px;
        }

        .register-text {
            color: #666;
            margin-bottom: 15px;
        }

        .register-btn {
            color: #4285f4;
            text-decoration: none;
            font-weight: 600;
            padding: 10px 20px;
            border: 2px solid #4285f4;
            border-radius: 8px;
            display: inline-block;
            transition: all 0.3s ease;
        }

        .register-btn:hover {
            background: #4285f4;
            color: white;
            transform: translateY(-1px);
        }

        .social-login {
            margin-top: 20px;
        }

        .social-btn {
            width: 100%;
            padding: 12px;
            border: 2px solid #e1e5e9;
            background: white;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-bottom: 10px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .social-btn:hover {
            border-color: #ddd;
            background: #f8f9fa;
            transform: translateY(-1px);
        }

        .google-btn {
            color: #4285f4;
        }

        .facebook-btn {
            color: #1877f2;
        }
.social-login-link {
    display: flex
;
    flex-wrap: nowrap;
    justify-content: center;
    width: 90%;
    border-radius: 0.325rem;
    border: 1px solid rgba(0, 0, 0, 0.5);
    align-items: center;
    padding: 0.7rem;
    float: none;
    margin: 0.5rem auto;
    gap: 0.6rem;
}
        /* Responsive */
        @media (max-width: 480px) {
            .login-container {
                margin: 20px;
                padding: 30px 25px;
            }
            
            .logo {
                font-size: 28px;
            }
        }

        /* Loading animation */
        .loading {
            display: none;
            width: 20px;
            height: 20px;
            border: 2px solid #ffffff;
            border-top: 2px solid transparent;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-right: 10px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
</style>

<section class="row justify-content-center">
    <div class="bg-shape"></div>
    <div class="bg-shape"></div>
    <div class="bg-shape"></div>

     <div class="login-container">
     <div class="login-inner-container">
        <div class="logo-section">
            <div class="subtitle">Accede o regístrate</div>
            <div class="warranty-text"></div>
        </div>

        <form id="loginForm">
            <div class="form-group">
                <label for="email">Dirección de correo electrónico</label>
                <div class="input-container">
                    <input type="email" id="email" name="email" placeholder="usuario@dominio.com" required>
                    <i class="fas fa-envelope input-icon"></i>
                </div>
            </div>

            <div class="form-group">
                <label for="password">Contraseña</label>
                <div class="input-container">
                    <input type="password" id="password" name="password" placeholder="Introduce tu contraseña" required>
                    <i class="fas fa-lock input-icon"></i>
                </div>
            </div>

            <div class="login-options">
                <label class="remember-me">
                    <input type="checkbox" id="remember">
                    <span>Recordarme</span>
                </label>
                <a href="#" class="forgot-password">¿Olvidaste tu contraseña?</a>
            </div>

            <button type="submit" class="continue-btn">
                <div class="loading"></div>
                <span>CONTINUAR</span>
            </button>
        </form>

        <div class="divider">
            <span>o continúa con</span>
        </div>

        <div class="social-login">
        {hook h='displayCustomerLoginForm'}
        

        </div>
        {hook h='displayCustomerLoginFormAfter'}
        <div class="register-section">
            <div class="register-text">¿No tienes una cuenta?</div>
            <a href="#" class="register-btn">Crear cuenta nueva</a>
        </div>
      </div>
    </div>

    <script>
        // Form handling
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const button = this.querySelector('.continue-btn');
            const loading = button.querySelector('.loading');
            const text = button.querySelector('span');
            
            // Show loading state
            loading.style.display = 'inline-block';
            text.textContent = 'INICIANDO SESIÓN...';
            button.disabled = true;
            
            // Simulate login process
            setTimeout(() => {
                // Reset button state
                loading.style.display = 'none';
                text.textContent = 'CONTINUAR';
                button.disabled = false;
                
                // Here you would typically submit the form to your PrestaShop backend
                alert('Aquí se integraría con el sistema de autenticación de PrestaShop');
            }, 2000);
        });

        // Input focus animations
        const inputs = document.querySelectorAll('input[type="email"], input[type="password"]');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentNode.classList.add('focused');
            });
            
            input.addEventListener('blur', function() {
                this.parentNode.classList.remove('focused');
            });
        });

        // Social login handlers
        document.querySelectorAll('.social-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const provider = this.textContent.includes('Google') ? 'Google' : 'Facebook';
                alert(`Integración con - Aquí se implementaría OAuth`);
            });
        });

        // Forgot password handler
        document.querySelector('.forgot-password').addEventListener('click', function(e) {
            e.preventDefault();
            alert('Redirigir a página de recuperación de contraseña');
        });

        // Register button handler
        document.querySelector('.register-btn').addEventListener('click', function(e) {
            e.preventDefault();
            alert('Redirigir a página de registro');
        });
    </script>

</section>

{block name='display_after_login_form'}
  {hook h='displayCustomerLoginFormAfter'}
{/block}

{/block}
