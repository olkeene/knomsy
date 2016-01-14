#= require_directory ./content
#= require_directory ./mixins

{div} = React.DOM

@CompanyProfile_Content = React.createFactory React.createClass
  mixins: [CompanyProfile_Base]
    
  render: ->
    options = {company: @state.company, saveProfile: @props.saveProfile}
    # (CompanyProfile_Content_Traction(company: @state.company, saveProfile: @props.saveProfile))
    # (CompanyProfile_Content_Activity(company: @state.company, saveProfile: @props.saveProfile))

    (div className: 'profile-card__content container',
      CompanyProfile_Content_BreadCrumbs()
      (div className: 'col-xs-12 col-sm-12 col-md-10',
        CompanyProfile_Content_Product(options)
        CompanyProfile_Content_People(options)
        CompanyProfile_Content_Funding(options)
        CompanyProfile_Content_Media(options)
      ))
