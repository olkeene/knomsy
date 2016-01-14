#= require_directory ./media
#= require_directory ./mixins

{div, h3} = React.DOM

@CompanyProfile_Content_Media = React.createFactory React.createClass
  mixins: [CompanyProfile_Content_BaseComponent]
    
  render: ->
    content = if @state.edit_mode
      CompanyProfile_Content_Media_Edit(company: @state.company, saveProfile: @props.saveProfile, onCancel: @onCancel)
    else
      CompanyProfile_Content_Media_View(company: @state.company, onEdit: @onEdit)
      
    (div className: 'content__section',
      (h3 className: 'section__title', 'Media')
        content)
