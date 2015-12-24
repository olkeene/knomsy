{div, span, h3, h4, button, i, ul, li, p, textarea, input} = React.DOM

@UserProfile_Content_Experience_View = React.createFactory React.createClass
  propTypes: 
    user:   React.PropTypes.object.isRequired,
    onEdit: React.PropTypes.func.isRequired

  render: ->
    (span null,
      (button className: 'title__btn_edit edit-body__btn-group_in-title btn btn-link', type: "button", onClick: @props.onEdit,
        (i className: 'button__icon fa fa-pencil')
        (span null, 'Edit'))

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
                  (ul className: 'form__list_inline form__list_inline-center'))

                (div className: 'col-md-4',
                  (p className: 'form__title form__title_center', 'Currency')
                  (ul className: 'form__list_inline form__list_inline-center'))

                (div className: 'col-md-4',
                  (p className: 'form__title form__title_center', 'Countries')
                  (ul className: 'form__list_inline form__list_inline-center'))))))))
