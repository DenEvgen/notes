<#include "security.ftlh">
<#import "login.ftlh" as login>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Notes</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/home">Home</a>
            </li>
            <#if user??>
            <li class="nav-item">
                <a class="nav-link" href="/home/notes">Notes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/home/user-notes/${currentUserId}">My notes</a>
            </li>
            </#if>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">User list</a>
                </li>
            </#if>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile">My profile</a>
                </li>
            </#if>
        </ul>
        <div class="navbar-text mr-3">
            <#if user??>
                ${name}
            <#else>
                Guest
            </#if>
        </div>
        <@login.logout/>
    </div>
</nav>