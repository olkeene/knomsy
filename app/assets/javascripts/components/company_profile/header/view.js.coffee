{div, span, a, h4, p, i, img, button, br, ul, li} = React.DOM

@CompanyProfile_Header_View = React.createFactory React.createClass
  propTypes: 
    company: React.PropTypes.object.isRequired,
    onEdit:  React.PropTypes.func.isRequired
  
  getInitialState: ->
    surveyUp: false
    
  _get_logo: ->
    if _.isBlank(@props.company.logo_url)
      (i className: "header__pic media-object fa fa-user")
    else
      (img className: "input__photo_square", src: @props.company.logo_url)
    
  _get_location: ->
    if !_.isBlank(@props.company.location)
      (p className: "info__location",
        (i className: "fa fa-map-marker")
        (span null, @props.company.location))

  _get_founded: ->
    if !_.isBlank(@props.company.founded_on)
      (span className: 'info__founded', "Founded: #{@props.company.founded_on}")
    
  _get_description: ->
    if !_.isBlank(@props.company.short_desc)
      (p className: "info__description", @props.company.short_desc)
      
  _get_category: ->
    if !_.isEmpty(@props.company.category_list)
      (p className: "info__description", @props.company.category_list.join(', '))
      
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
    
  _rating_with_trend: -> 
    icon_class = if @props.company.rating_trend > 0
      'fa-arrow-circle-up'
    else
      'fa-arrow-circle-down'
    
    (span null, 
      (i className: "trend__icon fa #{icon_class}")
      (span className: "trend__value", "#{@props.company.rating_trend}%") )
  
  _canTookSurvey: ->
    gon.canTookSurvey
  
  _surveyBtn: ->
    return unless @_canTookSurvey()
    
    if @state.surveyUp
      (button type: "button", className: "btn_edit btn-finish btn btn-primary", 
      onClick: => @setState(surveyUp: false),
      'Finish')
    else
      (button type: "button", className: "btn_edit btn-rate btn btn-primary",   
      onClick: => @setState(surveyUp: true),
      'Rate Startup')
      
  _editBtn: ->
    if @props.canEditCompany
      (button type: "button", className: "btn_edit btn btn-primary", onClick: @props.onEdit,
        (i className: "fa fa-pencil")
        (span null, 'Edit'))
  
  _surveyWidget: ->
    return unless @state.surveyUp
    
    CompanyProfile_Survey(company: @props.company)
  
  render: ->
    header_styles = unless _.isBlank(@props.company.cover_url)
      {backgroundImage: "url(#{@props.company.cover_url})"}
    
    (span null, 
      @_surveyWidget()
      
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
                  @_get_founded() )
                @_get_description()
                @_get_category()
                @_get_location()
                
                (div className: "header__edit",
                  @_editBtn()
                  @_surveyBtn() )
          )))

          (div className: "col-xs-12 col-md-6 header__contacts",
            (div className: "row contacts__indices",
              (div className: "col-xs-4 col-sm-4 col-md-4 contacts__rating",
                (span className: "rating__value", @props.company.rating)
                (div className: "rating__trend", @_rating_with_trend() ))

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

          (div className: "clearfix")
      )))
