@UserProfile_Base = 
  propTypes: 
    user: React.PropTypes.object.isRequired,
    saveProfile: React.PropTypes.func.isRequired
    
  getInitialState: ->
    edit_mode: false
    user: @props.user