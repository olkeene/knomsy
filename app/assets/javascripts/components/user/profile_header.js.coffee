{div, span, a, h4, p, i, button, br, ul} = React.DOM

@UserHeaderProfile = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin]
  
  getInitialState: ->
    gon.user
    
  render: ->
    header_styles = if @state.cover_url
      {backgroundImage: "url(#{@state.cover_url})"}
      
    location = if @state.location
      (p className: "user-info__location",
        (i className: "fa fa-map-marker")
        (span null, @state.location))
      
    (div className: "profile-card__header", style: header_styles,
      (div className: "container",
        (div className: "col-md-8",
          (div className: "media",
            (div className: "media-left",
              (a null,
                (i className: "header__userpic media-object fa fa-user")))

            (div className: "user-info__body media-body",
              (h4 className: "user-info__name media-heading", @state.name)
              (p className: "user-info__profession")
              
              (location)

              (div className: "header__edit",
                (button type: "button", className: "btn_edit btn btn-primary", onClick: @props.onEditPressed,
                  (i className: "fa fa-pencil")
                  (span null, 'Edit'))))))

        (div className: "col-xs-12 col-md-4 header__contacts",
          (div className: "row",
            (div className: "col-xs-4 col-sm-4 col-md-4 contacts__rating",
              (span className: "rating__value", @state.rating)
              (div className: "rating__trend",
                (i className: "trend__icon fa fa-arrow-circle-up")
                (span className: "trend__value", "#{@state.trend}%")))

            (div className: "col-xs-4 col-sm-4 col-md-4 contacts__followers",
              (span className: "followers__value", @state.followers_count)
              (br null)
              (span className: "followers__title", 'Followers'))

            (div className: "col-xs-4 col-sm-4 col-md-4 contacts__following",
              (span className: "following__value", @state.followings_count)
              (br null)
              (span className: "following__title", 'Following'))

            (div className: "clearfix")
            (ul className: "contacts__links")))

        (div className: "clearfix")))
