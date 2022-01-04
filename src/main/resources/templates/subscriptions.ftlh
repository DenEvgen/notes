<#import "parts/common.ftlh" as common>
<@common.page>
<h3>${userChannel.username}</h3>
    <div>
        ${type}
    </div>
    <ul class="list-group">
        <#list users as user>
            <li class="list-group-item">
                <a href="/home/user-notes/${user.id}">${user.getUsername()}</a>
            </li>
        </#list>
    </ul>
</@common.page>