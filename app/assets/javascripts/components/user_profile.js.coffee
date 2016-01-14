#= require_directory ./user_profile

{div} = React.DOM

@UserProfile = React.createClass
  saveProfile: (data, options = {})->
    response = null
    
    jOptions = 
      url: AppRoutes.profile_path()
      method: 'put'
      async: false
      data: data
      success: (resp) ->
        response = resp
        
    _.extend jOptions, options
      
    $.ajax jOptions
    response

  render: ->
    (div null,
      (UserProfile_Header(user:  @props.user, saveProfile: @saveProfile))
      (UserProfile_Content(user: @props.user, saveProfile: @saveProfile))
    )