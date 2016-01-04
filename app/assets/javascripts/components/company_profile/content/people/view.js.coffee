#= require_directory ./../../mixins

{div, span, p, i, h4, button, img} = React.DOM

@CompanyProfile_Content_People_View = React.createFactory React.createClass
  mixins: [CompanyProfile_BaseViewMixin]

  _renderEmpty: ->
    (div className: 'section__body section__body_empty',
      (div className: 'empty-body',
        (i className: 'empty-body__icon fa fa-users')
        (h4 className: 'empty-body__text', 'Your team is empty now')
        (p className: 'empty-body__comment', 'You can use "Edit" button to fill it')
        (button className: 'btn_edit btn btn-primary', type: 'button', onClick: @props.onEdit, 'Edit')))
        
  _renderListings: ->
    return if _.isEmpty(@props.company.members)
    
    grouped = _.groupBy @props.company.members, (exp)-> exp.humanized_role
    out = []

    out.push _.map grouped, (arr, group_name)=>
      members = _.map arr, (el)=>
        (div className: "company__member", key: "member_#{el.id}",
          (img className: 'company__member_photo', src: el.avatar_url)
          (h4 className: "company__name media-heading", el.name)
          (p className: "company__position", el.title))
              
      (div key: group_name,
        (h4 className: "form__title", group_name)
        (div className: "form__objects",
          members))

    (span null,
      (button className: 'title__btn_edit edit-body__btn-group_in-title btn btn-link', type: "button", onClick: @props.onEdit,
        (i className: 'button__icon fa fa-pencil')
        (span null, 'Edit'))
        
      (div className: 'section__body section__body_view',
        (div className: "view-body",
          (div className: "view-body__form row",
            (div className: "col-md-12", out)))
      )
    )

  render: ->
    if _.isEmpty(@props.company.members)
      @_renderEmpty()
    else
      @_renderListings()
