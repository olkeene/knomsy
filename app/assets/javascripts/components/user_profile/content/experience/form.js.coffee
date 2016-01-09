#= require_directory ./../../../mixins

{div, span, h4, button, i, p, textarea, input, label, a, img, select, option} = React.DOM

@UserProfile_Content_Experience_Form = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, ReactTokenizeInputMixin, ReactDatepickerMixin, ReactSwitchInputMixin]
  
  propTypes: 
    experience:  React.PropTypes.object,
    saveProfile: React.PropTypes.func.isRequired,
    onCancel:    React.PropTypes.func.isRequired

  getInitialState: ->
    @props.experience || {current: true}
  
  componentDidMount: (prevProps, prevState) ->
    @datepicker 'started_at'
    @datepicker 'ended_at'
    @switch_input 'current'
    
  saveProfile: ->
    resp = @props.saveProfile {user: {experiences_attributes: [@state]}}
    if resp.errors
      @setState errors: resp.errors
    else
      @props.onCancel(resp)
      
  onCancel: ->
    @props.onCancel()
    
  onDelete: ->
    @setState '_destroy': '1', @saveProfile
    
  render: ->
    errors = if @state.errors
      (div className: 'alert alert-danger', dangerouslySetInnerHTML: {__html: @state.errors.join('<br />')})
    
    typeOptions = _.map gon.experience_roles, (hash)->
      (option value: hash.value, key: "type_select_#{hash.value}", hash.name)
    # with blank
    typeOptions.unshift(option value: '', key: "type_select_", '')
    
    deleteBtn = if @state.id
      (button type: "button", className: "btn-group__item btn_grey btn btn-primary", onClick: @onDelete, 'Delete')

    (span null,
      (div className: 'edit-body__btn-group edit-body__btn-group_in-title',
        (button className: 'btn-group__item_left btn_link btn btn-link', type: 'button', onClick: @onCancel, 'Cancel'))
        
      (div className: "section__body section__body_edit",
        (div className: "edit-body",
          errors
  
          (div className: "edit-body__form",
            (h4 className: "form__title", 'Add Experience')
            (div className: "form__input-group",
              (div className: "row",
                (div className: "col-md-5",
                  
                  (div className: "input",
                    (h4 className: "input__title", 'Company')
                    (input type: "text", placeholder: "Dribbble", className: "input__form-control_company form-control", valueLink: @linkState('company_name')))
                  
                  (div className: "input",
                    (h4 className: "input__title", 'Role')
                    (select className: "form-control", valueLink: @linkState('role'),
                      typeOptions
                    ))

                  (div className: "input",
                    (h4 className: "input__title", 'Title')
                    (input type: "text", placeholder: "UX/UI Designer", className: "form-control", valueLink: @linkState('title')))

                  (div className: "input",
                    (h4 className: "input__title", 'Description')
                    (textarea className: "form__textarea form-control", valueLink: @linkState('description'))))

                (div className: "col-md-7",
                  (div className: "row input__calendar",
                    (div className: "col-sm-1",
                      (p className: "calendar__text", 'from'))

                    (div className: "col-sm-5",
                      (input type: "text", ref: 'started_at', className: "form-control", valueLink: @linkState('started_at'))))

                  (div className: "row input__calendar",
                    (div className: "col-sm-1",
                      (p className: "calendar__text", 'to'))

                    (div className: "col-sm-5",
                      (input type: "text", ref: 'ended_at', className: "form-control", valueLink: @linkState('ended_at'))))

                  (div className: "checkbox",
                    (label className: "input__checkbox",
                      (input type: 'checkbox', ref: 'current', defaultChecked: @state.current)
                      (span null, 'Current position'))))
              )
            )

            (div className: "edit-body__btn-group edit-body__btn-group_left",
              (button type: "button", className: "btn-group__item btn_save btn btn-success", onClick: @saveProfile, 'Save')
              (button type: "button", className: "btn-group__item btn_grey btn btn-primary", onClick: @onCancel, 'Cancel')
              deleteBtn
            )
          )
        )
      )
    )
