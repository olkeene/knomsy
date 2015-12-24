{div, span, h4, button, i, p, textarea, input, label, a, img} = React.DOM

@UserProfile_Content_Experience_Form = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, ReactTokenizeInputMixin, ReactCheckboxMixin]
  
  propTypes: 
    user:        React.PropTypes.object.isRequired,
    saveProfile: React.PropTypes.func.isRequired,
    onCancel:    React.PropTypes.func.isRequired

  getInitialState: ->
    @props.user.investing
    
  saveProfile: ->
    resp = @props.saveProfile {user: {investing_attributes: @state}}
    if resp.errors
      @setState errors: resp.errors
    else
      @props.onCancel(resp)
      
  onCancel: ->
    @props.onCancel()
    
  componentDidMount: (prevProps, prevState)->
    @tokenize_input('market_list')
    @tokenize_input('country_list')
    @tokenize_input('currency_list')
    
    # checkbox slider
    $(@refs.toggleInput).on 'switchChange.bootstrapSwitch', (event, state) =>
        @setState visible: state

  render: ->
    errors = if @state.errors
      (div className: 'alert alert-danger', @state.errors.join('<br/>'))

    (span null,
      (div className: 'edit-body__btn-group edit-body__btn-group_in-title',
        (button className: 'btn-group__item_left btn_link btn btn-link', type: 'button', onClick: @onCancel, 'Cancel'))
        
      (div className: "section__body section__body_edit",
        (div className: "edit-body",
          (errors)
          
          (div className: "edit-body__btn-group edit-body__btn-group_left",
            (button type: "button", className: "btn_add-work btn btn-primary",
              (i className: "button__icon fa fa-plus-circle")
              (span null, 'Add New')
            )
          )
          (div className: "edit-body__form",
            (h4 className: "form__title", 'Add Experience')
            (div className: "form__input-group",
              (div className: "row",
                (div className: "col-md-5",
                  (div className: "input",
                    (h4 className: "input__title", 'Company')
                    (div className: "form__input input-group",
                      (input type: "text", placeholder: "Dribbble", className: "input__form-control input__form-control_company form-control")
                      (span className: "input-group-btn",
                        (button type: "button", className: "input__btn btn btn-default",
                          (i className: "input__btn-icon fa fa-angle-down")
                        )
                      )
                    )
                  )
                  (div className: "input",
                    (h4 className: "input__title", 'Role')
                    (div className: "form__input input-group",
                      (input type: "text", placeholder: "Employee", className: "input__form-control form-control")
                      (span className: "input-group-btn",
                        (button type: "button", className: "input__btn btn btn-default",
                          (i className: "input__btn-icon fa fa-angle-down")
                        )
                      )
                    )
                  )
                  (div className: "input",
                    (h4 className: "input__title", 'Title')
                    (div className: "form__input input-group",
                      (input type: "text", placeholder: "UX/UI Designer", className: "input__form-control form-control")
                      (span className: "input-group-btn",
                        (button type: "button", className: "input__btn btn btn-default",
                          (i className: "input__btn-icon fa fa-angle-down")
                        )
                      )
                    )
                  )
                  (div className: "input",
                    (h4 className: "input__title", 'Description')
                    (textarea placeholder: "Lorem ipsum dolor sit amet.", className: "form__textarea form-control")
                  )
                )
                (div className: "col-md-7",
                  (div className: "row input__calendar",
                    (div className: "col-sm-1",
                      (p className: "calendar__text", 'from')
                    )
                    (div className: "col-sm-4",
                      (div className: "form__input input-group",
                        (input type: "text", placeholder: "Year", className: "input__form-control form-control")
                        (span className: "input-group-btn",
                          (button type: "button", className: "input__btn btn btn-default",
                            (i className: "input__btn-icon fa fa-angle-down")
                          )
                        )
                      )
                    )
                    (div className: "col-sm-4",
                      (div className: "form__input input-group",
                        (input type: "text", placeholder: "Month", className: "input__form-control form-control")
                        (span className: "input-group-btn",
                          (button type: "button", className: "input__btn btn btn-default",
                            (i className: "input__btn-icon fa fa-angle-down")
                          )
                        )
                      )
                    )
                    (div className: "col-sm-3",
                      (div className: "form__input input-group",
                        (input type: "text", placeholder: "Day", className: "input__form-control form-control")
                        (span className: "input-group-btn",
                          (button type: "button", className: "input__btn btn btn-default",
                            (i className: "input__btn-icon fa fa-angle-down")
                          )
                        )
                      )
                    )
                  )
                  (div className: "row input__calendar",
                    (div className: "col-sm-1",
                      (p className: "calendar__text", 'to')
                    )
                    (div className: "col-sm-4",
                      (div className: "form__input input-group",
                        (input type: "text", placeholder: "Year", className: "input__form-control form-control")
                        (span className: "input-group-btn",
                          (button type: "button", className: "input__btn btn btn-default",
                            (i className: "input__btn-icon fa fa-angle-down")
                          )
                        )
                      )
                    )
                    (div className: "col-sm-4",
                      (div className: "form__input input-group",
                        (input type: "text", placeholder: "Month", className: "input__form-control form-control")
                        (span className: "input-group-btn",
                          (button type: "button", className: "input__btn btn btn-default",
                            (i className: "input__btn-icon fa fa-angle-down")
                          )
                        )
                      )
                    )
                    (div className: "col-sm-3",
                      (div className: "form__input input-group",
                        (input type: "text", placeholder: "Day", className: "input__form-control form-control")
                        (span className: "input-group-btn",
                          (button type: "button", className: "input__btn btn btn-default",
                            (i className: "input__btn-icon fa fa-angle-down")
                          )
                        )
                      )
                    )
                  )
                  (div className: "checkbox",
                    (label className: "input__checkbox",
                      (input null)
                      (span null, 'Current position')
                    )
                  )
                )
              )
            )
            (div className: "edit-body__btn-group edit-body__btn-group_left",
              (button type: "button", className: "btn-group__item btn_save btn btn-success", 'Save')
              (button type: "button", className: "btn-group__item btn_grey btn btn-primary", 'Cancel')
              (button type: "button", className: "btn-group__item btn_grey btn btn-primary", 'Delete')
            )
          )
          (div className: "edit-body__form",
            (div null,
              (h4 className: "form__title", 'Founder')
              (div className: "form__objects",
                (div className: "row",
                  (div className: "col-md-10",
                    (div className: "objects__company media",
                      (div className: "media-left",
                        (a null, 
                          (img src: "http://placehold.it/50x50", className: "company__image media-object")
                        )
                      )
                      (div className: "media-body",
                        (a null, 
                          (h4 className: "company__name media-heading", 'Dribble')
                        )
                        (p className: "company__description", 'Company short description')
                        (p className: "company__position", 'Art Director')
                        (span className: "company__period", '12 Oct 2014 - 29 Dec 2014')
                      )
                    )
                  )
                  (div className: "col-md-2",
                    (button type: "button", className: "btn_edit btn btn-primary", 'Edit')
                  )
                )
                (div className: "row",
                  (div className: "col-md-10",
                    (div className: "objects__company media",
                      (div className: "media-left",
                        (a null, 
                          (img src: "http://placehold.it/50x50", className: "company__image media-object")
                        )
                      )
                      (div className: "media-body",
                        (a null, 
                          (h4 className: "company__name media-heading", 'Dribble')
                        )
                        (p className: "company__description", 'Company short description')
                        (p className: "company__position", 'Art Director')
                        (span className: "company__period", '12 Oct 2014 - 29 Dec 2014')
                      )
                    )
                  )
                  (div className: "col-md-2",
                    (button type: "button", className: "btn_edit btn btn-primary", 'Edit')
                  )
                )
              )
            )
            (div null,
              (h4 className: "form__title", 'Investor')
              (div className: "form__objects",
                (div className: "row",
                  (div className: "col-md-10",
                    (div className: "objects__company media",
                      (div className: "media-left",
                        (a null, 
                          (img src: "http://placehold.it/50x50", className: "company__image media-object")
                        )
                      )
                      (div className: "media-body",
                        (a null, 
                          (h4 className: "company__name media-heading", 'Dribble')
                        )
                        (p className: "company__description", 'Company short description')
                        (p className: "company__position", 'Art Director')
                        (span className: "company__period", '12 Oct 2014 - 29 Dec 2014')
                      )
                    )
                  )
                  (div className: "col-md-2",
                    (button type: "button", className: "btn_edit btn btn-primary", 'Edit')
                  )
                )
              )
            )
            (div null,
              (h4 className: "form__title", 'Employee')
              (div className: "form__objects",
                (div className: "row",
                  (div className: "col-md-10",
                    (div className: "objects__company media",
                      (div className: "media-left",
                        (a null, 
                          (img src: "http://placehold.it/50x50", className: "company__image media-object")
                        )
                      )
                      (div className: "media-body",
                        (a null, 
                          (h4 className: "company__name media-heading", 'Dribble')
                        )
                        (p className: "company__description", 'Company short description')
                        (p className: "company__position", 'Art Director')
                        (span className: "company__period", '12 Oct 2014 - 29 Dec 2014')
                      )
                    )
                  )
                  (div className: "col-md-2",
                    (button type: "button", className: "btn_edit btn btn-primary", 'Edit')
                  )
                )
              )
            )
            (div null,
              (h4 className: "form__title", 'Education')
              (div className: "form__objects",
                (div className: "row",
                  (div className: "col-md-10",
                    (div className: "objects__university media",
                      (div className: "media-body",
                        (a null, 
                          (h4 className: "form__title form__title_nopadding media-heading", 'MGU')
                        )
                        (span className: "title__subtext",'(Moscow)')
                        (p className: "university__degree", 'Bachelors degree, Media')
                        (span className: "university__period", '2012 - 2014')
                      )
                    )
                  )
                  (div className: "col-md-2",
                    (button type: "button", className: "btn_edit btn btn-primary", 'Edit')
                  )
                )
                (div className: "row",
                  (div className: "col-md-10",
                    (div className: "objects__university media",
                      (div className: "media-body",
                        (a null, 
                          (h4 className: "form__title form__title_nopadding media-heading", 'MGU')
                        )
                        (span className: "title__subtext", '(Moscow)')
                        (p className: "university__degree", 'Bachelors degree, Media')
                        (span className: "university__period", '2012 - 2014')
                      )
                    )
                  )
                  (div className: "col-md-2",
                    (button type: "button", className: "btn_edit btn btn-primary", 'Edit')
                  )
                )
              )
            )
          )
          (div className: "edit-body__btn-group edit-body__btn-group_right",
            (button type: "button", className: "btn-group__item_left btn_link btn btn-link", 'Cancel')
            (button type: "button", className: "btn-group__item_right btn_save btn btn-success", 'Save')
          )
          
        )
      )
    )
