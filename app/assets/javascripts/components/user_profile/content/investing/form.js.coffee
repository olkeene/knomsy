{div, span, h3, h4, button, i, ul, li, p, textarea, input} = React.DOM

@UserProfile_Content_Investing_Form = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, ReactCheckboxMixin]
  
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
    $(@refs.toggleInput).on 'switchChange.bootstrapSwitch', (event, state) =>
        @setState visible: state

  render: ->
    markets = unless _.isEmpty(@props.market_list)
      _.map @props.market_list, (market, index)->
        (span className: "label__item label label-default", key: "market_#{index}", 
          (span null, market)
          (i className: "label__icon fa fa-times"))
      
    countries = unless _.isEmpty(@props.country_list)
      _.map @props.country_list, (country, index)->
        (span className: "label__item label label-default", key: "country_#{index}", 
          (span null, country)
          (i className: "label__icon fa fa-times"))
      
    currencies = unless _.isEmpty(@props.currency_list)
      _.map @props.currency_list, (currency, index)->
        (span className: "label__item label label-default", key: "currency_#{index}",
          (span null, currency)
          (i className: "label__icon fa fa-times"))
          
    errors = if @state.errors
      (div className: 'alert alert-danger', @state.errors.join('<br/>'))

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
              (div className: "col-md-7",
                (h4 className: "form__title", 'Markets')
                (div className: "form__label",
                  (markets)))

              (div className: "col-md-5",
                (div className: "form__input input-group",
                  (input type: "text", placeholder: "Type here", className: "input__form-control form-control")
                  (span className: "input-group-btn",
                    (button type: "button", className: "input__btn btn btn-default",
                      (i className: "input__btn-icon fa fa-angle-down")))))))

          (div className: "edit-body__form",
            (div className: "row",
              (div className: "col-md-7",
                (h4 className: "form__title", 'Countries')
                (div className: "form__label",
                  (countries)))

              (div className: "col-md-5",
                (div className: "form__input input-group",
                  (input type: "text", placeholder: "Type here", className: "input__form-control form-control")
                  (span className: "input-group-btn",
                    (button type: "button", className: "input__btn btn btn-default",
                      (i className: "input__btn-icon fa fa-angle-down")))))))

          (div className: "edit-body__form",
            (div className: "row",
              (div className: "col-md-7",
                (h4 className: "form__title", 'Currencies')
                (div className: "form__label",
                  (currencies)))

              (div className: "col-md-5",
                (div className: "form__input input-group",
                  (input type: "text", placeholder: "Type here", className: "input__form-control form-control")
                  (span className: "input-group-btn",
                    (button type: "button", className: "input__btn btn btn-default",
                      (i className: "input__btn-icon fa fa-angle-down")))))))

          (div className: 'row',
            (div className: 'col-md-7 text-left edit-body__btn-group',
              (input type: 'checkbox', ref: 'toggleInput', defaultChecked: @state.visible, onChange: @onChangeVisibility))

            (div className: 'col-md-5',
              (div className: "edit-body__btn-group edit-body__btn-group_right",
                (button type: "button", className: "btn-group__item_left btn_link btn btn-link",     onClick: @onCancel, 'Cancel')
                (button type: "button", className: "btn-group__item_right btn_save btn btn-success", onClick: @saveProfile, 'Save')))))))
