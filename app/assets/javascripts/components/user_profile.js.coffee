#= require_directory ./user_profile

{div} = React.DOM

@UserProfile = React.createClass
  saveProfile: (hash)->
    response = null
    $.ajax
      method: 'put'
      async: false
      url: AppRoutes.profile_path()
      data: hash
      success: (resp) ->
        response = resp
    response

  render: ->
    (div null,
      (UserProfile_Header(user:  @props.user, saveProfile: @saveProfile))
      (UserProfile_Content(user: @props.user, saveProfile: @saveProfile))
    )