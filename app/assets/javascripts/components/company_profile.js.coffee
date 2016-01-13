#= require_directory ./company_profile

{div} = React.DOM

@CompanyProfile = React.createClass
  saveProfile: (data, options = {})->
    response = null
    
    jOptions = 
      url: AppRoutes.company_path(gon.company.id)
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
      (CompanyProfile_Header(company:  @props.company, saveProfile: @saveProfile))
      (CompanyProfile_Content(company: @props.company, saveProfile: @saveProfile)))