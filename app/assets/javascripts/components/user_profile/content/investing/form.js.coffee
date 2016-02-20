{div, span, h3, h4, button, i, ul, li, p, textarea, input} = React.DOM

@UserProfile_Content_Investing_Form = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, ReactTokenizeInputMixin]
  
  propTypes: 
    user:        React.PropTypes.object.isRequired,
    saveProfile: React.PropTypes.func.isRequired,
    onCancel:    React.PropTypes.func.isRequired

  getInitialState: ->
    @props.user.investing || {}
    
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
    $(@refs.visible).bootstrapSwitch()
      .on 'switchChange.bootstrapSwitch', (event, state) =>
        @setState visible: state

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
            (div className: "row",
              (div className: 'col-md-4',
                (h4 className: "form__title", 'Invests / Deal')
                (input className: "form-control", valueLink: @linkState('amount')))
              (div className: 'col-md-4',
                (h4 className: "form__title", 'Avarage Deals / Year')
                (input className: "form-control", valueLink: @linkState('deals_year')))
              (div className: 'col-md-4',
                (h4 className: "form__title", 'Confirmed Deals')
                (input className: "form-control", valueLink: @linkState('confirmed_deals')))
          ))

          (div className: "edit-body__form",
            (div className: "row",
              (div className: "col-md-4",
                (h4 className: "form__title", 'Markets'))

              (div className: "col-md-8",
                (div className: "form__input max-height",
                  (input type: "text", ref: 'market_list', placeholder: "Type here", defaultValue: @state.market_list, className: "form-control")))))

          (div className: "edit-body__form",
            (div className: "row",
              (div className: "col-md-4",
                (h4 className: "form__title", 'Countries'))

              (div className: "col-md-8",
                (div className: "form__input max-height",
                  (input type: "text", ref: 'country_list', placeholder: "Type here", defaultValue: @state.country_list, className: "form-control")))))


          (div className: "edit-body__form",
            (div className: "row",
              (div className: "col-md-4",
                (h4 className: "form__title", 'Currencies'))

              (div className: "col-md-8",
                (div className: "form__input max-height",
                  (input type: "text", ref: 'currency_list', placeholder: "Type here", defaultValue: @state.currency_list, className: "form-control")))))

          
          (div className: 'row',
            (div className: 'col-md-7 text-left edit-body__btn-group',
              (input type: 'checkbox', ref: 'visible', defaultChecked: @state.visible))

            (div className: 'col-md-5',
              (div className: "edit-body__btn-group edit-body__btn-group_right",
                (button type: "button", className: "btn-group__item_left btn_link btn btn-link",     onClick: @onCancel, 'Cancel')
                (button type: "button", className: "btn-group__item_right btn_save btn btn-success", onClick: @saveProfile, 'Save')))))))
