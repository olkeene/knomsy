#= require_directory ./../../mixins
#= require_directory ./../../../mixins

{div, span, h3, h4, button, i, ul, li, p, textarea, input} = React.DOM

@CompanyProfile_Content_Info_Form = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, TokenizedAutocompleteMixin, CompanyProfile_BaseFormMixin]
  
  getInitialState: ->
    @props.company

  saveProfile: ->
    resp = @props.saveProfile company: @state
    if resp.errors
      @setState errors: resp.errors
    else
      @props.onCancel(resp)
      
  componentDidMount: (prevProps, prevState)->
    @react_tokenized_autocomplete('role_list', url: Routes.roles_data_path({format: 'json'}))
    
  onCancel: ->
    @props.onCancel()

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
            (h4 className: "form__title", 'Product Description')
            (textarea className: "form__textarea form-control", valueLink: @linkState('description'), rows: 4))

          (div className: "edit-body__form",
            (div className: "row",
              (div className: "col-md-4",
                (h4 className: "form__title", 'Roles'))

              (div className: "col-md-8",
                (div className: "form__input",
                  (input type: "text", ref: 'role_list', placeholder: "Type here", defaultValue: @state.role_list, className: "form-control")))))

          (div className: "edit-body__btn-group edit-body__btn-group_right",
            (button type: "button", className: "btn-group__item_left btn_link btn btn-link",     onClick: @props.onCancel, 'Cancel')
            (button type: "button", className: "btn-group__item_right btn_save btn btn-success", onClick: @saveProfile, 'Save')))))
