#= require_directory ./company_profile
#= require_directory ./mixins

{div} = React.DOM

@CompanyProfile = React.createClass
  mixins: [AjaxCallbacks]

  saveProfile: (data, options = {})->
    response = null
    
    jOptions = 
      url: AppRoutes.company_path(gon.company.id)
      method: 'put'
      async: false
      data: data
      beforeSend: =>
        @ajax_before_save_callback()
      success: (resp) =>
        @ajax_after_save_callback()
        gon.company = resp unless resp.errors
        response    = resp
        
    _.extend jOptions, options
      
    $.ajax jOptions
    response

  render: ->
    options = {company: @props.company, saveProfile: @saveProfile, canEditCompany: gon.canEditCompany}

    (div null,
      CompanyProfile_Header(options)
      CompanyProfile_Content(options))