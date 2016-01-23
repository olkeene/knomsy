#= require_directory ./investing
#= require_directory ./mixins

{div, h3} = React.DOM

@UserProfile_Content_Investing = React.createFactory React.createClass
  mixins: [UserProfile_Content_BaseComponent]
    
  render: ->
    innerContent = if @state.edit_mode
      UserProfile_Content_Investing_Form(user: @state.user, saveProfile: @props.saveProfile, onCancel: @onCancel)
    else
      UserProfile_Content_Investing_View(user: @state.user, onEdit: @onEdit, canEditUser: @props.canEditUser)
      
    (div className: 'content__section',
      (h3 className: 'section__title', 'Investing')
      (innerContent))
