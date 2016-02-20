#= require_directory ./../mixins
#= require_directory ./../../mixins

{h3, input, button, div, span, h4, label, img, p, i, textarea} = React.DOM

@CompanyProfile_Header_Form = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, CompanyProfile_BaseFormMixin, 
    ReactDatepickerMixin, ReactFileinputMixin, AutocompleteMixin, TokenizedAutocompleteMixin]
  
  getInitialState: ->
    _.omit @props.company, 'description', 'role_list'

  saveProfile: ->
    params = company: @state
    delete params.company.coverPreviewEncoded
    delete params.company.logoPreviewEncoded

    # processData: false, # Don't process the files
    # contentType: false, # Set content type to false as jQuery will tell the server its a query string request
    resp = @props.saveProfile Object.toFormData(params), {processData: false, contentType: false}
    if resp.errors
      @setState errors: resp.errors
    else
      @props.onCancel(resp)
      
  onCancel: ->
    @props.onCancel()
      
  componentDidMount: (prevProps, prevState) ->
    @datepicker   'founded_on'
    @fileinput    'logo'
    @fileinput    'cover'
    @react_autocomplete 'country_name', 'country_id', url: Routes.countries_data_path(format: 'json', query: 'QUERY')
    @react_tokenized_remote_autocomplete 'category_list', url: Routes.categories_data_path(format: 'json', query: 'QUERY')

  render: ->
    errors = if @state.errors
      (div className: 'alert alert-danger', dangerouslySetInnerHTML: {__html: @state.errors.join('<br />')})
      
    (div className: "profile-card__header_edit",
      (div className: "profile-card__column_border-bottom",
        (div className: "container-fluid",
          
          errors
          
          (div className: "col-xs-12 col-md-7 profile-card__column_border-right",
            (div className: "row",
              (div className: "col-xs-12 col-md-6",
                (div className: "form-group",
                  (h4 className: "text-left", 'Logo')
                  @_get_logo() )

                (div className: "form-group",
                  (label className: "input__title", 'Company Name'),
                  (input type: "text", valueLink: @linkState('name'), className: "form-control"))
                (div className: "form-group",
                  (label className: "input__title", 'High concept pitch')
                  (p style: {display: 'none'}, className: "textarea__subtext pull-right", '25 characters left')
                  (textarea valueLink: @linkState('short_desc'), rows: 4, placeholder: "Sexy toys go modern and mainstream", className: "form-control"))
                (div className: "form-group",
                  (label className: "input__title", 'Founded date')
                  (input type: "text", valueLink: @linkState('founded_on'), ref: 'founded_on', className: "form-control")))

              (div className: "col-xs-12 col-md-6",
                (div className: "form-group",
                  (h4 className: "text-left", 'Cover')
                  @_get_cover() )

                (div className: "form-group",
                  (label className: "input__title", 'Market')
                  (input type: "text", valueLink: @linkState('market'), className: "form-control"))

                (div className: "form-group",
                  (label className: "input__title", 'Category')
                  (div className: "form__input max-height",
                    (textarea ref: 'category_list', defaultValue: @state.category_list, rows: 1, className: "form-control")
                  ))
                  
                (div className: "form-group",
                  (label className: "input__title", 'Country')
                  (input type: "text", ref: 'country_name', defaultValue: @state.country_name, className: 'form-control', placeholder: "e.g. United States"))

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
        (button type: "button", className: "btn_link btn btn-link",    onClick: @onCancel, 'Cancel')))
        
  _get_logo: ->
    src = @state.logoPreviewEncoded || @state.logo_url

    if _.isBlank(src)
      (span className: 'upload_actions',
        (span style: {fontSize: 30}, className: "input__photo input__photo_circle fa fa-user")
        (input type: "file", ref: 'logo', className: 'file-loading'))
    else
      (span className: 'upload_actions',
        (img className: "input__photo input__photo_square", src: src)
        (input type: "file", ref: 'logo', className: 'file-loading')
        (button className: "btn_link btn btn-link", type: "button", onClick: @fileclear.bind(this, 'logo'), 'Remove'))
        
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
