<#import "custom-template.ftl" as layout>
    <@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
        <#if section="header">
            <#-- Form đăng nhập -->
                <#elseif section="form">
                    <div class="main login">
                        <div class="main-wrap">
                            <div class="main-inner login-main">
                                <div class="login-background"></div>
                                <div class="login-main-inner">
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
                                                                    <form class="from-section form-vertical" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                                                        <div class="row row-16 list-mb32 list-crop">
                                                                            <#if !usernameHidden??>
                                                                                <div class="col-12">
                                                                                    <!-- form.input -->
                                                                                    <div class="form-group">
                                                                                        <div class="input-group-wrap input-line input-size-sms input-group-vertical">
                                                                                            <div class="input-inner-wrap">
                                                                                                <input tabindex="2" id="username" class="${properties.kcInputClass!} input input-label-change input-has-clear weight6" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                                                                                                    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" placeholder="${msg('usernamePlaceholder')}" />
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
                                                                                                <#if messagesPerField.existsError('username','password')>
                                                                                                    <div class="errorBlock">
                                                                                                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                                                                                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
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
                                                                                <!-- form.input -->
                                                                                <div class="form-group">
                                                                                    <div class="input-group-wrap input-line input-size-sms input-group-vertical">
                                                                                        <div class="input-inner-wrap">
                                                                                            <input tabindex="3" id="password" class="${properties.kcInputClass!} input input-label-change input-has-clear weight6" name="password" type="password" autocomplete="current-password"
                                                                                                aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" placeholder="${msg('passwordPlaceholder')}" />
                                                                                            <div class="input-extend input-extend-right">
                                                                                                <div class="input-box input-ic-clear"></div>
                                                                                                <div class="input-box input-extend-inner">
                                                                                                    <!-- button.btnEye -->
                                                                                                    <!-- button.button -->
                                                                                                    <button class="${properties.kcFormPasswordVisibilityButtonClass!} ubg-transparent ubox-size-button-sm ubox-square ubg-hover ubg-active ubtn input-eye" type="button" aria-label="${msg('showPassword')}"
                                                                                                        aria-controls="password" aria-icons="eye-slash" data-password-toggle tabindex="4"
                                                                                                        data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                                                                                                        data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                                                                                                        <input type="checkbox" class="hidden" tabindex="4" id="eye-slash">
                                                                                                        <span class="eye-slash"></span>
                                                                                                        <span class="icm icm-size-lg icm-default_24x24-eye ubg-ink-light icm-ignore-bacground"></span>
                                                                                                    </button>
                                                                                                    <!-- end button.button -->
                                                                                                    <!-- end button.btnEye -->
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="input-frame"></div>
                                                                                            <div class="input-extend input-extend-inside-out input-extend-inside-out input-extend-left">
                                                                                                <div class="input-box input-ic">
                                                                                                    <div class="icm ubg-default icm-default_24x24-key icm-size-default">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                                                                                                <div class="errorBlock">
                                                                                                    <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                                                                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                                                                                    </span>
                                                                                                </div>
                                                                                            </#if>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!-- end form.input -->
                                                                            </div>
                                                                            <#if realm.rememberMe && !usernameHidden??>
                                                                                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!} col-12">
                                                                                    <!-- rnc.checkbox -->
                                                                                    <label id="kc-form-options" class="rnc checkbox type-checkbox">
                                                                                        <input type="checkbox" autocomplete="off" class="hidden">
                                                                                        <div class="rnc-content">
                                                                                            <div class="rnc-ic-wrap pr12">
                                                                                                <span class="checkbox-ic checkbox-ic-default checkbox-size-default checkbox-style-default"></span>
                                                                                            </div>
                                                                                            <div class="rnc-inner">
                                                                                                <div class="rnc-text">
                                                                                                    Ghi nhớ đăng nhập
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </label>
                                                                                    <!-- end rnc.checkbox -->
                                                                                </div>
                                                                            </#if>
                                                                            <div class="col-12">
                                                                                <!-- button.button -->
                                                                                <#if auth.selectedCredential?has_content>
                                                                                    <input type="hidden" id="id-hidden-input" name="credentialId" value="${auth.selectedCredential}" />
                                                                                </#if>
                                                                                <button type="submit" tabindex="4" class="ubg-brand-gradient ubox-size-button-lg ubox-rounded ubg-hover ubg-active ubtn">
                                                                                    <div class="ubtn-inner">
                                                                                        <span class="ubtn-text">
                                                                                            ${msg('doLogIn')}
                                                                                        </span>
                                                                                    </div>
                                                                                </button>
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
                    <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
                    <#elseif section="info">
                        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                            <div id="kc-registration-container">
                                <div id="kc-registration">
                                    <span>
                                        ${msg("noAccount")}
                                        <a tabindex="8"
                                            href="${url.registrationUrl}">
                                            ${msg("doRegister")}
                                        </a></span>
                                </div>
                            </div>
                        </#if>
        </#if>
        <#-- footer -->
    </@layout.registrationLayout>