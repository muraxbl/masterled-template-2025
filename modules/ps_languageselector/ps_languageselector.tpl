<style>
  .language-list-selector > li {
    display: flex;
    justify-content: center;
    align-content: center;
    padding:6px 10px;
  }
  .language-list-selector > li:hover {
    background-color:lightblue;
  }
  #currentlangbox + ul.language-list-selector {
    display: none;
    margin:0;
    padding:  0;
    background-color:   white;
  }
  #currentlangbox {
    display:none;
  }
  #currentlangbox:checked + ul.language-list-selector{
    display: block;
    position: absolute;
    top:100%;
    left:50%;
    transform: translate(-50%, 0);
    z-index: 100;
    box-shadow: 0px 3px 6px -2px #000000 !important;
  }
  .language-selector-wrapper {
    display:  flex;
    flex-direction:   column  ;
    justify-content:  flex-start  ; 
    align-content:  center  ;
    align-items:  center  ;
    position: relative;
  }
  #currentlangimg {
    /*padding:6px 10px;*/
  }
  label.nomargin {
    margin: 0 !important;
    padding:  0 !important  ;
  }
</style>
<div class="language-selector-wrapper">
<label class="nomargin" for="currentlangbox"><img border="0" id="currentlangimg" src="/themes/masterled/modules/ps_languageselector/{$language.iso_code|upper}.png"></label><input type="checkbox" id="currentlangbox" name="currentlangbox" title="{$current_language.name_simple}" alt="{$current_language.name_simple}">
  <ul class="language-list-selector">
    {foreach from=$languages item=language}
     {if $language.id_lang == $current_language.id_lang}{continue}{/if}
          <li><a title="{$language.name_simple}" href="{$link->getLanguageLink($language.id_lang)}"><img alt="{$language.name_simple}" border="0" src="/themes/masterled/modules/ps_languageselector/{$language.iso_code|upper}.png">
          </a>
        </li>
    {/foreach}
  </ul>
</div>