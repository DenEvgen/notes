<#macro login path isRegisterForm>
    <form action="${path}" method="post" xmlns="http://www.w3.org/1999/html">
        <div class="form-group">
            <label class="col-sm-2 col-form-label"> User Name : </label>
            <div class="col-sm-5">
                <input type="text" name="username" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="login"/>
                <#if usernameError??>
                    <div class="invalid-feedback d-block">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-form-label"> Password:</label>
            <div class="col-sm-5">
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="password"/>
                <#if passwordError??>
                    <div class="invalid-feedback d-block">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group">
                <label class="col-sm-2 col-form-label"> Password:</label>
                <div class="col-sm-5">
                    <input type="password" name="validationPassword"
                           class="form-control ${(validationPasswordError??)?string('is-invalid', '')}"
                           placeholder="Retype password"/>
                    <#if validationPasswordError??>
                        <div class="invalid-feedback d-block">
                            ${validationPasswordError}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-form-label"> Email:</label>
                <div class="col-sm-5">
                    <input type="email" name="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                           placeholder="some@email.com"/>
                    <#if emailError??>
                        <div class="invalid-feedback d-block">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="col-sm-5">
                <div class="g-recaptcha" data-sitekey="6Lf1KNEdAAAAAAVxOvyu5-jjH6hKflXasfMAjAmt"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>
        <br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <#if !isRegisterForm>
            <a href="/registration">Add new user</a>
        </#if>
        <button type="submit" class="btn btn-primary">
            <#if isRegisterForm>Create<#else> Sign In</#if>
        </button>
    </form>
</#macro>

<#macro logout >
    <form action="/logout" method="post">
        <button type="submit" class="btn btn-primary"><#if user??>Sign Out<#else>Log in</#if></button>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
    </form>
</#macro>