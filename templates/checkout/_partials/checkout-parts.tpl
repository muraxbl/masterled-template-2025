            <div class="cart-grid-body col-xs-12 col-lg-8">
              {block name='cart_summary'}
                {render file='checkout/checkout-process.tpl' ui=$checkout_process}
              {/block}
              {if Context::getContext()->isMobile() or Context::getContext()->isTablet()}
                {hook h='displayReassurance'}
              {/if}
            </div>

            <div class="cart-grid-right col-xs-12 col-lg-4">
              {block name='cart_summary'}
                {include file='checkout/_partials/cart-summary.tpl' cart = $cart}
              {/block}
              {if !Context::getContext()->isMobile() && !Context::getContext()->isTablet()}
              {hook h='displayReassurance'}              
              {/if}
            </div>