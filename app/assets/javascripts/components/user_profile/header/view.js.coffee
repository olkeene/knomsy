{div, span, a, h4, p, i, button, br, ul, li, img} = React.DOM

@UserProfile_Header_View = React.createFactory React.createClass
  propTypes: 
    user: React.PropTypes.object.isRequired,
    onEdit: React.PropTypes.func.isRequired

  render: ->
    name = "#{@props.user.first_name} #{@props.user.last_name}"

    header_styles = unless _.isBlank(@props.user.cover_url)
      {backgroundImage: "url(#{@props.user.cover_url})"}
    
    (div className: "profile-card__header", style: header_styles,
      (div className: "container",
        (div className: "col-md-8",
          (div className: "media",
            (div className: "media-left",
              (a null, @_get_avatar() ))

            (div className: "info__body media-body text-left",
              (h4 className: "info__name media-heading", name)
              (p className: "info__profession")
              
              @_get_location()

              (div className: "header__edit",
                (button type: "button", className: "btn_edit btn btn-primary", onClick: @props.onEdit,
                  (i className: "fa fa-pencil")
                  (span null, 'Edit') )))))

        (div className: "col-xs-12 col-md-4 header__contacts",
          (div className: "row",
            (div className: "col-xs-4 col-sm-4 col-md-4 contacts__rating",
              (span className: "rating__value", @props.user.rating)
              (div className: "rating__trend",
                (i className: "trend__icon fa fa-arrow-circle-up")
                (span className: "trend__value", "#{@props.user.trend}%")))

            (div className: "col-xs-4 col-sm-4 col-md-4 contacts__followers",
              (span className: "followers__value", @props.user.followers_count)
              (br null)
              (span className: "followers__title", 'Followers'))

            (div className: "col-xs-4 col-sm-4 col-md-4 contacts__following",
              (span className: "following__value", @props.user.followings_count)
              (br null)
              (span className: "following__title", 'Following'))

            (div className: "clearfix")
            (ul className: "contacts__links",
              @_get_website()
              @_get_twitter()
              @_get_facebook()
              @_get_linked_in() )))

        (div className: "clearfix")))
        
  _get_avatar: ->
    if _.isBlank(@props.user.avatar_url)
      (i className: "header__pic media-object fa fa-user")
    else
      (img className: "input__photo_square", src: @props.user.avatar_url)
      
  _get_location: ->
    if !_.isBlank(@props.user.city) || !_.isBlank(@props.user.country)
      (p className: "info__location",
        (i className: "fa fa-map-marker")
        (span null, [@props.user.country, @props.user.city].join(', ')))
        
  # links
  _get_website: ->
    unless _.isBlank(@props.user.website)
      (li className: 'contacts__links_item',
        (a target: '_blank', href: @props.user.website,
          (i className: 'item__website-icon fa fa-globe')
          (span null, @props.user.website)))

  _get_twitter: ->
    unless _.isBlank(@props.user.twitter_link)
      (li className: 'contacts__links_item',
        (a target: '_blank', href: @props.user.twitter_link,
          (i className: 'fa fa-twitter')))

  _get_facebook: ->
    unless _.isBlank(@props.user.fb_link)
      (li className: 'contacts__links_item',
        (a target: '_blank', href: @props.user.fb_link,
          (i className: 'fa fa-facebook')))
          
  _get_linked_in: ->
    unless _.isBlank(@props.user.linkedin_link)
      (li className: 'contacts__links_item',
        (a target: '_blank', href: @props.user.linkedin_link,
          (i className: 'fa fa-linkedin')))
