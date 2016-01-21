{div, h3, h4, img, a, p, span} = React.DOM

@UserProfile_Content_References = React.createFactory React.createClass
  render: ->
    references = _.map @props.user.references, (ref, i)->
      (div className: "view-body", key: "ref_#{i}",
        (div className: "view-body__media media",
          (div className: "media-left",
            (a null, 
              (img className: "media__img media-object", src: ref.user_image_url)))

          (div className: "media-body",
            (h4 className: "media__title media-heading", ref.company_name)
            (p className: "media__text", ref.description)
            (p className: "media__name", ref.user_name)
            (span className: "media__text", 'says:')))

        (div className: "view-body_references",
          (div className: "view-body__quotes_open")
          (p null, ref.content)
          (div className: "view-body__quotes_close")))
      
    (div className: "content__section",
      (h3 className: "section__title", 'References')
      (div className: "section__body section__body_view",
        references))