#= require_tree ./profile

{div} = React.DOM

@UserProfileWidget = React.createFactory React.createClass
  getInitialState: ->
    edit_mode: false
    user: @props.user
    
  render: ->
    (div className: 'profile-card__content container',
      (ProfileBreadCrumbs())
      (div className: 'col-xs-12 col-sm-12 col-md-10',
        (ProfileInfo(user: @state.user))
        (References(user: @state.user))
      ))