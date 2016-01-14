#= require_directory ./../../mixins

{div, span, h4, button, i, p, textarea, input, label, a, img} = React.DOM

@CompanyProfile_Content_Media_Edit = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, CompanyProfile_BaseFormMixin]
  
  getInitialState: ->
    @props.company.media || {}
      
  onCancel: ->
    @props.onCancel(@state.company)
    
  saveProfile: ->
    resp = @props.saveProfile company: {media_attributes: [@state]}
    if resp.errors
      @setState errors: resp.errors
    else
      @props.onCancel(resp)
    
  render: ->
    (span null,
      (div className: 'edit-body__btn-group edit-body__btn-group_in-title',
        (button className: 'btn-group__item_left btn_link btn btn-link', type: 'button', onClick: @onCancel, 'Cancel'))
        
      (div className: "section__body section__body_edit",
        @_form() ))
  
  _form: ->
    (div className: "edit-body",
      (div className: "edit-body__form",
        (h4 null, 'Product Description')
        (textarea className: 'form__textarea form-control', rows: 4, valueLink: @linkState('description')))
      
      (div className: "edit-body__btn-group edit-body__btn-group_right",
        (button type: "button", className: "btn-group__item_left btn_link btn btn-link",     onClick: @onCancel, 'Cancel')
        (button type: "button", className: "btn-group__item_right btn_save btn btn-success", onClick: @saveProfile, 'Save') ))
