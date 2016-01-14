@ReactFileinputMixin = 
  fileinput: (prop_name, options = {})->
    inputOptions = 
      maxFilesNum: 1
      showPreview: false, showRemove: false
      showUpload: false, previewFileType: 'any', maxFileCount: 1, maxFileSize : 1500
      showClose : false, showCaption    : false, browseLabel : '', removeLabel: ''
      # removeIcon: '<i class="btn_link btn btn-link">Remove</i>'
      allowedFileTypes: ['image']
      layoutTemplates: 
        btnBrowse: '<span tabindex="500" class="{css}"{status}><button class="btn_grey btn btn-primary" type="button">Upload</button></span>'
        main2: '{preview}\n<div class="kv-upload-progress hide"></div>\n{browse}\n'
      overwriteInitial: false
      
    _.extend(inputOptions, options)
    
    $(@refs[prop_name]).fileinput(inputOptions)
      .on 'fileloaded', (event, file, previewId, index, reader)=>
        # reader = new FileReader()
        reader.onload = (e)=>
          newState = {}
          newState[prop_name] = file
          newState["#{prop_name}PreviewEncoded"] = e.target.result
          @setState newState

        reader.readAsDataURL(file)

  fileclear: (prop_name)->
    $(@refs[prop_name]).fileinput('clear')

    newState = {}
    newState[prop_name] = newState["#{prop_name}_url"] = newState["#{prop_name}PreviewEncoded"] = null
    newState["remove_#{prop_name}"] = true
    @setState newState
