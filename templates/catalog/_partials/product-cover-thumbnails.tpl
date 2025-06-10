<style>
.swipe-left-anim {
  display:none !important;
}
@media(max-width:3480px) {
  .product-cover {
    display:flex;
    padding-left: 0;
    padding-right: 0;
    margin-left: -15px;
    margin-right: -15px;
    overflow: auto !important ;
    scroll-snap-type: x mandatory;
    scroll-snap-align: start;
    scroll-snap-stop: always;
    scroll-behavior: smooth;
    -ms-overflow-style: none;  /* IE and Edge */
    scrollbar-width: none;  /* Firefox */

  }
  .product-cover::-webkit-scrollbar { 
    display:none;
  }
  .product-cover > div {
    flex: 0 0 100% !important;
    scroll-snap-align: start;
    box-shadow: none !important;
    position: relative;
    scroll-behavior: smooth;
  }
  .product-cover > div > img {
    box-shadow: none !important;
  }
  .product-cover > div > a {
    position: absolute;
    visibility: hidden;
    opacity: 0;
    top: 0;
    margin-top: -90px;
    left:50%;
  }
  .product-cover > div {
    & a:nth-of-type(1) {
    }
    & a:nth-of-type(2) {
    }
    & a:nth-of-type(3) {
    }
    & a:nth-of-type(4) {
    }
    & a:nth-of-type(5) {
    }
    & a:nth-of-type(6) {
    }
    & a:nth-of-type(7) {
      
    }
    & a:nth-of-type(8) {
      
    }
    & a:nth-of-type(9) {
      
    }
    & a:nth-of-type(10) {
      
    }
  }
  ul.product-images.js-qv-product-images {
    margin-top:4px !important;
  }

  li.thumb-container {
    margin: 0 0.5rem;
  }
  li.thumb-container > a > img {
    border: 1px solid rgba(0,0,0,0.1);
    border-radius: 2px;
  }

}
@media(max-width:575px) {
  ul.product-images.js-qv-product-images {
    overflow: auto;
    -ms-overflow-style: -ms-autohiding-scrollbar;  /* IE and Edge */
    scrollbar-width: none;  /* Firefox */
  }
  ul.product-images.js-qv-product-images::-webkit-scrollbar {
    display:none;
  }
  li.thumb-container {
    flex: 0 0 50px !important;
  }
}
@media (max-width: 479px) {
      #wrapper {
          padding-top: 0;
      }
      .product-cover {
        max-width: 97vw;
        max-width: 97svw;
      }
      .product-cover > div > img {
        max-width: 99vw;
        max-width: 99svw;
      } 
      .swipe-left-anim {
        display:block !important;
        position:absolute;
        right:0;
        margin-right:0.5rem;
        top:50%;
        transform:translateY(-50%);
        z-index:99;
        animation: swipe-left-outro 4s forwards;

      }
      @keyframes swipe-left-outro {
        0% { 
            opacity:1;
           }
        80% {
            opacity:1;
        }
        90% 
        {
          opacity:0;
        }
        100% 
        {
          opacity: 0;
          display: none;
        }

      }
  }
</style>
<div class="images-container">
  {block name='product_cover'}
    <div class="product-cover" style="position:relative;">
    <img border="0" src="{$urls.img_url}swipe-left.gif" class="swipe-left-anim" width="80" style="display: none! important";>
     {block name='garantias'}
     {if Context::getContext()->isMobile() != 1}
        {foreach from=$product.grouped_features item=feature}
          {if $feature.id_feature == '45'}{assign var=anyos value=" "|explode:$feature.value}
          <div class="garantias_img d-md-none"><span class="yrs">{$anyos.0}</span><span class="post_yrs">{l s='AÑOS GARANTIA' d='Shop.Theme.Productpage'}</span></div>
          {/if}
        {/foreach}
      {/if}
      {/block}
      {if $product.cover}
       {if Context::getContext()->isMobile() == 1}
          <div>
        {/if}
        <img class="js-qv-product-cover imagen-cover" 
          src="{$product.cover.bySize.medium_default.url}" 
          alt="{$product.cover.legend}" 
          title="{$product.cover.legend}" 
          style="width:100%;" 
          itemprop="image" 
          id="product-cover-image">
        {if Context::getContext()->isMobile() == 1}
          </div>
        {/if}
        
        {if Context::getContext()->isMobile() != 1}
          <div class="layer d-none d-sm-none d-md-block" data-toggle="modal" data-target="#product-modal">
            <i class="material-icons zoom-in">&#xE8FF;</i>
          </div>
        {/if}
      
      {else}
        <div><img src="{$urls.img_ps_url}noimage-large.jpg" style="width:100%;"></div>
      {/if}
      {if Context::getContext()->isMobile() == 1}
        {foreach from=$product.images item=image}
        {if isset($image['cover']) AND $image['cover'] == 1}{continue}{/if}
          {if $image.legend != 'medidas'}
          <div>
            
              <img class="js-qv-secondary-image" 
                src="{$image.bySize.medium_default.url}" 
                alt="{$image.legend}" 
                title="{$image.legend}" 
                style="width:100%;" 
                itemprop="image" 
                id="image-{$image.id_image}">
          </div>
          {/if}
        {/foreach}
      {/if}
    </div>
  {/block}

  {block name='product_images'}


    <div class="js-qv-mask mask">
      <ul class="product-images js-qv-product-images">
        {foreach from=$product.images item=image}
          {if Context::getContext()->isMobile() == 1}
            {if $image.legend != 'medidas'}
            <li class="thumb-container">
            <a href="{if $image['cover'] == 1}#product-cover-image{else}#image-{$image.id_image}{/if}"><img
                class="thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
                src="{$image.bySize.cart_default.url}"
                alt="{$image.legend}"
                title="{$image.legend}"
                width="70"
                itemprop="image"
              ></a>
            </li>
            {/if}
          {else}
            <li class="thumb-container">
              <img
                class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
                data-image-medium-src="{$image.bySize.medium_default.url}"
                data-image-large-src="{$image.bySize.large_default.url}"
                src="{$image.bySize.cart_default.url}"
                alt="{$image.legend}"
                title="{$image.legend}"
                width="100"
                itemprop="image"
              >
            </li>
          {/if}
        {/foreach}
      </ul>
    </div>
  {/block}
</div>
{hook h='displayAfterProductThumbs'}
