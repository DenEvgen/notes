<#include "security.ftlh">

<div class="card-columns">
    <#list notes as note>
        <div class="card my-3">
            <div>
                <#if note.filename??>
                    <img src="/img/${note.filename}" class="card-img-top">
                </#if>
            </div>
            <div class="m-2">
                <span>${note.text }</span><br/>
                <i>#${note.tag}</i>
            </div>
            <div class="card-footer text-muted">
                <a href="/home/user-notes/${note.author.id}">${note.authorName}</a>
                <#if note.author.id == currentUserId>
                    <a class="btn btn-primary" href="/home/user-notes/${note.author.id}?note=${note.id}">Edit</a>
                </#if>
            </div>
        </div>
    <#else>
        No notes, sorry...
    </#list>
</div>