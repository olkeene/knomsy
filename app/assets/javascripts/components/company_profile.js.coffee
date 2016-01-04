#= require_directory ./company_profile

{div} = React.DOM

@CompanyProfile = React.createClass
  saveProfile: (hash)->
    response = null
    $.ajax
      method: 'put'
      async: false
      url: AppRoutes.company_path(gon.company.id)
      data: hash
      success: (resp) ->
        response = resp
    response

  render: ->
    (div null,
      (CompanyProfile_Header(company:  @props.company, saveProfile: @saveProfile))
      (CompanyProfile_Content(company: @props.company, saveProfile: @saveProfile)))