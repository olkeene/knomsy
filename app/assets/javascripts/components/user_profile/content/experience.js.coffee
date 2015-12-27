#= require_directory ./experience
#= require_directory ./mixins

{div, h3} = React.DOM

@UserProfile_Content_Experience = React.createFactory React.createClass
  mixins: [UserProfile_Content_BaseComponent]
    
  render: ->
    innerContent = if @state.edit_mode
      UserProfile_Content_Experience_Edit(user: @state.user, saveProfile: @props.saveProfile, onCancel: @onCancel)
    else
      UserProfile_Content_Experience_View(user: @state.user, onEdit: @onEdit)
      
    (div className: 'content__section',
      (h3 className: 'section__title', 'Work experience')
      (innerContent))
