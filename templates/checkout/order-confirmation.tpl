{extends file='page.tpl'}

{block name='page_content_container' prepend}
    <section id="content-hook_order_confirmation" class="card">
      <div class="card-block">
        <div class="row">
          <div class="col-md-12">

            {block name='order_confirmation_header'}
              <h3 class="h1 card-title">
                <i class="material-icons rtl-no-flip done">&#xE876;</i>{l s='Your order is confirmed' d='Shop.Theme.Checkout'}
              </h3>
            {/block}

            <p>
              {l s='An email has been sent to your mail address %email%.' d='Shop.Theme.Checkout' sprintf=['%email%' => $customer.email]}
              {if $order.details.invoice_url}
                {* [1][/1] is for a HTML tag. *}
                {l
                  s='You can also [1]download your invoice[/1]'
                  d='Shop.Theme.Checkout'
                  sprintf=[
                    '[1]' => "<a href='{$order.details.invoice_url}'>",
                    '[/1]' => "</a>"
                  ]
                }
              {/if}
            </p>
            {block name='hook_order_confirmation'}
              {$HOOK_ORDER_CONFIRMATION nofilter}
            {/block}

          </div>
        </div>
      </div>
    </section>
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content page-order-confirmation card">
    <div class="card-block">
      <div class="row">
   <script>
{assign var="shipping_cost" value=0}
{foreach from=$order.details.shipping item=shipping}
{$shipping_cost = $shipping_cost + $shipping.shipping_cost_tax_incl}
{/foreach}
window.dataLayer = window.dataLayer || [];
dataLayer.push({
  event: "purchase",
  ecommerce: {
    transaction_id: "{$order.details.reference}", // ID del pedido
    value: {if $order.totals.total_including_tax.amount}{$order.totals.total_including_tax.amount}{else}{$order.totals.total.amount}{/if}, // Total con impuestos
    currency: "{$currency.iso_code}", // Moneda
    tax: {math equation="x - y" x=$order.totals.total_including_tax.amount y=$order.totals.total_excluding_tax.amount }, // Total de impuestos
    shipping: {$shipping_cost}, // Coste de envío
    items: [
      {foreach from=$order.products item=product}
      {
        item_name: "{$product.name}",
        item_id: "{$product.id_product}",
        price: {$product.total_price_tax_incl},
        quantity: {$product.cart_quantity}
      },
      {/foreach}
    ]
  }
});
</script>
        {block name='order_confirmation_table'}
          {include
            file='checkout/_partials/order-confirmation-table.tpl'
            products=$order.products
            subtotals=$order.subtotals
            totals=$order.totals
            labels=$order.labels
            add_product_link=false
          }
        {/block}
        {block name='order_details'}
          <div id="order-details" class="col-md-4">
            <h3 class="h3 card-title">{l s='Order details' d='Shop.Theme.Checkout'}:</h3>
            <ul>
              <li>{l s='Order reference: %reference%' d='Shop.Theme.Checkout' sprintf=['%reference%' => $order.details.reference]}</li>
              <li>{l s='Payment method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.details.payment]}</li>
              {if !$order.details.is_virtual}
                <li>
                  {l s='Shipping method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.carrier.name]}<br>
                  <em>{$order.carrier.delay}</em>
                </li>
              {/if}
                <li>
                  {l s='Cuando reciba su paquete recuerde firmar [1]"pendiente de revisar"[/1], el [1]plazo máximo para reclamar roturas debido al transporte es de 48h.[/1] ¡Gracias por comprar en Masterled!' d='Shop.Theme.Checkout' sprintf=[
                    '[1]' => "<em>",
                    '[/1]' => "</em>",
                    '[2]' => "<strong>",
                    '[/2]' => "</strong>"
                  ]}.

                </li>
            </ul>
          </div>
        {/block}

      </div>
    </div>
  </section>

  {block name='hook_payment_return'}
    {if ! empty($HOOK_PAYMENT_RETURN)}
    <section id="content-hook_payment_return" class="card definition-list">
      <div class="card-block">
        <div class="row">
          <div class="col-md-12">
            {$HOOK_PAYMENT_RETURN nofilter}
          </div>
        </div>
      </div>
    </section>
    {/if}
  {/block}

  {block name='customer_registration_form'}
    {if $customer.is_guest}
      <div id="registration-form" class="card">
        <div class="card-block">
          <h4 class="h4">{l s='Save time on your next order, sign up now' d='Shop.Theme.Checkout'}</h4>
          {render file='customer/_partials/customer-form.tpl' ui=$register_form}
        </div>
      </div>
    {/if}
  {/block}

  {block name='hook_order_confirmation_1'}
    {hook h='displayOrderConfirmation1'}
  {/block}

  {block name='hook_order_confirmation_2'}
    <section id="content-hook-order-confirmation-footer">
      {hook h='displayOrderConfirmation2'}
      
    
    </section>
  {/block}
{/block}
