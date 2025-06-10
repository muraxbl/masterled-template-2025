/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
 */
$(document).bind("keydown", function (e) {
  if (e.which == 27) {
    if ($(".category_tree").hasClass("openleft")) {
      $(".category_tree").removeClass("openleft");
      $("body").removeClass("bodyleft");
    }
  }
});
$(document).on("click", function (event) {
  // Event listener en el DOM
  //if(!$(event.target).closest('.category_tree').length) { // Si se realiza click fuera del contenedor del menú
  if (!$(event.target).closest(".vert-menu").length) {
    // Y
    if ($(".category_tree").hasClass("openleft")) {
      $(".category_tree").removeClass("openleft");
      $("body").removeClass("bodyleft");
    } else {
      //console.log('menu lateral no desplegado');
    }
  }
  // }
});

// ]]>

$(document).ready(function () {
  //$('main').prepend('<p style="display:fixed;top:0;left:0;width:100%;z-index:9999999;background:red;color:white">'+$(window).width()+'</p>');
  let $token = false;

  $("#showcategories").on("click", function () {
    if (!$token) {
      $(".categories-wrap.behind").addClass("visible");
      $(this).text("Ver menos");
      $token = true;
    } else {
      $(".categories-wrap.behind").removeClass("visible");
      $(this).text("Ver más");
      $token = false;
    }
  });
});

