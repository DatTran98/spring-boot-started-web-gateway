<#macro content>
  <div class="login-footer">
    <footer class="main-footer">
      <div class="row row-16 justify-content-center list-mb12 list-crop align-items-center">
        <div class="col-auto">
          <div class="form-group">
            <div class="input-group-wrap input-no-border select-arrow-triangle input-size-xs input-group-vertical">
              <div class="input-inner-wrap">
                <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                  <div class="${properties.kcLocaleMainClass!}" id="kc-locale">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                      <div id="kc-locale-dropdown" class="menu-button-links ${properties.kcLocaleDropDownClass!}">
                        <select id="language-switch"
                          class="${properties.kcLocaleListClass!} input select-2 select-2-template input-label-change"
                          onchange="window.location.href = this.value"
                          data-placeholder="Chọn"
                          data-minimum-results-for-search="Infinity">
                          <#list locale.supported as l>
                            <option value="${l.url}"
                              <#if l.label==locale.current>selected
                </#if>
                data-img="media/img/lang/${l.label?lower_case}.svg"
                class="${properties.kcLocaleListItemClass!}">
                ${l.label}
                </option>
                </#list>
                </select>
              </div>
            </div>
          </div>
          </#if>
        </div>
      </div>
      <div class="errorBlock"></div>
  </div>
  </div>
  <div class="col-sm color-ink-light">
    <div class="row row-24 row-seperate-line justify-content-center justify-content-sm-end content-end list-mb8 list-crop">
      <div class="col-auto">
        <a href="${msg('userGuideLink')}" target="_blank" class="link link-style-ink-light weight4">
          ${msg('userGuide')}
        </a>
      </div>
      <div class="col-auto">
        <a href="${msg('faqLink')}" target="_blank" class="link link-style-ink-light weight4">
          ${msg('faq')}
        </a>
      </div>
      <div class="col-auto">
        © 2022 VNPAY. All rights reserved.
      </div>
    </div>
  </div>
  </div>
  </footer>
  </div>
  <script>
  // Add this JavaScript to handle the language change
  document.getElementById('language-switch').addEventListener('change', function() {
    window.location.href = this.value;
  });
  </script>
</#macro>