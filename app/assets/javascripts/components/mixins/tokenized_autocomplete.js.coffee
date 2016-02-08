@TokenizedAutocompleteMixin = 
  react_tokenized_autocomplete: (prop_name, options)->
    engine = @_engine(options)
    
    $(@refs[prop_name]).tokenfield(
      @_init_options(engine)
    ).on 'tokenfield:createdtoken', =>
      @_save(prop_name)
  
  react_tokenized_remote_autocomplete: (prop_name, options)->
    engine = @_remote_engine(options)
    
    $(@refs[prop_name]).tokenfield(
      @_init_options(engine)
    ).on 'tokenfield:createdtoken', =>
      @_save(prop_name)
  
  tokenized_remote_autocomplete: (bind_input_id, options)->
    field  = $("##{bind_input_id}")
    engine = @_remote_engine(options)
    
    field.tokenfield(
      @_init_options(engine)
    )
  
  _init_options: (engine)->
    delimiter: [',']
    typeahead: [null, source: engine.ttAdapter(), displayKey: 'value']
  
  _engine: (options)->
    engine = new Bloodhound
      datumTokenizer: (d)->
        Bloodhound.tokenizers.whitespace(d.value)
      queryTokenizer: Bloodhound.tokenizers.whitespace
      prefetch: options.url
      
    engine.initialize()
    engine
  
  _remote_engine: (options)->
    engine = new Bloodhound
      datumTokenizer: (d)->
        Bloodhound.tokenizers.whitespace(d.value)
      queryTokenizer: Bloodhound.tokenizers.whitespace
      remote: 
        url: options.url
        wildcard: 'QUERY'
      
    engine.initialize()
    engine
  
  _save: (prop_name)->
    options = {}
    options[prop_name] = $(@refs[prop_name]).tokenfield('getTokensList')
    @setState options