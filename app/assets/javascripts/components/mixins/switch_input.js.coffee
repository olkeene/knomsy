@ReactSwitchInputMixin = 
  # checkbox slider
  switch_input: (prop_name)->
    $(@refs[prop_name]).bootstrapSwitch()
      .on 'switchChange.bootstrapSwitch', (event, state) =>
        options = {}
        options[prop_name] = state
        @setState options