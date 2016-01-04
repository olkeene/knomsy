#= require_directory ./../../mixins

{div, span, h4, button, i, p, textarea, input, label, a, img} = React.DOM

@CompanyProfile_Content_People_Edit = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, CompanyProfile_BaseFormMixin]
  
  getInitialState: ->
    form: false
    company: @props.company
      
  # onEdit: (e)->
  #   experience_id = $(e.target).data('experience_id')
  #   experience    = @props.user.experiences.find (exp) ->
  #     exp.id == experience_id
  # 
  #   @setState form: true, experience: experience
    
  onFormCancel: (company)->
    options = form: false
    options.company = company if company
    
    @setState options
    
  onNew: ->
    @setState form: true
  
  _peopleListing: (gropedPeople)->
    
  _renderPeople: ->
    return if _.isEmpty(@state.company.members)
    
    grouped = _.groupBy @state.company.members, (exp)-> exp.humanized_role
    
    (div className: "edit-body__form",
      @_peopleListing(grouped))

  _newBtn_or_form: ->
    if @state.form
      CompanyProfile_Content_People_Form(member: @state.member, saveProfile: @props.saveProfile, onCancel: @onFormCancel)
    else
      (button type: "button", className: "btn_add-work btn btn-primary", onClick: @onNew,
        (i className: "button__icon fa fa-plus-circle")
        (span null, 'Add New'))

  render: ->
    (span null,
      (div className: 'edit-body__btn-group edit-body__btn-group_in-title',
        (button className: 'btn-group__item_left btn_link btn btn-link', type: 'button', onClick: @onCancel, 'Cancel'))
        
      (div className: "section__body section__body_edit",
        (div className: "edit-body",
          (div className: "edit-body__btn-group edit-body__btn-group_left",
            @_newBtn_or_form() )
          @_renderPeople()
        )))
