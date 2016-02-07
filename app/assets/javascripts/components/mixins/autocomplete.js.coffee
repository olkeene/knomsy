@AutocompleteMixin = 
  react_autocomplete: (field_name, field_id, options)->
    $(@refs[field_name]).typeahead(
      {highlight: true},
      {source: @_autocomplete_engine(options).ttAdapter()}
    ).on 'typeahead:selected', (ev, suggestion)=>
      options = {}
      options[field_name] = suggestion.value
      options[field_id]   = suggestion.id
      @setState options
      
  autocomplete: (bind_input_id, hidden_field_id, options)->
    $("##{bind_input_id}").typeahead(
      {highlight: true},
      {source: @_autocomplete_engine(options).ttAdapter()}
    ).on 'typeahead:selected', (ev, suggestion)=>
      $("##{bind_input_id}").val(suggestion.value)
      $("##{hidden_field_id}").val(suggestion.id)
  
  _autocomplete_engine: (options)->
    engine = new Bloodhound
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value')
      queryTokenizer: Bloodhound.tokenizers.whitespace
      remote: 
        url: options.url
        wildcard: 'QUERY'
    
    engine.initialize()
    engine
