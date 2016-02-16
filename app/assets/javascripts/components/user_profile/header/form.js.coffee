{h3, input, button, div, span, h4, label, img, p, textarea} = React.DOM

@UserProfile_Header_Form = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, ReactFileinputMixin, AutocompleteMixin]
  
  propTypes: 
    user:        React.PropTypes.object.isRequired,
    saveProfile: React.PropTypes.func.isRequired,
    onClose:     React.PropTypes.func.isRequired
  
  getInitialState: ->
    _.omit @props.user, 'about', 'what_do', 'role_list', 'skill_list', 'service_list'
    
  componentDidMount: (prevProps, prevState) ->
    @fileinput 'avatar'
    @fileinput 'cover'
    @react_autocomplete 'country_name',  'country_id',  url: Routes.countries_data_path(format: 'json', query: 'QUERY')
    
  saveProfile: ->
    params = user: @state
    delete params.user.coverPreviewEncoded
    delete params.user.avatarPreviewEncoded
    
    # processData: false, # Don't process the files
    # contentType: false, # Set content type to false as jQuery will tell the server its a query string request
    resp = @props.saveProfile Object.toFormData(params), {processData: false, contentType: false}
    if resp.errors
      @setState errors: resp.errors
    else
      @props.onClose(resp)
    
  cancel: ->
    @props.onClose()
    
  _get_avatar: ->
    src = @state.avatarPreviewEncoded || @state.avatar_url
    
    if _.isBlank(src)
      (span className: 'upload_actions',
        (span style: {fontSize: 30}, className: "input__photo input__photo_circle fa fa-user")
        (input type: "file", ref: 'avatar', className: 'file-loading'))
    else
      (span className: 'upload_actions',
        (img className: "input__photo input__photo_square", src: src)
        (input type: "file", ref: 'avatar', className: 'file-loading')
        (button className: "btn_link btn btn-link", type: "button", onClick: @fileclear.bind(this, 'avatar'), 'Remove'))
        
  _get_cover: ->
    src = @state.coverPreviewEncoded || @state.cover_url
    
    if _.isBlank(src)
      (span className: 'upload_actions',
        (span style: {fontSize: 30}, className: "input__photo input__photo_circle fa fa-user")
        (input type: "file", ref: 'cover', className: 'file-loading'))
    else
      (span className: 'upload_actions',
        (img className: "input__photo input__photo_square", src: src)
        (input type: "file", ref: 'cover', className: 'file-loading')
        (button className: "btn_link btn btn-link", type: "button", onClick: @fileclear.bind(this, 'cover'), 'Remove'))
  
  render: ->
    errors = if @state.errors
      (div className: 'alert alert-danger', dangerouslySetInnerHTML: {__html: @state.errors.join('<br />')})
      
    (div className: "profile-card__header_edit",
      (div className: "profile-card__column_border-bottom",
        (div className: "container-fluid",
          
          (errors)
          
          (div className: "col-xs-12 col-md-7 profile-card__column_border-right",
            (div className: "row",
              (div className: "col-xs-12 col-md-6",
                (div className: "form-group",
                  (h4 className: "text-left", 'Photo')
                  @_get_avatar() )

                (div className: "form-group",
                  (label className: "input__title", 'First Name'),
                  (input type: "text", valueLink: @linkState('first_name'), placeholder: "e.g. Artur", className: "form-control"))
                (div className: "form-group",
                  (label className: "input__title", 'Last Name')
                  (input type: "text", valueLink: @linkState('last_name'), placeholder: "e.g. King", className: "form-control"))
                (div className: "form-group",
                  (label className: "input__title", 'Country')
                  (input type: "text", ref: 'country_name', defaultValue: @state.country_name, placeholder: "e.g. USA", className: "form-control"))
                (div className: "input",
                  (label className: "input__title", 'Town')
                  (input type: "text", valueLink: @linkState('city'), placeholder: "e.g. San-Francisco", className: "form-control")))

              (div className: "col-xs-12 col-md-6",
                (div className: "form-group",
                  (h4 className: "text-left", 'Cover')
                  @_get_cover() )

                (div className: "form-group",
                  (label className: "input__title", 'User Name')
                  (input type: "text", valueLink: @linkState('username'), placeholder: "e.g. ArturKing", className: "form-control"))

                (div className: "form-group",
                  (label className: "input__title", 'Mini resume')
                  (p style: {display: 'none'}, className: "textarea__subtext pull-right", '25 characters left')
                  (textarea valueLink: @linkState('short_resume'), rows: 4, placeholder: "Your positions, projects and companies, e.g: Founder at Facebook", className: "input__textarea form-control" )))))

          (div className: "col-xs-12 col-md-5",
            (h3 className: "input__main-title", 'Social Networks & Website')
            (div className: "row",
              (div className: "col-md-6",
                (div className: "input",
                  (input type: "text", valueLink: @linkState('gplay_link'),   placeholder: "Google Play link", className: "input__link input__link_play-market form-control"))
                (div className: "input",
                  (input type: "text", valueLink: @linkState('itunes_link'),   placeholder: "iTunes link", className: "input__link input__link_itunes form-control"))
                (div className: "input",
                  (input type: "text", valueLink: @linkState('dribbble_link'), placeholder: "Dribbble link", className: "input__link input__link_dribbble form-control"))
                (div className: "input",
                  (input type: "text", valueLink: @linkState('fb_link'), placeholder: "Facebook link", className: "input__link input__link_facebook form-control"))
                (div className: "input",
                  (input type: "text", valueLink: @linkState('gh_link'), placeholder: "GitHub link", className: "input__link input__link_github form-control")))

              (div className: "col-md-6",
                (div className: "input",
                  (input type: "text", valueLink: @linkState('gplus_link'),    placeholder: "Google+ link", className: "input__link input__link_google form-control"))
                (div className: "input",
                  (input type: "text", valueLink: @linkState('linkedin_link'), placeholder: "LinkedIn link", className: "input__link input__link_linkedin form-control"))
                (div className: "input",
                  (input type: "text", valueLink: @linkState('twitter_link'),  placeholder: "Twitter link", className: "input__link input__link_twitter form-control"))
                (div className: "input",
                  (input type: "text", valueLink: @linkState('youtube_link'),  placeholder: "YouTube link", className: "input__link input__link_youtube form-control"))
                (div className: "input",
                  (input type: "text", valueLink: @linkState('website'),       placeholder: "Website link", className: "input__link input__link_website form-control")))))))

      (div className: "edit-body__btn-group edit-body__btn-group_center",
        (button type: "button", className: "btn_save btn btn-success", onClick: @saveProfile, 'Save')
        (button type: "button", className: "btn_link btn btn-link",    onClick: @cancel, 'Cancel')))