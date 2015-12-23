@ReactTokenizeInputMixin = 
  tokenize_input: (prop_name)->
    $(@refs[prop_name]).tokenfield({delimiter: [',', ' ']})
      .on 'tokenfield:createdtoken', =>
        options = {}
        options[prop_name] = $(@refs[prop_name]).tokenfield('getTokensList')
        @setState options
        