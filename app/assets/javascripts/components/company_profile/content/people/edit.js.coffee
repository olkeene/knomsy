#= require_directory ./../../mixins

{div, span, h4, button, i, p, textarea, input, label, a, img} = React.DOM

@CompanyProfile_Content_People_Edit = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, CompanyProfile_BaseFormMixin]
  
  getInitialState: ->
    form: false
    company: @props.company
      
  onEdit: (member, e)->
    @setState form: true, member: member
    
  onFormCancel: (company)->
    options = form: false
    options.company = company if company
    
    @setState options
    
  onNew: ->
    @setState form: true, member: null
    
  onCancel: ->
    @props.onCancel(@state.company)
    
  _renderPeople: ->
    return if _.isEmpty(@state.company.members)
    
    grouped = _.groupBy @state.company.members, (exp)-> exp.humanized_role
    out = []

    out.push _.map grouped, (arr, group_name)=>
      members = _.map arr, (el)=>
        (div className: "company__member", key: "member_#{el.id}",
          (img className: 'company__member_photo', src: el.avatar_url)
          (h4 className: "company__name media-heading", 
            el.name
            (span className: 'company__name__edit', onClick: @onEdit.bind(this, el), "(Edit)")
          )
          (p className: "company__position", el.title)
        )
              
      (div key: group_name,
        (h4 className: "form__title", group_name)
        (div className: "form__objects",
          members))

    (div className: 'section__body section__body_view',
      (div className: "view-body",
        (div className: "view-body__form row",
          (div className: "col-md-12", out)))
    )

  _newBtnOrForm: ->
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
            @_newBtnOrForm() )
          @_renderPeople()
        )))
