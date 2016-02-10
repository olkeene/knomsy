@ReactTokenizeInputMixin = 
  tokenize_input: (prop_name)->
    $(@refs[prop_name]).tokenfield(
        {delimiter: [',']}
      ).on('tokenfield:createdtoken', =>
        @_save(prop_name)
      ).on 'tokenfield:removedtoken', =>
        @_save(prop_name)
  
  _save: (prop_name)->
    options = {}
    options[prop_name] = $(@refs[prop_name]).tokenfield('getTokensList')
    @setState options
