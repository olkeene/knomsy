#= require_directory ./people
#= require_directory ./mixins

{div, h3} = React.DOM

@CompanyProfile_Content_People = React.createFactory React.createClass
  mixins: [CompanyProfile_Content_BaseComponent]
    
  render: ->
    innerContent = if @state.edit_mode
      CompanyProfile_Content_People_Edit(company: @state.company, saveProfile: @props.saveProfile, onCancel: @onCancel)
    else
      CompanyProfile_Content_People_View(company: @state.company, onEdit: @onEdit, canEditCompany: @props.canEditCompany)
      
    (div className: 'content__section',
      (h3 className: 'section__title', 'People')
      innerContent)
