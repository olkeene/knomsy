#= require_directory ./../../mixins

{div, span, p, i, h4, button, img, a} = React.DOM

@CompanyProfile_Content_Media_View = React.createFactory React.createClass
  mixins: [CompanyProfile_BaseViewMixin]

  _renderEmpty: ->
    (div className: 'section__body section__body_empty',
      (div className: 'empty-body',
        (div className: 'body__layout',
          (i className: 'empty-body__icon fa  fa-play-circle-o')
          (h4 className: 'empty-body__text', 'Your media is empty now')
          (p className: 'empty-body__comment', 'You can use "Edit" button to add images and videous')
          (button className: 'btn_edit btn btn-primary', type: 'button', onClick: @props.onEdit, 'Edit')))
        
      (div className: 'empty-body__gallery',
        (a href: '#',
          (i className: 'gallery__controller fa fa-chevron-left'))
          
        (div className: 'gallery__item gallery__item_empty')
        (div className: 'gallery__item gallery__item_empty')
        (div className: 'gallery__item gallery__item_empty')
          
        (a href: '#',
          (i className: 'gallery__controller fa fa-chevron-right'))
      ))
        
  _renderListings: ->
    content = (div className: 'section__body section__body_empty',
      (div className: 'empty-body',
        (div className: 'body__layout',
          (h4 className: 'empty-body__text', 'Media object')
        ))
      
      (div className: 'empty-body',
        (p className: 'empty-body__comment', 'Long description....')
      )
      
      (div className: 'empty-body__gallery',
        (a href: '#',
          (i className: 'gallery__controller fa fa-chevron-left'))
          
        (div className: 'gallery__item gallery__item_empty')
        (div className: 'gallery__item gallery__item_empty')
        (div className: 'gallery__item gallery__item_empty')
          
        (a href: '#',
          (i className: 'gallery__controller fa fa-chevron-right'))
      ))
      
    (span null,
      (button className: 'title__btn_edit edit-body__btn-group_in-title btn btn-link', type: "button", onClick: @props.onEdit,
        (i className: 'button__icon fa fa-pencil')
        (span null, 'Edit'))
        
      (div className: 'section__body section__body_view',
        (div className: "view-body",
          (div className: "view-body__form row",
            (div className: "col-md-12", content)))
      )
    )

  render: ->
    if false#_.isEmpty(@props.company.media)
      @_renderEmpty()
    else
      @_renderListings()
