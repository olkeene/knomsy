@ReactDatepickerMixin = 
  datepicker: (prop_name, options = {})->
    _.extend options, 
      changeMonth: true, changeYear: true, yearRange: '1960:+0', 
        onSelect: (dateText, obj) =>
          opts = {}
          opts[prop_name] = dateText
          @setState opts
    
    $(@refs[prop_name]).datepicker(options)
        