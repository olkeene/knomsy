#= require_directory ./../../../mixins

{div, span, h4, button, i, p, textarea, input, label, a, img, select, option} = React.DOM

@CompanyProfile_Content_Funding_Form = React.createFactory React.createClass
  mixins: [React.addons.LinkedStateMixin, ReactDatepickerMixin, ReactTokenizeInputMixin, ReactSwitchInputMixin]
  
  propTypes: 
    funding:     React.PropTypes.object,
    saveProfile: React.PropTypes.func.isRequired,
    onCancel:    React.PropTypes.func.isRequired

  getInitialState: ->
    @props.funding || {visible: true}
  
  componentDidMount: (prevProps, prevState) ->
    @datepicker     'funded_on'
    @tokenize_input 'investor_list'
    @switch_input   'visible'
    
  saveProfile: ->
    resp = @props.saveProfile company: {fundings_attributes: [@state]}
    if resp.errors
      @setState errors: resp.errors
    else
      @props.onCancel(resp)
      
  onCancel: ->
    @props.onCancel()
    
  onDelete: ->
    @setState '_destroy': '1', @saveProfile
    
  render: ->
    errors = if @state.errors
      (div className: 'alert alert-danger', dangerouslySetInnerHTML: {__html: @state.errors.join('<br />')})
    
    roundOptions = _.map gon.fundingRounds, (hash)->
      (option value: hash.value, key: "round_#{hash.value}", hash.name)
    # with blank
    roundOptions.unshift(option value: '', key: "type_select_", '')
    
    deleteBtn = if @state.id
      (button type: "button", className: "btn-group__item btn_grey btn btn-primary", onClick: @onDelete, 'Delete')

    (span null,
      (div className: 'edit-body__btn-group edit-body__btn-group_in-title',
        (button className: 'btn-group__item_left btn_link btn btn-link', type: 'button', onClick: @onCancel, 'Cancel'))
        
      (div className: "section__body section__body_edit",
        (div className: "edit-body",
          errors
  
          (div className: "edit-body__form",
            (h4 className: "form__title", 'Add Round')
            (div className: "form__input-group",
            
              (div className: "row",
                (div className: "col-md-3",
                  (div className: "input",
                    (h4 className: "input__title", 'Date')
                    (input type: "text", ref: 'funded_on', className: "form-control", valueLink: @linkState('funded_on'))))
                
                (div className: "col-md-3",
                  (div className: "input",
                    (h4 className: "input__title", 'Round')
                    (select className: "form-control", valueLink: @linkState('round'),
                      roundOptions
                    )))
                
                (div className: "col-md-3",
                  (div className: "input",
                    (h4 className: "input__title", 'Investment')
                    (input type: "text", placeholder: "100,000,000", className: "form-control", valueLink: @linkState('amount'))))
                
                (div className: "col-md-3",
                  (div className: "input",
                    (h4 className: "input__title", 'Proof News Link')
                    (input type: "text", placeholder: "http://techcrunch.com", className: "form-control", valueLink: @linkState('link'))
                  )))
                
              (div className: "row",
                (div className: "col-md-7",
                  (div className: "input max-height",
                    (h4 className: "input__title", 'Investors')
                    (input type: "text", ref: 'investor_list', className: "form-control", valueLink: @linkState('investor_list')) ))
                (div className: "col-md-5",
                  (div className: "input",
                    (h4 className: "input__title", dangerouslySetInnerHTML: {__html: '&nbsp;'})
                    (input type: 'checkbox', ref: 'visible', defaultChecked: @state.visible)
                    (span null, ' Visible for users'))
                )
              ))

            (div className: "edit-body__btn-group edit-body__btn-group_left",
              (button type: "button", className: "btn-group__item btn_save btn btn-success", onClick: @saveProfile, 'Save')
              (button type: "button", className: "btn-group__item btn_grey btn btn-primary", onClick: @onCancel, 'Cancel')
              deleteBtn
            )
          )
        )
      )
    )