$(document).on("click", "#user-dropdown-toggle", function (e) {
  e.preventDefault();
  //console.log('click');
  if ($(".user-dropdown-menu").hasClass("unfolded")) {
    $(".user-dropdown-menu").removeClass("unfolded");
  } else {
    $(".user-dropdown-menu").addClass("unfolded");
  }
});
$(document).ready(function () {
  $(window).resize(function () {});

  /*$(document).on('click', '.product-actions .add-to-cart', function(){
		$(this).addClass('animated');
		setTimeout(function(){
			console.log('click '+prestashop.urls.current_url);
			if($('#cart-on').length) {
				$('#cart-on').load(prestashop.urls.current_url +' #cart-on *');
			}else{
				$('#cart-off')
                .attr('id', 'cart-on') // Cambiar el ID
                .removeClass('relative') // Eliminar la clase 'relative' si es necesario
                .load(prestashop.urls.current_url + ' #cart-on *'); // Cargar contenido dinámico
        	}
		}, 500);
		setTimeout(function(){
        	$('.add-to-cart').removeClass('animated');

		}, 2100);


	});*/
  // 1. Al hacer click en el botón: animar visualmente
  $(document).on("click", ".add-to-cart", function () {
    const $btn = $(this);
    const $cartTarget = $("#cart-on a");
    $(this).addClass("animated");
    setTimeout(() => $(this).removeClass("animated"), 2100);
    if (!$cartTarget.length) return;

    // Coordenadas del botón
    setTimeout(() => {
      const btnRect = $btn[0].getBoundingClientRect();
      const startX = btnRect.left + btnRect.width / 2;
      const startY = btnRect.top + btnRect.height / 2;

      const cartRect = $cartTarget[0].getBoundingClientRect();
      const endX = cartRect.left + cartRect.width / 2;
      const endY = cartRect.top + cartRect.height / 2;

      const $circle = $('<div class="fly-circle"></div>');
      $circle.css({ left: `${startX}px`, top: `${startY}px` });
      $("body").append($circle);

      $circle[0].offsetWidth; // Forzar reflow

      const deltaX = endX - startX;
      const deltaY = endY - startY;

      $circle.css({
        transform: `translate(${deltaX}px, ${deltaY}px) scale(0.1)`,
        opacity: 0,
      });

      // Rebote en el contador del carrito al finalizar
      setTimeout(() => {
        $circle.remove();
        const $count = $("#cart-on .products_in_cart");
        if ($count.length) {
          $count.addClass("bounce-on-cart");
          setTimeout(() => $count.removeClass("bounce-on-cart"), 500);
        }
      }, 800);
    }, 800); // ⏱ Esperamos a que termine la animación del botón
  });

  // 2. Al actualizar el carrito: actualizar numerito + animar
  prestashop.on("updateCart", function (data) {
    const $count = $(".products_in_cart");

    if ($count.length && data?.reason?.cart) {
      const cart = data.reason.cart;
      const totalProducts = cart.products_count;

      $count.text(totalProducts);
      $count.addClass("pulse-animation");
      setTimeout(() => $count.removeClass("pulse-animation"), 1000);
    }
  });

  var $productQuantity = $(".product-quantity");
  var fixedClass = "fixed-bottom";
  var breakpoint = 768;

  if ($productQuantity.length) {
    // Definimos la posición inicial y altura del elemento
    var elementOffsetTop = $productQuantity.offset().top;
    var elementHeight = $productQuantity.outerHeight();

    // Función para manejar el scroll
    function handleScroll() {
      if ($(window).width() <= breakpoint) {
        var scrollTop = $(window).scrollTop();
        var isBelowBreakpoint =
          scrollTop > elementOffsetTop + elementHeight - 100;

        if (isBelowBreakpoint && !$productQuantity.hasClass(fixedClass)) {
          $productQuantity.addClass(fixedClass);
        } else if (
          !isBelowBreakpoint &&
          $productQuantity.hasClass(fixedClass)
        ) {
          $productQuantity.removeClass(fixedClass);
        }
      } else {
        $productQuantity.removeClass(fixedClass); // Remueve la clase si se supera el breakpoint
      }
    }

    // Detectar scroll
    $(window).on("scroll", handleScroll);

    // Recalcular posiciones al cambiar tamaño de ventana
    $(window).on("resize", function () {
      if ($(window).width() <= breakpoint) {
        elementOffsetTop = $productQuantity.offset().top;
        elementHeight = $productQuantity.outerHeight();
      }
      handleScroll(); // Ejecutar para ajustar en tiempo real
    });

    // Ejecutar al cargar la página
    handleScroll();
  }

  $('.product-description [style*="color: #000000"]').each(function () {
    // Obtén el valor actual del atributo 'style'
    var style = $(this).attr("style");

    // Elimina "color: #000000" del atributo 'style'
    var newStyle = style.replace(/color: #000000;?/g, "").trim();

    // Actualiza el atributo 'style' con el nuevo valor
    if (newStyle) {
      $(this).attr("style", newStyle);
    } else {
      $(this).removeAttr("style"); // Elimina el atributo 'style' si está vacío
    }
  });
});
$("#account-button").on("click", function () {
  $("#authentication-modal").toggleClass("shown");
});
$("#contact-button").on("click", function () {
  $("#contact-modal").toggleClass("shown");
});
$("#visibility-toggle").on("click", function () {
  $(this).toggleClass("visual_on");
  var passwordInput = $(this).siblings("input");
  console.log("input = " + passwordInput);
  if (passwordInput.attr("type") === "password") {
    console.log("Es Password");
    passwordInput.attr("type", "text");
  } else {
    console.log("No es Password");
    passwordInput.attr("type", "password");
  }
});
$(".close-auth-button").on("click", function () {
  $("#authentication-modal").toggleClass("shown");
});
$(".close-contact-button").on("click", function () {
  $("#contact-modal").toggleClass("shown");
});
$("#auth-register-tab").on("click", function () {
  $(this).addClass("tab-active");
  $("#auth-login-tab").removeClass("tab-active");
  var anchoTab = $("#auth-login").outerWidth();
  $(".auth-content").animate({ scrollLeft: anchoTab }, 200);
});
$("#auth-login-tab").on("click", function () {
  $(this).addClass("tab-active");
  $("#auth-register-tab").removeClass("tab-active");
  $(".auth-content").animate({ scrollLeft: 0 }, 200);
});

function isTouchDevice() {
  return (
    "ontouchstart" in window ||
    navigator.maxTouchPoints > 0 ||
    navigator.msMaxTouchPoints > 0
  );
}

$(".product-in-list--image-container").on("hover mouseover", function () {
  if (!isTouchDevice()) {
    var src = $(this).find("a > .imagen-cover").attr("data-src");
    //console.log(src);
    $(this).find("a > .imagen-hover").prop("src", src);
  }
});

$(".searchlook").on("click", function () {
  $(".searchbarwrap").slideToggle();
});

$("#top-menu[data-depth=0] > li > .dropdown-item").on("click", function () {
  if ($(window).width() < 768) {
    //console.log($(this));
    //console.log($(this).parent());
    //console.log($(this).parent().siblings('.conSub'));
    $(this)
      .parent()
      .find(".popover:first")
      .slideToggle()
      .toggleClass("esvisible");
    $(this)
      .parent()
      .siblings(".conSub")
      .children(".popover")
      .hide("fast")
      .removeClass("esvisible");
  }
  event.preventDefault();
});
$("#info-category").on("click", function () {
  $(this).toggleClass("hide-symbol");
  $(".cat-banners").toggleClass("block-hidden");
});
$("#whatsButton").click(function () {
  $(this).next(".floating-wpp-popup").toggleClass("whatactive", 300);
});
$("#closewh").click(function () {
  $(".floating-wpp-popup").toggleClass("whatactive", 300);
});
$("#sendwhats").click(function () {
  $("#whatsend").submit();
});

// Convertimos cualquier cadena introducida en el campo DNI a mayúsculas

$("input[name=dni]").keyup(function () {
  this.value = this.value.toLocaleUpperCase();
});

$(document).on("scroll", function () {
  if ($(window).width() > 989) {
    var megamenu = $(".megamenu");
    if ($(window).scrollTop() < 36) {
      megamenu.each(function () {
        $(this).css("top", "111px");
      });
    } else {
      megamenu.each(function () {
        $(this).css("top", "76px");
      });
    }
  }
});

function toggleMenu() {
  $("#main-menu-wrapper").toggleClass("active");
  $(".main-hamburger").toggleClass("burger");
  $(document)
    .find(".megamenu:not(.closed)")
    .each(function () {
      $(this).addClass("closed");
    });
}

$(document).ready(function () {
  if ($(window).width() <= 989) {
    $("#menu-principal li").each(function () {
      var submenu = $(this).children("a").attr("href");
      if (submenu.startsWith("#")) {
        var lista = $(submenu).find(".row > div:nth-of-type(1) > ul");
        //$(this).append(lista);
      }
    });
    $("#menu-principal li").on("click", function () {
      var submenu = $(this).children("a").attr("href");
      if (submenu.startsWith("#")) {
        $(submenu).toggleClass("closed");
        //$('body').css('overflow', 'hidden');
      }
      /*if($(this).children('ul').css('display') == 'none') {
				$(this).children('ul').show('slow');
			}else{
				$(this).children('ul').hide('slow');
			}

			$(this).siblings('li').children('ul').hide('slow');*/
    });
  }

  $("#menu-principal li").on("click", function (event) {
    if ($(window).width() > 989) {
      //console.log("sip");
      var enlace = $(this).children("a").attr("href");

      if (enlace.startsWith("#")) {
        event.preventDefault();
      } else {
        return;
      }
      var scroll = $(window).scrollTop();
      var header = $("header");
      var elementTop = 0;
      var elementHeight = header.outerHeight();
      if (scroll < 36) {
        var elementBottomY = elementHeight + 36;
      } else {
        var elementBottomY = elementHeight + 1;
      }
      //console.log(header+' - '+elementTop+ ' - '+elementHeight+' - '+elementBottomY);
      $(enlace).toggleClass("closed");
      $(enlace).css("top", elementBottomY);
      $(this).toggleClass("activo");
      var menu_hermanos = $(this).siblings("li");
      menu_hermanos.each(function () {
        if ($(this).hasClass("activo")) {
          $(this).removeClass("activo");
        }
      });
      var siblings = $(enlace).siblings(".megamenu");
      siblings.each(function () {
        if ($(this).hasClass("closed")) {
        } else {
          $(this).addClass("closed");
        }
      });
      //openChildren();
    } else {
    }
  });

  function handleMenuClicks() {
    const isMobile = $(window).width() < 989;

    // Primero eliminamos cualquier evento anterior para evitar duplicaciones
    $(".megamenu > .row > .submenu-principal > ul > li").off(
      "click.menuToggle"
    );

    $(".megamenu > .row > .submenu-principal > ul > li").on(
      "click.menuToggle",
      function (e) {
        if ($(e.target).closest("a").length > 0) {
          return; // Permite que el enlace navegue normalmente
        }
        var $clickedLi = $(this);
        var id = $clickedLi.attr("id");
        var $submenu = $("ul." + id);

        // Solo aplicamos la lógica especial si estamos en mobile
        if (isMobile) {
          if ($submenu.length > 0) {
            e.preventDefault();
            // Prevenimos navegación si hay submenu
            if ($submenu.is(":visible")) {
              //$submenu.removeClass('fromleft');
              $clickedLi.removeClass("activo");
              $submenu.hide("fast");
            } else {
              // Cerramos todos y abrimos el actual
              //$('.megamenu > .row > .submenu-principal > ul > li ul').removeClass('fromleft');
              $(".megamenu > .row > .submenu-principal > ul > li ul").hide(
                "fast"
              );

              $(".megamenu > .row > .submenu-principal > ul > li").removeClass(
                "activo"
              );
              //$submenu.addClass('fromleft');
              $submenu.slideToggle("fast");
              $clickedLi.addClass("activo");
            }
          }
        } else {
          var identificador = $(this).attr("id");
          var submenu = "ul." + identificador;
          //console.log('submenu = '+submenu);
          if ($(submenu).length > 0) {
            $(this).addClass("activo");
            $(this).siblings("li").removeClass("activo");
            if ($(submenu).hasClass("fromleft")) {
              //$(submenu).removeClass('fromleft');
            } else {
              $(submenu).addClass("fromleft");
              $(submenu).siblings("ul").removeClass("fromleft");
            }
          }
        }
      }
    );
  }

  // Inicialización
  handleMenuClicks();

  // Reaplica al redimensionar (opcional pero recomendable en responsive)
  $(window).on("resize", function () {
    handleMenuClicks();
  });

  $(".close-megamenu").on("click", function (event) {
    $(this).parents(".megamenu").toggleClass("closed");
    $("#menu-principal").children("li.activo").removeClass("activo");
  });
});
// Antes: Manejo para radio buttons
$('input[name="id_address_delivery"]').on("change", function () {
  // Lógica para manejar el cambio de dirección
});

// Después: Manejo para select
$("#id_address_delivery").on("change", function () {
  // Lógica para manejar el cambio de dirección
  const selectedAddress = $(this).val();
  // Enviar la dirección seleccionada al backend o actualizar la vista
});

function QtyInput(container = document) {
  var $qtyInputs = $(container).find(".qty");

  if (!$qtyInputs.length) {
    return;
  }

  $qtyInputs.each(function () {
    var $qty = $(this);
    var $input = $qty.find(".product-qty");
    var $countBtn = $qty.find(".qty-count");
    var qtyMin = parseInt($input.attr("min")) || 1;
    var qtyMax = parseInt($input.attr("max")) || 9999;

    $input.off("change.qty").on("change.qty", function () {
      var $this = $(this);
      var $minusBtn = $this.siblings(".qty-count--minus");
      var $addBtn = $this.siblings(".qty-count--add");
      var qty = parseInt($this.val());

      if (isNaN(qty) || qty <= qtyMin) {
        $this.val(qtyMin);
        $minusBtn.attr("disabled", true);
      } else {
        $minusBtn.attr("disabled", false);

        if (qty >= qtyMax) {
          $this.val(qtyMax);
          $addBtn.attr("disabled", true);
        } else {
          $this.val(qty);
          $addBtn.attr("disabled", false);
        }
      }
    });

    $countBtn.off("click.qty").on("click.qty", function () {
      var operator = this.dataset.action;
      var $this = $(this);
      var $input = $this.siblings(".product-qty");
      var qty = parseInt($input.val());

      if (operator == "add") {
        qty += 1;
        if (qty >= qtyMin + 1) {
          $this.siblings(".qty-count--minus").attr("disabled", false);
        }

        if (qty >= qtyMax) {
          $this.attr("disabled", true);
        }
      } else {
        qty = qty <= qtyMin ? qtyMin : (qty -= 1);

        if (qty == qtyMin) {
          $this.attr("disabled", true);
        }

        if (qty < qtyMax) {
          $this.siblings(".qty-count--add").attr("disabled", false);
        }
      }

      $input.val(qty).trigger("change");
    });
  });
}
$(document).on("shown.bs.modal", function (e) {
  var $modal = $(e.target);
  if ($modal.find(".qty").length) {
    QtyInput($modal);
  }
});
$(document).ready(function () {
  if (prestashop.page.page_name == "product") {
    QtyInput();
  }
});

$(document).on("click", ".icon-read-more", function () {
  $(this).toggleClass("abierto");
  $("#category-description").toggleClass("abierto");
});
let elements = $(".categories-wrap");
let currentIndex = elements.index($(".categories-wrap:visible")); // Encuentra el elemento visible inicialmente

let featured_visible = $(".product_row");
let currentIndexFeatured = featured_visible.index($(".product_row:visible"));

function showElement(index) {
  elements
    .removeClass("infront")
    .addClass("behind")
    .eq(index)
    .addClass("infront")
    .removeClass("behind");
}
function showFeatured(index) {
  featured_visible
    .removeClass("infront")
    .addClass("behind")
    .eq(index)
    .addClass("infront")
    .removeClass("behind");
}

$(".homecat .scroll-item[rel='next']").click(function () {
  currentIndex = (currentIndex + 1) % elements.length; // Avanza y reinicia al llegar al final
  showElement(currentIndex);
});

$(".homecat .scroll-item[rel='previous']").click(function () {
  currentIndex = (currentIndex - 1 + elements.length) % elements.length; // Retrocede y reinicia si es necesario
  showElement(currentIndex);
});
$(".skeleton-products .scroll-item[rel='next']").click(function () {
  currentIndexFeatured = (currentIndexFeatured + 1) % featured_visible.length; // Avanza y reinicia al llegar al final
  showFeatured(currentIndexFeatured);
});

$(".skeleton-products .scroll-item[rel='previous']").click(function () {
  currentIndexFeatured =
    (currentIndexFeatured - 1 + featured_visible.length) %
    featured_visible.length; // Retrocede y reinicia si es necesario
  showFeatured(currentIndexFeatured);
});

if (prestashop.page.page_name == "index") {
  $(".mlreviews-home ul li").on("click", function () {
    if ($(this).hasClass("open")) {
      $(this).removeClass("open");
    } else {
      $(this).addClass("open");
      $(this).siblings("li").removeClass("open");
    }
  });

	// ================================
	// 1. Intersection Observer (si lo usas para animar overlays)
	// ================================
	const observerOptions = {
		threshold: 0.1,
		rootMargin: '0px 0px -20% 0px'
	};

	const observer = new IntersectionObserver((entries) => {
		entries.forEach(entry => {
			if (entry.isIntersecting) {
				entry.target.classList.add('visible');
			} else {
				entry.target.classList.remove('visible');
			}
		});
	}, observerOptions);

	document.querySelectorAll('.content-overlay').forEach(overlay => {
		observer.observe(overlay);
	});


	// ================================
	// 2. Efecto Parallax fondo (background-position desde bottom)
	// ================================
	let ticking = false;

	function updateParallax() {
		const windowHeight = window.innerHeight;

		document.querySelectorAll('.parallax-section').forEach((section, index) => {
			const bg = section.querySelector('.parallax-bg');
			if (!bg) return;

			const rect = section.getBoundingClientRect();
			const inView = rect.bottom >= 0 && rect.top <= windowHeight;

			if (inView) {
				const speed = 0.2; // más bajo = más lento
				const top = Math.max(rect.top, 0);
				const distanceScrolled = windowHeight - top;

				// Corrección para el primer bloque
				const correction = index === 0 ? 60 : 0;

				const y = (distanceScrolled * speed) - correction;

				bg.style.backgroundPosition = `center calc(100% - ${y}px)`;
			}
		});

		ticking = false;
	}

	function requestTick() {
		if (!ticking) {
			requestAnimationFrame(updateParallax);
			ticking = true;
		}
	}

	function initParallax() {
		updateParallax();
	}

	// ================================
	// 3. Event listeners
	// ================================
	window.addEventListener('scroll', requestTick);
	window.addEventListener('load', initParallax);
	window.addEventListener('resize', initParallax);


	// ================================
	// 4. Ocultar scroll-indicator al hacer scroll
	// ================================
	let hasScrolled = false;
	window.addEventListener('scroll', () => {
		if (!hasScrolled) {
			const indicator = document.querySelector('.scroll-indicator');
			if (indicator) {
				indicator.style.opacity = '0';
			}
			hasScrolled = true;
		}
	});


	// ================================
	// 5. Botones CTA con scroll suave
	// ================================
	document.querySelectorAll('.cta-button').forEach(button => {
		button.addEventListener('click', (e) => {
			e.preventDefault();
			console.log('Navegando a productos...');
			// Aquí puedes añadir scroll suave si quieres navegar a secciones
		});
	});


	// ================================
	// 6. Efecto hover en .room-card
	// ================================
	document.querySelectorAll('.room-card').forEach(card => {
		card.addEventListener('mouseenter', () => {
			card.style.zIndex = '10';
		});
		
		card.addEventListener('mouseleave', () => {
			card.style.zIndex = '1';
		});
	});


}

$('#show-login-form').on('click', function() {
	$('#unified-login-form').show();
	$(this).hide();
});
