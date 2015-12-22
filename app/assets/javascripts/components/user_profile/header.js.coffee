#= require_directory ./header

@UserProfile_Header = React.createFactory React.createClass
  mixins: [UserProfile_Base]
    
  onEdit: ->
    @setState edit_mode: true
    
  onClose: (user)->
    options = edit_mode: false
    options.user = user if user
    
    @setState options
    
  render: ->
    if @state.edit_mode
      UserProfile_Header_Form(user: @state.user, saveProfile: @props.saveProfile, onClose: @onClose)
    else
      UserProfile_Header_View(user: @state.user, onEdit: @onEdit)
