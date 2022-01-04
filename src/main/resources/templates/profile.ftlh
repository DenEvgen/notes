<#import "parts/common.ftlh" as common>
<@common.page>
    ${message!}
    <h4>${username}</h4>
    <form method="post">
        <div class="form-group">
            <label class="col-sm-2 col-form-label"> Password:</label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control" placeholder="password"/>
            </div>
        </div>
            <div class="form-group">
                <label class="col-sm-2 col-form-label"> Password:</label>
                <div class="col-sm-5">
                    <input type="email" name="email" class="form-control" placeholder="some@email.com" value="${email!''}"/>
                </div>
            </div>
        <br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">
            Save
        </button>
    </form>
</@common.page>
