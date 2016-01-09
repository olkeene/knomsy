#= require_directory ./funding
#= require_directory ./mixins

{div, h3} = React.DOM

@CompanyProfile_Content_Funding = React.createFactory React.createClass
  mixins: [CompanyProfile_Content_BaseComponent]
    
  render: ->
    content = CompanyProfile_Content_Funding_View(company: @state.company, saveProfile: @props.saveProfile)
      
    (div className: 'content__section',
      (h3 className: 'section__title', 'Funding')
      content)
