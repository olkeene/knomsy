#= require_tree ./header

@UserHeaderWidget = React.createFactory React.createClass
  getInitialState: ->
    edit_mode: false
    user: @props.user
    
  editModeOn: ->
    @setState edit_mode: true
    
  editModeOff: ->
    @setState edit_mode: false
    
  onUpdate: (user)->
    @setState user: user, edit_mode: false
    
  render: ->
    if @state.edit_mode
      window.EditUserHeaderProfile(user: @state.user, onUpdate: @onUpdate, onClose: @editModeOff)
    else
      window.UserHeaderProfile(user: @state.user, onEditPressed: @editModeOn)
