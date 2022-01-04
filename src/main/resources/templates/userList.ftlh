<#import "parts/common.ftlh" as common>
<@common.page>
    List of users
    <table class="table">
        <thead>
        <th scope="col">Name</th>
        <th scope="col">Role</th>
        <tr></tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a href="/user/${user.id}">Edit user</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@common.page>