#= require_directory ./user_profile
#= require_directory ./mixins

{div} = React.DOM

@UserProfile = React.createClass
  mixins: [AjaxCallbacks]
  
  saveProfile: (data, options = {})->
    response = null
    
    jOptions = 
      url: AppRoutes.profile_path(gon.user.id)
      method: 'put'
      async: false
      data: data
      beforeSend: =>
        @ajax_before_save_callback()
      success: (resp) =>
        @ajax_after_save_callback()
        gon.user = resp unless resp.errors
        response = resp
        
    _.extend jOptions, options
      
    $.ajax jOptions
    response

  render: ->
    options = {user: @props.user, saveProfile: @saveProfile, canEditUser: gon.canEditUser}
    
    (div null,
      UserProfile_Header(options)
      UserProfile_Content(options) )