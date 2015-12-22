#= require_directory ./info

{div, span, h3, h4, button, i, ul, li, p, textarea, input} = React.DOM

@UserProfile_Content_Info = React.createFactory React.createClass
  propTypes: 
    user:        React.PropTypes.object.isRequired,
    saveProfile: React.PropTypes.func.isRequired

  getInitialState: ->
    edit_mode: false,
    user: @props.user
    
  onEdit: ->
    @setState edit_mode: true
    
  onCancel: (user)->
    options = edit_mode: false
    options.user = user if user
    
    @setState options
    
  render: ->
    innerContent = if @state.edit_mode
      UserProfile_Content_Info_Form(user: @state.user, saveProfile: @props.saveProfile, onCancel: @onCancel)
    else
      UserProfile_Content_Info_View(user: @state.user, onEdit: @onEdit)
      
    (div className: 'content__section',
      (h3 className: 'section__title', 'Profile info')
      (innerContent))
