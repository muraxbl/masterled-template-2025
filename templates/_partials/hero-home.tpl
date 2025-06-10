<style>
    .hero-home-container {
        width:100%;
        display:flex;
        align-items:stretch;
        justify-content:center;
        align-content:stretch;
        flex-wrap:wrap;
        gap:0;
        padding-top: 0rem !important;

    }
    .hero-home-container div.hero-element.hero1 {
        background-image: url('{$urls.img_url}banners/hero/hero_piscina.webp?v=300525');
        position: relative;
        overflow: hidden;
    }
    .hero-home-container div.hero-element video {
      position: absolute;
      top: 50%;
      left: 50%;
      min-width: 100%;
      min-height: 100%;
      width: 100%;
      height: auto;
      z-index: -1;
      transform: translate(-50%, -50%);
      object-fit: cover;
      z-index: 0;
    }
    .hero-home-container div.hero-element .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.3);
        z-index: 1;
        transition: all 0.3s ease-in-out;
    }
    .hero-home-container div.hero-element:hover .overlay {
        background-color: rgba(0, 0, 0, 0.1);
    }
    .hero-home-container div.hero-element.hero2 {
        background-image: url('{$urls.img_url}banners/hero/solar.webp')
    }
    .hero-home-container .hero-element {
        flex: 1 1 50% ;
        background-size:cover;
        background-position:center center;
        background-repeat:no-repeat;
        height:404px;
        display:flex;
        justify-content:center;
        align-items:center;
        flex-direction: column;
        gap: 1rem;
        position: relative;
        overflow: hidden;

        & div.contenido {
            z-index:1;
            width:100%;
            height:100%;
            display:flex;
            flex-direction:column;
            align-content:center;
            justify-content:center;
        }
        & span.hero-title {
            color:rgba(255,255,255,0.9);
            font-size:1.4rem;
            color:white !important;
            text-align:center;
        }
        & a.hero-calltoaction {
            display:block;
            float:none;
            margin:0.5rem auto;
            border:2px solid rgba(255,255,255,0.8);
            border-radius:0.4rem;
            padding:0.9rem 1.4rem;
            color:white !important;
            transition:border .2s ease-out;
        }
        & a.hero-calltoaction:hover {
            border-color:#bad406;
        }
    }
    .hero-home-container .hero-heading {
        flex:1 0 100% !important;
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .hero-heading {
        &h3 {
            font-size: 2.5rem;
        }
    }
    @media(max-width:767px) {
        .hero-heading {
        &h3 {
            font-size: 1.7rem;
        }

    }
    @media(max-width:575px) {
        .hero-home-container {
            margin-top:1rem !important;
        }
        .hero-element {
            flex: 1 0 100% !important;
            height:220px !important;
        }
        .hero-heading h3 {
            margin-bottom:1rem;
        }
        .hero-element span.hero-title {
            font-size:1.1rem !important;
        }
        .hero-element a.hero-calltoaction {
            padding:0.4rem 0.8rem !important;
            color:white !important;
            font-size:1rem !important;
        }
}
    
</style>

<div class="hero-home-container">

    <div class="hero-element hero1">
        <div class="overlay"></div>
        <div class="contenido">
            <span class="hero-title">{l s='Luces de piscina y accesorios' d='Shop.Theme.HeroHome'}</span>
            <a class="hero-calltoaction" href="#">COMPRAR</a>
        </div>
    </div>
    <div class="hero-element hero2">
        <div class="overlay"></div>
        <div class="contenido">
            <span class="hero-title">{l s='Iluminación de jardín' d='Shop.Theme.HeroHome'}</span>
            <a class="hero-calltoaction" href="#">COMPRAR</a>
        </div>
    </div>
</div>