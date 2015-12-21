{div} = React.DOM

@UserProfile = React.createClass
  getInitialState: ->
    user: @props.user
    
  render: ->
    (div null,
      (window.UserHeaderWidget(user: @state.user))
      (window.UserProfileWidget(user: @state.user))
    )