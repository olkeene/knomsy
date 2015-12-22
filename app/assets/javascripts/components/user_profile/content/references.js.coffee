{div, h3, h4, img, a, p, span} = React.DOM

@UserProfile_Content_References = React.createFactory React.createClass
  render: ->
    references = _.map [1, 2], (ref, i)->
      (div className: "view-body", key: "ref_#{i}",
        (div className: "view-body__media media",
          (div className: "media-left",
            (a null, 
              (img className: "media__img media-object", src: 'http://placehold.it/50x50')))

          (div className: "media-body",
            (h4 className: "media__title media-heading", 'Knomsy')
            (p className: "media__text", 'Startup eco system')
            (p className: "media__name", 'Denis Kozminikh')
            (span className: "media__text", 'says:')))

        (div className: "view-body_references",
          (div className: "view-body__quotes_open")
          (p null, 'content.....')
          (div className: "view-body__quotes_close")))
      
    (div className: "content__section",
      (h3 className: "section__title", 'References')
      (div className: "section__body section__body_view",
        (references)))