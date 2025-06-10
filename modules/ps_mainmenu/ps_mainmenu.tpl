{assign var=showsub value=false} {* ASIGNA VARIABLE showsub

Cambia a FALSE para no mostrar nada más allá del nivel de profundidad 1 (depth 2 e inferiores no se renderizan)

TOP ✔
  - SUB ✔
    - SUB X
      - SUB X

Cambia a TRUE para que se muestren todas las subcategorías

TOP ✔
  -SUB ✔
    - SUB ✔
      - SUB ✔

*}
{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
    {if $nodes|count}
      <ul class="top-menu 280120" {if $depth == 0}id="top-menu"{/if} data-depth="{$depth}">
        {foreach from=$nodes item=node}
            <li class="{$node.type}{if $node.current} current {/if}{if $depth == 0}{if $node.children} conSub{/if}{elseif $depth == 1}{if $node.children} haschildren{/if}{/if}" id="{$node.page_identifier}">
            {assign var=_counter value=$_counter+1}
              <a
                class="{if $depth >= 0}dropdown-item{/if}{if $depth === 1} dropdown-submenu{/if}"
                href="{$node.url}" data-depth="{$depth}"
                {if $node.open_in_new_window} target="_blank" {/if}
              > {*LC: 11/12/19*}{if $depth >= 1}{* EN CATEGORIAS D NIVEL NO SUPERIOR, MOSTRAR MINIATURA DE CATEGORÍA AL LADO DEL NOMBRE SI EXISTE *}
                  {assign var=mainmenuCatId value="-"|explode:$node.page_identifier}{assign var=imagenname value="`$mainmenuCatId[1]`.jpg"}{assign var=imagencat value="{$smarty.const._PS_CAT_IMG_DIR_}{$imagenname}"}
                  {if $imagencat|file_exists}<img border="0" class="mainmenu-cat-img" src="{$urls.img_cat_url}{$mainmenuCatId[1]}.jpg" alt="Categoría de productos: {$node.label}">{/if}
                 
              
                {/if}{*LC: 11/12/19*}
                {if $node.children|count}
                  {* Cannot use page identifier as we can have the same page several times *}
                  {assign var=_expand_id value=10|mt_rand:100000}
                  {if $depth < 1}
                    <span class="float-xs-end d-md-none">
                    <span data-target="#top_sub_menu_{$_expand_id}" data-toggle="collapse" class="navbar-toggler collapse-icons">
                      <i class="material-icons add">&#xE313;</i>
                      <i class="material-icons remove">&#xE316;</i>
                    </span>
                  </span>
                  {/if}
                {/if}
                {$node.label|lower|capitalize}
                </a>
                  {if $node.children|count}
                  {if $depth === 0}
                <div class="mobile-subm"><input type="checkbox" name="menu-group-2" id="open{$node.page_identifier}"><label for="open{$node.page_identifier}"><i class="material-icons">keyboard_arrow_down</i></label></div>{/if}
                {/if}
                {*LC: 10/01/20*}{if $showsub} {if $depth === 1 && $node.children}<input type="radio" name="menu-group-1"id="check{$node.page_identifier}"><label for="check{$node.page_identifier}"><i class="material-icons">add</i><i class="material-icons">clear</i></label>{/if}{/if}{*LC: 10/01/20*}
                {*LC: 10/01/20*}{if !$showsub && $depth > 0}{else}{*LC: 10/01/20*}
              {if $node.children|count}
              <div {if $depth === 0} class="popover sub-menu js-sub-menu collapse"{else} class="collapse"{/if} id="top_sub_menu_{$_expand_id}">
                {menu nodes=$node.children depth=$node.depth parent=$node}
              </div>
              {/if}
              {/if}
            </li>
        {/foreach}
      </ul>
    {/if}
{/function}

<div class="menu js-top-menu position-static d-none d-sm-none d-md-block" id="_desktop_top_menu">
    {menu nodes=$menu.children}
    <div class="clearfix"></div>
</div>
