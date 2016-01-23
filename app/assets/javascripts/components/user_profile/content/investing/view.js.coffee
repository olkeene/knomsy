{div, span, h3, h4, button, i, ul, li, p, textarea, input} = React.DOM

@UserProfile_Content_Investing_View = React.createFactory React.createClass
  propTypes: 
    user:   React.PropTypes.object.isRequired,
    onEdit: React.PropTypes.func.isRequired

  render: ->
    investing = @props.user.investing
    
    # amount is string
    if !investing || (
      _.isBlank(investing.amount)      && !investing.deals_year             && !investing.confirmed_deals &&
      _.isEmpty(investing.market_list) && _.isEmpty(investing.country_list) && _.isEmpty(investing.currency_list)
    )
      @renderEmpty()
    else
      @renderListings()
      
  renderEmpty: ->
    editContent = if @props.canEditCompany
      (span null,
        (p className: 'empty-body__comment', 'You can use "Edit" button to fill it')
        (button className: 'btn btn-primary btn_edit', type: 'button', onClick: @props.onEdit, 'Edit'))
      
    (div className: 'section__body section__body_empty',
      (div className: 'emptybody',
        (i className: 'empty-body__icon fa fa-usd')
        (h4 className: 'empty-body__text', 'Your investing info is empty now')
        editContent))
    
  renderListings: ->  
    markets = unless _.isEmpty(@props.user.investing.market_list)
      _.map @props.user.investing.market_list, (market, i)->
        (li className: "list__item_roles", key: "role_#{i}", market)
      
    countries = unless _.isEmpty(@props.user.investing.country_list)
      _.map @props.user.investing.country_list, (country, i)->
        (span className: "list__item_roles", key: "country_#{i}", country)
      
    currencies = unless _.isEmpty(@props.user.investing.currency_list)
      _.map @props.user.investing.currency_list, (currency, i)->
        (span className: "list__item_roles", key: "currency_#{i}", currency)
    
    editBtn = if @props.canEditUser
      (button className: 'title__btn_edit edit-body__btn-group_in-title btn btn-link', type: "button", onClick: @props.onEdit,
        (i className: 'button__icon fa fa-pencil')
        (span null, 'Edit'))

    (span null,
      editBtn

      (div className: 'section__body section__body_view',
        (div className: "view-body",
          (div className: "investing",
            (div className: "row",
              (div className: 'col-md-4',
                (div className: 'investing__circle',
                  (p className: 'investing__number', @props.user.investing.amount))
                (p className: 'form__title form__title_center', 'Invests / Deal'))
              
              (div className: 'col-md-4',
                (div className: 'investing__circle',
                  (div className: 'investing__circle_progress',
                    (p className: 'investing__number', @props.user.investing.deals_year)))
                (p className: 'form__title form__title_center', 'Average Deals / Year'))
            
              (div className: 'col-md-4',
                (div className: 'investing__circle',
                  (p className: 'investing__number', @props.user.investing.confirmed_deals))
                (p className: 'form__title form__title_center', 'Confirmed Deals')))

            (div className: "form__objects",
              (div className: 'row',
                (div className: 'col-md-4',
                  (p className: 'form__title form__title_center', 'Markets')
                  (ul className: 'form__list_inline form__list_inline-center',
                    markets))

                (div className: 'col-md-4',
                  (p className: 'form__title form__title_center', 'Currency')
                  (ul className: 'form__list_inline form__list_inline-center',
                    currencies))

                (div className: 'col-md-4',
                  (p className: 'form__title form__title_center', 'Countries')
                  (ul className: 'form__list_inline form__list_inline-center',
                    countries))))))))
