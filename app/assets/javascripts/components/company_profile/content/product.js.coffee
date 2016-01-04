#= require_directory ./product
#= require_directory ./mixins

{div, h3} = React.DOM

@CompanyProfile_Content_Product = React.createFactory React.createClass
  mixins: [CompanyProfile_Content_BaseComponent]
    
  render: ->
    innerContent = if @state.edit_mode
      CompanyProfile_Content_Info_Form(company: @state.company, saveProfile: @props.saveProfile, onCancel: @onCancel)
    else
      CompanyProfile_Content_Info_View(company: @state.company, onEdit: @onEdit)
      
    (div className: 'content__section',
      (h3 className: 'section__title', 'Product')
      (innerContent))
