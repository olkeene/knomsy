{div, span, h3, h4, button, i, ul, li, p, textarea, input} = React.DOM

@UserProfile_Content_Info_Form = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, ReactTokenizedAutocompleteMixin]
  
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
      @props.onCancel(resp)
      
  onCancel: ->
    @props.onCancel()
    
  componentDidMount: (prevProps, prevState)->
    @tokenized_autocomplete('role_list',    url: Routes.roles_data_path(format: 'json'))
    @tokenized_autocomplete('skill_list',   url: Routes.skills_data_path(format: 'json'))
    @tokenized_autocomplete('service_list', url: Routes.services_data_path(format: 'json'))

  render: ->
    errors = if @state.errors
      (div className: 'alert alert-danger', dangerouslySetInnerHTML: {__html: @state.errors.join('<br />')})

    (span null,
      (div className: 'edit-body__btn-group edit-body__btn-group_in-title',
        (button className: 'btn-group__item_left btn_link btn btn-link', type: 'button', onClick: @onCancel, 'Cancel'))
        
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
              (div className: "col-md-4",
                (h4 className: "form__title", 'Roles'))

              (div className: "col-md-8",
                (div className: "form__input",
                  (input type: "text", ref: 'role_list', placeholder: "Type here", defaultValue: @state.role_list, className: "form-control")))))

          (div className: "edit-body__form",
            (div className: "row",
              (div className: "col-md-4",
                (h4 className: "form__title", 'Skill'))

              (div className: "col-md-8",
                (div className: "form__input",
                  (input type: "text", ref: 'skill_list', placeholder: "Type here", defaultValue: @state.skill_list, className: "form-control")))))


          (div className: "edit-body__form",
            (div className: "row",
              (div className: "col-md-4",
                (h4 className: "form__title", 'Services'))

              (div className: "col-md-8",
                (div className: "form__input",
                  (input type: "text", ref: 'service_list', placeholder: "Type here", defaultValue: @state.service_list, className: "form-control")))))


          (div className: "edit-body__btn-group edit-body__btn-group_right",
            (button type: "button", className: "btn-group__item_left btn_link btn btn-link",     onClick: @onCancel, 'Cancel')
            (button type: "button", className: "btn-group__item_right btn_save btn btn-success", onClick: @saveProfile, 'Save')))))
