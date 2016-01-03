#= require_directory ./../mixins
#= require_directory ./../../mixins

{h3, input, button, div, span, label, img, p, textarea} = React.DOM

@CompanyProfile_Header_Form = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, CompanyProfile_FormBaseMixin, ReactDatepickerMixin]
  
  saveProfile: ->
    resp = @props.saveProfile company: @state
    if resp.errors
      @setState errors: resp.errors
    else
      @props.onClose(resp)
      
  componentDidMount: (prevProps, prevState) ->
    @datepicker 'founded_on'
    
  _get_logo: ->
    if _.isBlank(@state.logo_url)
      (span style: {fontSize: 30}, className: "input__photo input__photo_circle fa fa-user")
    else
      (img className: "input__photo input__photo_square", src: @state.logo_url)
    
  _get_cover: ->
    if _.isBlank(@state.cover_url)
      (span style: {fontSize: 30}, className: "input__photo input__photo_circle fa fa-user")
    else
      (img className: "input__photo input__photo_square", src: @state.cover_url)
    
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
                  (label className: "input__title", 'Logo')
                  @_get_logo()
                  (button type: "button", className: "btn_grey btn btn-primary", 'Upload')
                  (button type: "button", className: "btn_link btn btn-link",    'Remove'))

                (div className: "form-group",
                  (label className: "input__title", 'Company Name'),
                  (input type: "text", valueLink: @linkState('name'), className: "form-control"))
                (div className: "form-group",
                  (label className: "input__title", 'High concept pitch')
                  (p style: {display: 'none'}, className: "textarea__subtext pull-right", '25 characters left')
                  (textarea valueLink: @linkState('description'), rows: 4, placeholder: "Sexy toys go modern and mainstream", className: "form-control"))
                (div className: "form-group",
                  (label className: "input__title", 'Founded date')
                  (input type: "text", valueLink: @linkState('founded_on'), ref: 'founded_on', className: "form-control")))

              (div className: "col-xs-12 col-md-6",
                (div className: "form-group",
                  (label className: "input__title", 'Cover')
                  @_get_cover()
                  (button type: "button", className: "btn_grey btn btn-primary", 'Upload')
                  (button type: "button", className: "btn_link btn btn-link",    'Remove'))

                (div className: "form-group",
                  (label className: "input__title", 'Market')
                  (input type: "text", valueLink: @linkState('market'), className: "form-control"))

                (div className: "form-group",
                  (label className: "input__title", 'Category')
                  (input type: "text", valueLink: @linkState('category'), className: "form-control"))
                  
                (div className: "form-group",
                  (label className: "input__title", 'Country')
                  (input type: "text", valueLink: @linkState('country'), placeholder: "e.g. USA", className: "form-control"))

                (div className: "input",
                  (label className: "input__title", 'Town')
                  (input type: "text", valueLink: @linkState('city'), placeholder: "e.g. San-Francisco", className: "form-control"))
              )))

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