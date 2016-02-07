{div, span, h3, h4, button, i, ul, li, p, textarea, input} = React.DOM

@UserProfile_Content_Info_View = React.createFactory React.createClass
  propTypes: 
    user:   React.PropTypes.object.isRequired,
    onEdit: React.PropTypes.func.isRequired

  render: ->
    roles = unless _.isEmpty(@props.user.role_list)
      _.map @props.user.role_list, (role, i)->
        (li className: "list__item_roles", key: "role_#{i}", role)
      
    skills = unless _.isEmpty(@props.user.skill_list)
      _.map @props.user.skill_list, (skill, i)->
        (span className: "label label-default label__item", key: "skill_#{i}", skill)
      
    services = unless _.isEmpty(@props.user.service_list)
      _.map @props.user.service_list, (service, i)->
        (span className: "label label-default label__item", key: "service_#{i}", service)
    
    editBtn = if @props.canEditUser
      (button className: 'title__btn_edit edit-body__btn-group_in-title btn btn-link', type: "button", onClick: @props.onEdit,
        (i className: 'button__icon fa fa-pencil')
        (span null, 'Edit'))

    (span null,
      editBtn

      (div className: 'section__body section__body_view',
        (div className: "view-body",
          (div className: "view-body__form row",
            (div className: "col-md-6",
              (div className: "form__group-objects",
                (h4 className: "form__title", 'About me')
                (p className: "form__text", @props.user.about))
              (div className: "form__group-objects",
                (h4 className: "form__title", 'What I do')
                (p className: "form__text", @props.user.what_do)))

            (div className: "col-md-6",
              (div className: "form__group-objects",
                (h4 className: "form__title", 'Roles')
                (ul className: "form__list_inline",
                  roles))

              (div className: "form__group-objects",
                (h4 className: "form__title", 'Skills')
                (div className: "form__label",
                  skills))

              (div className: "form__group-objects",
                (h4 className: "form__title", 'Services')
                (div className: "form__label",
                  services)))))))
