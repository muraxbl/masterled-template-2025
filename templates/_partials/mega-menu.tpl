<style>
  header {
    overflow: hidden;
  }
</style>
{if Context::getContext()->isMobile() && !Context::getContext()->isTablet()}
  <!-- submenu 1 -->
{include file='_partials/menus/interior-mobile.tpl'}
<!-- / submenu -->

<!-- submenu 2-->
{include file='_partials/menus/exterior-mobile.tpl'}
<!-- / submenu -->
<!-- submenu 3-->
{include file='_partials/menus/decoracion-mobile.tpl'}
<!-- / submenu -->
<!-- submenu 4-->
{include file='_partials/menus/industrial-mobile.tpl'}
<!-- / submenu -->

{else}
<!-- submenu 1 -->
{include file='_partials/menus/interior.tpl'}
<!-- / submenu -->

<!-- submenu 2-->
{include file='_partials/menus/exterior.tpl'}
<!-- / submenu -->
<!-- submenu 3-->
{include file='_partials/menus/decoracion.tpl'}
<!-- / submenu -->
<!-- submenu 4-->
{include file='_partials/menus/industrial.tpl'}
<!-- / submenu -->
{/if}