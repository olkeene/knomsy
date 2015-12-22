#= require_directory ./user_profile

{div} = React.DOM

@UserProfile = React.createClass
  saveProfile: (hash)->
    $.ajax
      method: 'put'
      url: AppRoutes.profile_path()
      data: hash
      success: (resp) ->
        return resp

  render: ->
    (div null,
      (UserProfile_Header(user:  @props.user, saveProfile: @saveProfile))
      (UserProfile_Content(user: @props.user, saveProfile: @saveProfile))
    )