{div, span, a, h4, p, i, button, br, ul, li} = React.DOM

@CompanyProfile_Header_View = React.createFactory React.createClass
  propTypes: 
    company: React.PropTypes.object.isRequired,
    onEdit:  React.PropTypes.func.isRequired
    
  _get_location: ->
    if !_.isBlank(@props.company.city) || !_.isBlank(@props.company.country)
      (p className: "info__location",
        (i className: "fa fa-map-marker")
        (span null, [@props.company.country, @props.company.city].join(', ')))

  _get_founded: ->
    if !_.isBlank(@props.company.founded_on)
      (span className: 'info__founded', "Founded: #{@props.company.founded_on}")
    
  _get_description: ->
    if !_.isBlank(@props.company.short_desc)
      (p className: "info__description", @props.company.short_desc)
      
  _get_category: ->
    if !_.isBlank(@props.company.category)
      (p className: "info__description", @props.company.category)
      
  _get_website: ->
    unless _.isBlank(@props.company.website)
      (li className: 'contacts__links_item',
        (a target: '_blank', href: @props.company.website,
          (i className: 'item__website-icon fa fa-globe')
          (span null, @props.company.website)))

  _get_twitter: ->
    unless _.isBlank(@props.company.twitter_link)
      (li className: 'contacts__links_item',
        (a target: '_blank', href: @props.company.twitter_link,
          (i className: 'fa fa-twitter')))
          
  _get_fb_link: ->
    unless _.isBlank(@props.company.fb_link)
      (li className: 'contacts__links_item',
        (a target: '_blank', href: @props.company.fb_link,
          (i className: 'fa fa-facebook')))
          
  _get_linked_in: ->
    unless _.isBlank(@props.company.linkedin_link)
      (li className: 'contacts__links_item',
        (a target: '_blank', href: @props.company.linkedin_link,
          (i className: 'fa fa-linkedin')))
    
  render: ->
    header_styles = unless _.isBlank(@props.company.cover_url)
      {backgroundImage: "url(#{@props.company.cover_url})"}
    
    (div className: "profile-card__header", style: header_styles,
      (div className: "container",
        (div className: "col-md-8",
          (div className: "media",
            (div className: "media-left",
              (a null,
                (i className: "header__pic media-object fa fa-user")))

            (div className: "info__body media-body text-left",
              (h4 className: "info__name media-heading", 
                @props.company.name
                @_get_founded() )
              @_get_description()
              @_get_category()
              @_get_location()

              (div className: "header__edit",
                (button type: "button", className: "btn_edit btn btn-primary", onClick: @props.onEdit,
                  (i className: "fa fa-pencil")
                  (span null, 'Edit'))))))

        (div className: "col-xs-12 col-md-4 header__contacts",
          (div className: "row",
            (div className: "col-xs-4 col-sm-4 col-md-4 contacts__rating",
              (span className: "rating__value", @props.company.rating)
              (div className: "rating__trend",
                (i className: "trend__icon fa fa-arrow-circle-up")
                (span className: "trend__value", "#{@props.company.trend}%")))

            (div className: "col-xs-4 col-sm-4 col-md-4 contacts__followers",
              (span className: "followers__value", @props.company.followers_count)
              (br null)
              (span className: "followers__title", 'Followers'))

            (div className: "col-xs-4 col-sm-4 col-md-4 contacts__following",
              (span className: "following__value", @props.company.followings_count)
              (br null)
              (span className: "following__title", 'Following'))

            (div className: "clearfix")
            (ul className: "contacts__links",
              @_get_website()
              @_get_twitter()
              @_get_fb_link()
              @_get_linked_in() )))

        (div className: "clearfix")))
