<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Note editor
</a>
<div class="collapse <#if note??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-inline ${(textError??)?string('is-invalid', '')}"
                        <#if note??> value="${note.text}"</#if> name="text" placeholder="Enter your note">
                <#if textError??>
                    <div class="invalid-feedback d-block">
                        ${textError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-inline"
                        <#if note??> value="${note.tag}"</#if>  name="tag" placeholder="Enter the tag">
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file" style="width: 30%">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="hidden" name="id" <#if note??> value="${note.id}"</#if> >
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Edit note</button>
            </div>
        </form>
    </div>
</div>