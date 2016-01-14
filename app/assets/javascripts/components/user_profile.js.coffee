#= require_directory ./user_profile
#= require_directory ./mixins

{div} = React.DOM

@UserProfile = React.createClass
  mixins: [AjaxCallbacks]
  
  saveProfile: (data, options = {})->
    response = null
    
    jOptions = 
      url: AppRoutes.profile_path()
      method: 'put'
      async: false
      data: data
      beforeSend: =>
        @ajax_before_save_callback()
      success: (resp) =>
        @ajax_after_save_callback()
        response = resp
        
    _.extend jOptions, options
      
    $.ajax jOptions
    response

  render: ->
    (div null,
      (UserProfile_Header(user:  @props.user, saveProfile: @saveProfile))
      (UserProfile_Content(user: @props.user, saveProfile: @saveProfile)) )