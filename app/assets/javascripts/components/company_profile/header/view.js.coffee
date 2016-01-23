{div, span, a, h4, p, i, img, button, br, ul, li} = React.DOM

@CompanyProfile_Header_View = React.createFactory React.createClass
  propTypes: 
    company: React.PropTypes.object.isRequired,
    onEdit:  React.PropTypes.func.isRequired
    
  _get_logo: ->
    if _.isBlank(@props.company.logo_url)
      (i className: "header__pic media-object fa fa-user")
    else
      (img className: "input__photo_square", src: @props.company.logo_url)
    
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
      
  _get_link: (prop)->
    return if _.isBlank(@props.company[prop])

    icon = switch prop
      when 'gplay_link'    then 'fa fa-google'
      when 'itunes_link'   then 'fa fa-apple'
      when 'dribbble_link' then 'fa fa-dribbble'
      when 'fb_link'       then 'fa fa-facebook'
      when 'gh_link'       then 'fa fa-git'
      when 'gplus_link'    then 'fa fa-google-plus'
      when 'linkedin_link' then 'fa fa-linkedin'
      when 'twitter_link'  then 'fa fa-twitter'
      when 'youtube_link'  then 'fa fa-youtube'
      when 'website'       then 'item__website-icon fa fa-globe'
    
    extras = if prop == 'website'
      (span null, @props.company[prop])
      
    (li className: 'contacts__links_item',
      (a target: '_blank', href: @props.company[prop],
        (i className: icon)
        extras))
    
  render: ->
    header_styles = unless _.isBlank(@props.company.cover_url)
      {backgroundImage: "url(#{@props.company.cover_url})"}
      
    editBtn = if @props.canEditCompany
      (div className: "header__edit",
        (button type: "button", className: "btn_edit btn btn-primary", onClick: @props.onEdit,
          (i className: "fa fa-pencil")
          (span null, 'Edit')))
    
    (div className: "profile-card__header", style: header_styles,
      (div className: "container",
        (div className: "col-md-6",
          (div className: "media",
            (div className: "media-left",
              (a null,
                @_get_logo() ))

            (div className: "info__body media-body text-left",
              (h4 className: "info__name media-heading", 
                @props.company.name
                @_get_founded()
              )
              @_get_description()
              @_get_category()
              @_get_location()
              editBtn)))

        (div className: "col-xs-12 col-md-6 header__contacts",
          (div className: "row contacts__indices",
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
              (span className: "following__title", 'Following') ))

          (div className: "row contacts__links",
            (ul null,
              @_get_link('website')
              @_get_link('twitter_link')
              @_get_link('fb_link')
              @_get_link('linkedin_link')
              @_get_link('gplay_link')
              @_get_link('itunes_link')
              @_get_link('dribbble_link')
              @_get_link('gh_link')
              @_get_link('gplus_link')
              @_get_link('youtube_link') )))

        (div className: "clearfix")))
