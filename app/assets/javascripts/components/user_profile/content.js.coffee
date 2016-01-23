#= require_directory ./content

{div} = React.DOM

@UserProfile_Content = React.createFactory React.createClass
  mixins: [UserProfile_Base]
    
  render: ->
    options = {user: @state.user, saveProfile: @props.saveProfile, canEditUser: @props.canEditUser}
    
    (div className: 'profile-card__content container',
      UserProfile_Content_BreadCrumbs()
      (div className: 'col-xs-12 col-sm-12 col-md-10',
        UserProfile_Content_Info(options)
        UserProfile_Content_Investing(options)
        UserProfile_Content_Experience(options)
        UserProfile_Content_References(user: @state.user)))
