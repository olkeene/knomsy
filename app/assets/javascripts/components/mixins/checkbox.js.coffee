@ReactCheckboxMixin = 
  componentDidMount: (prevProps, prevState)->
    $(@refs.toggleInput).bootstrapSwitch()
        