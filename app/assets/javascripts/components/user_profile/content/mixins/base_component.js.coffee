@UserProfile_Content_BaseComponent = 
  propTypes: 
    user:        React.PropTypes.object.isRequired,
    saveProfile: React.PropTypes.func.isRequired

  getInitialState: ->
    edit_mode: false,
    user: @props.user
    
  onEdit: ->
    @setState edit_mode: true
    
  onCancel: (user)->
    options = edit_mode: false
    options.user = user if user
    
    @setState options