{div, span, h3, h4, button, i, ul, li, p, textarea, input} = React.DOM

@UserProfile_Content_Info_Form = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin]
  
  propTypes: 
    user:        React.PropTypes.object.isRequired,
    saveProfile: React.PropTypes.func.isRequired,
    onCancel:    React.PropTypes.func.isRequired

  getInitialState: ->
    @props.user
    
  saveProfile: ->
    resp = @props.saveProfile user: @state
    if resp.errors
      @setState errors: resp.errors
    else
      @props.onCancel(@state)

  render: ->
    roles = unless _.isEmpty(@props.role_list)
      _.map @props.role_list, (role, index)->
        (span className: "label__item label label-default", key: "role_#{index}", 
          (span null, role)
          (i className: "label__icon fa fa-times"))
      
    skills = unless _.isEmpty(@props.skill_list)
      _.map @props.skill_list, (skill, index)->
        (span className: "label__item label label-default", key: "skill_#{index}", 
          (span null, skill)
          (i className: "label__icon fa fa-times"))
      
    services = unless _.isEmpty(@props.service_list)
      _.map @props.service_list, (service, index)->
        (span className: "label__item label label-default", key: "service_#{index}",
          (span null, service)
          (i className: "label__icon fa fa-times"))
          
    errors = if @state.errors
      (div className: 'alert alert-danger', @state.errors.join('<br/>'))

    (span null,
      (div className: 'edit-body__btn-group edit-body__btn-group_in-title',
        (button className: 'btn-group__item_left btn_link btn btn-link', type: 'button', onClick: @props.onCancel, 'Cancel'))
        
      (div className: "section__body section__body_edit",
        (div className: "edit-body",
          (errors)
          
          (div className: "edit-body__form",
            (h4 className: "form__title", 'About me')
            (textarea className: "form__textarea form-control", valueLink: @linkState('about')))

          (div className: "edit-body__form",
            (h4 className: "form__title", 'What I do')
            (textarea className: "form__textarea form-control", placeholder: "Something more", valueLink: @linkState('what_do')))

          (div className: "edit-body__form",
            (div className: "row",
              (div className: "col-md-7",
                (h4 className: "form__title", 'Roles')
                (div className: "form__label",
                  (roles)))

              (div className: "col-md-5",
                (div className: "form__input input-group",
                  (input type: "text", placeholder: "Type here", className: "input__form-control form-control")
                  (span className: "input-group-btn",
                    (button type: "button", className: "input__btn btn btn-default",
                      (i className: "input__btn-icon fa fa-angle-down")))))))

          (div className: "edit-body__form",
            (div className: "row",
              (div className: "col-md-7",
                (h4 className: "form__title", 'Skills')
                (div className: "form__label",
                  (skills)))

              (div className: "col-md-5",
                (div className: "form__input input-group",
                  (input type: "text", placeholder: "Type here", className: "input__form-control form-control")
                  (span className: "input-group-btn",
                    (button type: "button", className: "input__btn btn btn-default",
                      (i className: "input__btn-icon fa fa-angle-down")))))))

          (div className: "edit-body__form",
            (div className: "row",
              (div className: "col-md-7",
                (h4 className: "form__title", 'Services')
                (div className: "form__label",
                  (services)))

              (div className: "col-md-5",
                (div className: "form__input input-group",
                  (input type: "text", placeholder: "Type here", className: "input__form-control form-control")
                  (span className: "input-group-btn",
                    (button type: "button", className: "input__btn btn btn-default",
                      (i className: "input__btn-icon fa fa-angle-down")))))))

          (div className: "edit-body__btn-group edit-body__btn-group_right",
            (button type: "button", className: "btn-group__item_left btn_link btn btn-link",     onClick: @props.onCancel, 'Cancel')
            (button type: "button", className: "btn-group__item_right btn_save btn btn-success", onClick: @saveProfile, 'Save')))))
