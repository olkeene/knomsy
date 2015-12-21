{div, span, h3, h4, button, i, ul, li, p} = React.DOM

@ProfileInfo = React.createFactory React.createClass
  getInitialState: ->
    edit_mode: false
    user: @props.user

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
      (button className: 'title__btn_edit edit-body__btn-group_in-title btn btn-link', type: "button",
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
                  
  renderForm: ->
    (div null,
    
    )
