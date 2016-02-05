@ReactTokenizedAutocompleteMixin = 
  tokenized_autocomplete: (prop_name, options)->
    engine = new Bloodhound
      datumTokenizer: (d)->
        Bloodhound.tokenizers.whitespace(d.value)
      queryTokenizer: Bloodhound.tokenizers.whitespace
      prefetch: options.url
      
    engine.initialize()
    
    $(@refs[prop_name]).tokenfield(
      delimiter: [',']
      typeahead: [null, source: engine.ttAdapter(), displayKey: 'value']
    ).on 'tokenfield:createdtoken', =>
      options = {}
      options[prop_name] = $(@refs[prop_name]).tokenfield('getTokensList')
      @setState options