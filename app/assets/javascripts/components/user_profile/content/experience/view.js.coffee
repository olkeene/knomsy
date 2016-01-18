{div, span, h4, button, i, p, a, img} = React.DOM

@UserProfile_Content_Experience_View = React.createFactory React.createClass
  propTypes: 
    user: React.PropTypes.object.isRequired
    
  render: ->
    if _.isEmpty(@props.user.experiences)
      @renderEmpty()
    else
      @renderListings()
      
  renderEmpty: ->
    (div className: 'section__body section__body_empty',
      (div className: 'empty-body',
        (i className: 'empty-body__icon fa fa-building-o')
        (h4 className: 'empty-body__text', 'Your work experience is empty now')
        (p className: 'empty-body__comment', 'You can use "Edit" button to fill it')
        (button className: 'btn_edit btn btn-primary', type: 'button', onClick: @props.onEdit, 'Edit')))

  renderListings: ->
    grouped    = _.groupBy @props.user.experiences, (exp)-> exp.humanized_role
    educations = grouped['Education'] || []
    delete grouped['Education']
    
    (span null,
      (button className: 'title__btn_edit edit-body__btn-group_in-title btn btn-link', type: "button", onClick: @props.onEdit,
        (i className: 'button__icon fa fa-pencil')
        (span null, 'Edit'))

      (div className: "section__body section__body_edit",
        (div className: 'edit-body',
          (div className: 'edit-body__form',
            @renderExperiences(grouped)
            @renderEducations(educations)) )))
      
  renderExperiences: (grouped)->
    out = []

    out.push _.map grouped, (arr, group_name)=>
      inners = _.map arr, (el)=>
        (div className: "form__objects", key: "experience_#{el.id}",
          (div className: "row",
            (div className: "col-md-10",
              (div className: "objects__company media",
                (div className: "media-left",
                  (a null, 
                    (img src: "https://placehold.it/50x50", className: "company__image media-object")))
                (div className: "media-body",
                  (a null, 
                    (h4 className: "company__name media-heading", el.company_name))
                  (p className: "company__description", el.description)
                  (p className: "company__position", el.title)
                  (span className: "company__period", "#{el.started_at} - #{el.ended_at}"))))))
              
      (div key: group_name,
        (h4 className: "form__title", group_name)
        inners)

    out
    
  renderEducations: (arr)->
    return if _.isEmpty(arr)
    
    elements = _.map arr, (el) =>
      (div className: "form__objects", key: "experience_#{el.id}",
        (div className: "row",
          (div className: "col-md-10",
            (div className: "objects__university media",
              (div className: "media-body",
                (a null, 
                  (h4 className: "form__title form__title_nopadding media-heading", el.company_name))
                (span className: "title__subtext", "(#{el.description})")
                (p className: "university__degree", el.title)
                (span className: "university__period", "#{el.started_at} - #{el.ended_at}"))))))
    
    (div null,
      (h4 className: "form__title", 'Education')
      elements)
