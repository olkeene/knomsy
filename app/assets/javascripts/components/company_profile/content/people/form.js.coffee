{div, span, h4, button, input, select, option} = React.DOM

@CompanyProfile_Content_People_Form = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin]
  
  propTypes: 
    member:      React.PropTypes.object,
    saveProfile: React.PropTypes.func.isRequired,
    onCancel:    React.PropTypes.func.isRequired

  getInitialState: ->
    @props.member || {}

  cancel: ->
    @props.onCancel()
    
  onDelete: ->
    @setState '_destroy': '1', @saveProfile
    
  saveProfile: ->
    resp = @props.saveProfile company: {members_attributes: [@state]}
    if resp.errors
      @setState errors: resp.errors
    else
      @props.onCancel(resp)
      
  onCancel: ->
    @props.onCancel()
      
  render: ->
    errors = if @state.errors
      (div className: 'alert alert-danger', dangerouslySetInnerHTML: {__html: @state.errors.join('<br />')})
      
    typeOptions = _.map gon.peopleRoles, (hash)->
      (option value: hash.value, key: "type_select_#{hash.value}", hash.name)
    # with blank
    typeOptions.unshift(option value: '', key: "type_select_", '')
  
    deleteBtn = if @state.id
      (button type: "button", className: "btn-group__item btn_grey btn btn-primary", onClick: @onDelete, 'Delete')

    (span null,
      (div className: "section__body section__body_edit section__body__new_member",
        (div className: "edit-body",
          (errors)
          
          (div className: "input",
            (h4 className: "input__title", 'Name')
            (input type: "text", className: "form-control", valueLink: @linkState('name')))
          
          (div className: "input",
            (h4 className: "input__title", 'Type')
            (select className: "form-control", valueLink: @linkState('role'),
              typeOptions
            ))
          
          (div className: "input",
            (h4 className: "input__title", 'Role')
            (input type: "text", placeholder: "UX/UI Designer", className: "form-control", valueLink: @linkState('title')))

          (div className: "edit-body__btn-group edit-body__btn-group_right",
            (button type: "button", className: "btn-group__item btn_save btn btn-success", onClick: @saveProfile, 'Save')
            (button type: "button", className: "btn-group__item btn_grey btn btn-primary", onClick: @onCancel, 'Cancel')
            deleteBtn
          )
        )))
