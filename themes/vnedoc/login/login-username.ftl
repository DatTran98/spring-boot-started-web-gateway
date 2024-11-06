<#import "custom-template.ftl" as layout>
  <@layout.registrationLayout displayMessage=!messagesPerField.existsError('username') displayInfo=(realm.password && realm.registrationAllowed && !registrationDisabled??); section>
    <#if section="header">
      <#elseif section="form">
        <div class="main login">
          <div class="main-wrap">
            <div id="kc-form" class="main-inner login-main">
              <div class="login-background"></div>
              <div id="kc-form-wrapper" class="login-main-inner">
                <div class="container">
                  <div class="row">
                    <div class="col-lg-5 offset-lg-1 order-lg-2">
                      <div class="col-login-form">
                        <div class="logo mb32 text-center">
                          <img src="/resources/pyq56/login/vnedoc/img/logo-style-2-light.svg" alt="">
                        </div>
                        <div class="box no-p">
                          <div class="tab-content">
                            <div class="tab-pane fade show active" role="tabpanel">
                              <div class="box__body">
                                <form id="kc-form-login" class="from-section form-vertical" onsubmit="login.disabled = true; return true;" action="${url.loginAction}"
                                  method="post">
                                  <div class="row row-16 list-mb32 list-crop">
                                    <#if !usernameHidden??>
                                      <div class="col-12">
                                        <!-- form.input -->
                                        <div class="form-group">
                                          <div class="input-group-wrap input-line input-size-sms input-group-vertical">
                                            <div class="input-inner-wrap">
                                              <input tabindex="1" id="login-username-input"
                                                aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                                class="${properties.kcInputClass!} input input-label-change input-has-clear weight6" name="username"
                                                value="${(login.username!'')}" placeholder="${msg('usernamePlaceholder')}"
                                                placeholder="${msg('usernamePlaceholder')}"
                                                type="text" autofocus autocomplete="off" />
                                              <div class="input-extend input-extend-right">
                                                <div class="input-box input-ic-clear"></div>
                                              </div>
                                              <div class="input-frame"></div>
                                              <div class="input-extend input-extend-inside-out input-extend-inside-out input-extend-left">
                                                <div class="input-box input-ic">
                                                  <div class="icm ubg-default icm-default_24x24-user icm-size-default">
                                                  </div>
                                                </div>
                                              </div>
                                              <#if messagesPerField.existsError('username')>
                                                <div class="errorBlock">
                                                  <span id="input-error-username" class="${properties.kcInputErrorMessageClass!} " aria-live="polite">
                                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                                  </span>
                                                </div>
                                              </#if>
                                            </div>
                                          </div>
                                        </div>
                                        <!-- end form.input -->
                                      </div>
                                    </#if>
                                    <div class="col-12">
                                      <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                                        <button disabled id="login-username-button" type="submit" tabindex="4" class="ubg-brand-gradient ubox-size-button-lg ubox-rounded ubg-hover ubg-active ubtn">
                                          <div class="ubtn-inner">
                                            <span class="ubtn-text">
                                              ${msg('doContinue')}
                                            </span>
                                          </div>
                                        </button>
                                      </div>
                                    </div>
                                    </a>
                                    <!-- end button.button -->
                                  </div>
                                  <#if realm.resetPasswordAllowed>
                                    <div class="col-12 text-center">
                                      <span>
                                        <a tabindex="6" href="${url.loginResetCredentialsUrl}" class="link link-style-default-underline">
                                          ${msg("doForgotPassword")}
                                        </a>
                                      </span>
                                    </div>
                                  </#if>
                                  <#elseif section="socialProviders">
                                    <#if realm.password && social.providers??>
                                      <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!} col-12 text-center">
                                        <h2 class="divider">
                                          <span class="divider-text">
                                            ${msg("identity-provider-login-label")}
                                          </span>
                                        </h2>
                                        <ul class="${properties.kcFormSocialAccountListClass!}">
                                          <#list social.providers as p>
                                            <li class="box-body">
                                              <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!}"
                                                type="button" href="${p.loginUrl}">
                                                <#if p.iconClasses?has_content>
                                                  <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                                  <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">
                                                    ${p.displayName!}
                                                  </span>
                                                  <#else>
                                                    <span class="${properties.kcFormSocialAccountNameClass!}">
                                                      ${p.displayName!}
                                                    </span>
                                                </#if>
                                              </a>
                                            </li>
                                          </#list>
                                        </ul>
                                      </div>
                                    </#if>
                              </div>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 order-lg-1 d-none d-lg-block">
                      <div class="col-login-banner color-invert">
                        <div class="d-block text-center">
                          <div class="mb48">
                            <img src="/resources/pyq56/login/vnedoc/img/login-1.webp" alt="">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
        <#elseif section="info">
          <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration">
              <span>
                ${msg("noAccount")}
                <a tabindex="6" href="${url.registrationUrl}">
                  ${msg("doRegister")}
                </a></span>
            </div>
          </#if>
    </#if>
    <script src="${url.resourcesPath}/js/disableInput.js" type="text/javascript"></script>
  </@layout.registrationLayout>