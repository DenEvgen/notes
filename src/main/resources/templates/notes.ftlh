<#import "parts/common.ftlh" as common>
<@common.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="notes" class="form-inline">
                <input type="text" name="filter" value="${filter!}" placeholder="Search by tag">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <#include "parts/noteEdit.ftlh" />

    <#include "parts/noteList.ftlh" />

</@common.page>