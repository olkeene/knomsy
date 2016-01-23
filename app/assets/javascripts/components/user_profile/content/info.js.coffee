#= require_directory ./info
#= require_directory ./mixins

{div, h3} = React.DOM

@UserProfile_Content_Info = React.createFactory React.createClass
  mixins: [UserProfile_Content_BaseComponent]
    
  render: ->
    innerContent = if @state.edit_mode
      UserProfile_Content_Info_Form(user: @state.user, saveProfile: @props.saveProfile, onCancel: @onCancel)
    else
      UserProfile_Content_Info_View(user: @state.user, onEdit: @onEdit, canEditUser: @props.canEditUser)
      
    (div className: 'content__section',
      (h3 className: 'section__title', 'Profile info')
      (innerContent))
