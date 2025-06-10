<div class="container-fluid" id="displaysearchbartop">
            <div class="container{if $page.page_name == 'index'}-fluid max1660{elseif $page.page_name == 'cms' && $cms.id == 7}-fluid max1660{else}-fluid max1660{/if}">
              <div class="row">
                <div class="col-xs-1 col-sm-1 col-md-2 col-lg-2 vert-menu" style="position:relative;"><div id="catopener">
                  <i class="material-icons" style="margin-right:4px;">menu_open</i><span style="display:inline-block;margin-top: 2px;">{l s='CATEGORÍAS' d='Shop.Theme.Global'}</span></div>
                  <div class="category_tree">{widget name='ps_categorytree'}{hook h='displayCategoryTree'}
                  </div>
                </div>
                <div class="col-xs-6 col-sm-7 col-md-7 col-lg-7 menu-bar-wrap">
                  {widget name="ps_mainmenu"}
                </div>
                <div class="col-xs-11 col-sm-11 col-md-3 col-lg-3 search-bar-wrap" style="{if $page.page_name == 'index'}padding-right:0;{elseif $page.page_name == 'cms' && $cms.id == 7}
                 padding-right:0;{/if}">
                   {* <input type="checkbox" id="checksearch"></input><label for="checksearch"><div class="searchlook">
                      <div>
                          <span class="material-icons">search</span>
                      </div>
                    </div></label>*}
                    <div class="searchbarwrap">
                      {widget name="ps_searchbar"}
                    </div>
                </div>
              </div>
            </div>
          </div>