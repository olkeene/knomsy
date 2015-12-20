@UserProfileWidget = React.createClass
  getInitialState: ->
    {edit_mode: false}
    
  editModeOn: ->
    @setState edit_mode: true
    
  editModeOff: ->
    @setState edit_mode: false
    
  render: ->
    if @state.edit_mode
      window.EditUserHeaderProfile(onClose: @editModeOff)
    else
      window.UserHeaderProfile(onEditPressed: @editModeOn)
