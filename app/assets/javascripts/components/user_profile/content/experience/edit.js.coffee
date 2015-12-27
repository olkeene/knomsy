{div, span, h4, button, i, p, textarea, input, label, a, img} = React.DOM

@UserProfile_Content_Experience_Edit = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin]
  
  propTypes: 
    user:        React.PropTypes.object.isRequired,
    saveProfile: React.PropTypes.func.isRequired,
    onCancel:    React.PropTypes.func.isRequired
    
  getInitialState: ->
    form: false
    user: @props.user
      
  onEditCancel: ->
    @props.onCancel()
  
  onEdit: (e)->
    experience_id = $(e.target).data('experience_id')
    experience    = @props.user.experiences.find (exp) ->
      exp.id == experience_id

    @setState form: true, experience: experience
    
  onFormCancel: (user)->
    options = form: false
    options.user = user if user
    
    @setState options
    
  onNew: ->
    @setState form: true
    
  renderExperiences: (grouped)->
    out = []

    out.push _.map grouped, (arr, group_name)=>
      inners = _.map arr, (el)=>
        (div className: "form__objects", key: "experience_#{el.id}",
          (div className: "row",
            (div className: "col-md-10",
              (div className: "objects__company media",
                (div className: "media-left",
                  (a null, 
                    (img src: "http://placehold.it/50x50", className: "company__image media-object")))
                (div className: "media-body",
                  (a null, 
                    (h4 className: "company__name media-heading", el.company_name))
                  (p className: "company__description", el.description)
                  (p className: "company__position", el.title)
                  (span className: "company__period", "#{el.started_at} - #{el.ended_at}"))))
            (div className: "col-md-2",
              (button type: "button", className: "btn_edit btn btn-primary", onClick: @onEdit, 'data-experience_id': el.id, 'Edit'))))
              
      (div key: group_name,
        (h4 className: "form__title", group_name)
        inners)

    out
    
  renderEducations: (arr)->
    return if _.isEmpty(arr)
    
    elements = _.map arr, (el) =>
      (div className: "form__objects", key: "experience_#{el.id}",
        (div className: "row",
          (div className: "col-md-10",
            (div className: "objects__university media",
              (div className: "media-body",
                (a null, 
                  (h4 className: "form__title form__title_nopadding media-heading", el.company_name))
                (span className: "title__subtext", "(#{el.description})")
                (p className: "university__degree", el.title)
                (span className: "university__period", "#{el.started_at} - #{el.ended_at}"))))

          (div className: "col-md-2",
            (button type: "button", className: "btn_edit btn btn-primary", onClick: @onEdit, 'data-experience_id': el.id, 'Edit'))))
    
    (div null,
      (h4 className: "form__title", 'Education')
      elements)
    
  innerContent: ->
    grouped    = _.groupBy @state.user.experiences, (exp)-> exp.humanized_role
    educations = grouped['Education'] || []
    delete grouped['education']
    
    (div className: "edit-body__form",
      @renderExperiences(grouped)
      @renderEducations(educations))

  render: ->
    # new button or the form
    topContent = if @state.form
      UserProfile_Content_Experience_Form(experience: @state.experience, saveProfile: @props.saveProfile, onCancel: @onFormCancel)
    else
      (button type: "button", className: "btn_add-work btn btn-primary", onClick: @onNew,
        (i className: "button__icon fa fa-plus-circle")
        (span null, 'Add New'))

    buttons = unless _.isEmpty(@props.user.experiences)
      (div className: "edit-body__btn-group edit-body__btn-group_right",
        (button type: "button", className: "btn-group__item_left btn_link btn btn-link", onClick: @onEditCancel, 'Cancel'))

    (span null,
      (div className: 'edit-body__btn-group edit-body__btn-group_in-title',
        (button className: 'btn-group__item_left btn_link btn btn-link', type: 'button', onClick: @onEditCancel, 'Cancel'))
        
      (div className: "section__body section__body_edit",
        (div className: "edit-body",
          (div className: "edit-body__btn-group edit-body__btn-group_left",
            (topContent))
            
          (@innerContent())

          (buttons))))
