{div, span, h3, h4, button, i, ul, li, p, textarea, input} = React.DOM

@ProfileInfo = React.createFactory React.createClass
  getInitialState: ->
    edit_mode: false
    user: @props.user
    
  onEditPressed: ->
    @setState edit_mode: true

  render: ->
    innerContent = if @state.edit_mode
      @renderForm()
    else
      @renderView()
      
    (div className: 'content__section',
      (h3 className: 'section__title', 'Profile info')
      (innerContent))
    
  renderView: ->
    roles = unless _.isEmpty(@state.user.role_list)
      _.map @state.user.role_list, (role, i)->
        (li className: "list__item_roles", key: "role_#{i}", role)
      
    skills = unless _.isEmpty(@state.user.skill_list)
      _.map @state.user.skill_list, (skill, i)->
        (span className: "label__item label label-default", key: "skill_#{i}", skill)
      
    services = unless _.isEmpty(@state.user.service_list)
      _.map @state.user.service_list, (service, i)->
        (span className: "label__item label label-default", key: "service_#{i}", service)
      
    (span null,
      (button className: 'title__btn_edit edit-body__btn-group_in-title btn btn-link', type: "button", onClick: @onEditPressed,
        (i className: 'button__icon fa fa-pencil')
        (span null, 'Edit'))

      (div className: 'section__body section__body_view',
        (div className: "view-body",
          (div className: "view-body__form row",
            (div className: "col-md-6",
              (div className: "form__group-objects",
                (h4 className: "form__title", 'About me')
                (p className: "form__text", @state.user.about))
              (div className: "form__group-objects",
                (h4 className: "form__title", 'What I do')
                (p className: "form__text", @state.user.what_do)))

            (div className: "col-md-6",
              (div className: "form__group-objects",
                (h4 className: "form__title", 'Roles')
                (ul className: "form__list_inline",
                  (roles)))

              (div className: "form__group-objects",
                (h4 className: "form__title", 'Skills')
                (div className: "form__label",
                  (skills)))

              (div className: "form__group-objects",
                (h4 className: "form__title", 'Services')
                (div className: "form__label",
                  (services))))))))
          
  onCancelPressed: ->
    @setState edit_mode: false
    
  onSavePressed: ->
    console.log 'todo..'

  renderForm: ->
    roles = unless _.isEmpty(@state.user.role_list)
      _.map @state.user.role_list, (role, index)->
        (span className: "label__item label label-default", key: "role_#{index}", 
          (span null, role)
          (i className: "label__icon fa fa-times"))
      
    skills = unless _.isEmpty(@state.user.skill_list)
      _.map @state.user.skill_list, (skill, index)->
        (span className: "label__item label label-default", key: "skill_#{index}", 
          (span null, skill)
          (i className: "label__icon fa fa-times"))
      
    services = unless _.isEmpty(@state.user.service_list)
      _.map @state.user.service_list, (service, index)->
        (span className: "label__item label label-default", key: "service_#{index}",
          (span null, service)
          (i className: "label__icon fa fa-times"))

    (span null,
      (div className: 'edit-body__btn-group edit-body__btn-group_in-title', onClick: @onCancelPressed,
        (button className: 'btn-group__item_left btn_link btn btn-link', type: 'button', 'Cancel'))
        
      (div className: "section__body section__body_edit",
        (div className: "edit-body",
          (div className: "edit-body__form",
            (h4 className: "form__title", 'About me')
            (textarea className: "form__textarea form-control", value: @state.user.about))

          (div className: "edit-body__form",
            (h4 className: "form__title", 'What I do')
            (textarea className: "form__textarea form-control", placeholder: "Something more", value: @state.user.what_do))

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
            (button type: "button", className: "btn-group__item_left btn_link btn btn-link",     onClick: @onCancelPressed, 'Cancel')
            (button type: "button", className: "btn-group__item_right btn_save btn btn-success", onClick: @onSavePressed,    'Save')))))