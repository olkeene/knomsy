#= require_directory ./../../mixins

{div, span, h3, h4, button, i, ul, li, p, textarea, input} = React.DOM

@CompanyProfile_Content_Info_View = React.createFactory React.createClass
  mixins: [CompanyProfile_BaseViewMixin]

  _renderEmpty: ->
    (div className: 'section__body section__body_empty',
      (div className: 'empty-body',
        (i className: 'empty-body__icon fa fa-building-o')
        (h4 className: 'empty-body__text', 'Your description is empty now')
        (p className: 'empty-body__comment', 'You can use "Edit" button to fill it')
        (button className: 'btn_edit btn btn-primary', type: 'button', onClick: @props.onEdit, 'Edit')))
        
  _renderListings: ->
    tags = unless _.isEmpty(@props.company.tag_list)
      _.map @props.company.tag_list, (role, i)->
        (li className: "label__item label label-default", key: "tag_#{i}", role)
      
    (span null,
      (button className: 'title__btn_edit edit-body__btn-group_in-title btn btn-link', type: "button", onClick: @props.onEdit,
        (i className: 'button__icon fa fa-pencil')
        (span null, 'Edit'))

      (div className: 'section__body section__body_view',
        (div className: "view-body",
          (div className: "view-body__form row",
            (div className: "col-md-12",
              (div className: "form__group-objects",
                (p className: "form__text", @props.company.description)))

            (div className: "col-md-12",
              (div className: "form__group-objects",
                (ul className: "form__list_inline",
                  tags)))
          )
        )
      )
    )

  render: ->
    if _.isEmpty(@props.company.tag_list) && _.isEmpty(@props.company.description)
      @_renderEmpty()
    else
      @_renderListings()
