{div, span, button, i, h4, img, p, a} = React.DOM

@CompanyProfile_Content_Funding_View = React.createFactory React.createClass
  propTypes: 
    company:     React.PropTypes.object.isRequired
    saveProfile: React.PropTypes.func.isRequired
    
  getInitialState: ->
    company: @props.company
  
  render: ->
    if @state.funding || @state.new
      CompanyProfile_Content_Funding_Form(funding: @state.funding, saveProfile: @props.saveProfile, onCancel: @_onFormCancel)
    else if @state.edit_mode
      @_renderListings()
    else if _.isEmpty(@state.company.fundings)
      @_renderEmpty()
    else
      @_renderListings()
      
  _onNewFunding: ->
    @setState new: true
      
  _onEditFunding: (object, event)->
    @setState funding: object
  
  _onFormCancel: (company)->
    options = form: false, funding: null, new: null
    options.company = company if company

    @setState(options)
    
  _onEdit: ->
    @setState edit_mode: true
    
  _onCancel: ->
    @setState edit_mode: false

  _renderEmpty: ->
    editContent = if @props.canEditCompany
      (span null,
        (p className: 'empty-body__comment', 'You can use "Edit" button to fill it')
        (button className: 'btn_edit btn btn-primary', type: 'button', onClick: @_onEdit, 'Edit'))
      
    (div className: 'section__body section__body_empty',
      (div className: 'empty-body',
        (i className: 'empty-body__icon fa fa-usd')
        (h4 className: 'empty-body__text', 'Your fundings are empty now')
        editContent))

  _editCancelBtn: ->
    content = if @state.edit_mode
      (button className: 'btn_link btn btn-link', type: 'button', onClick: @_onCancel, 'Cancel')
    else
      (button className: 'btn btn-link', type: "button", onClick: @_onEdit,
        (i className: 'button__icon fa fa-pencil')
        (span null, 'Edit'))
        
    (span className: 'title__btn_edit edit-body__btn-group_in-title', content)
    
  _newBtn: ->
    if @state.edit_mode && @props.canEditCompany
      (div className: "col-xs-12 col-sm-12 col-md-12 col-lg-12",
        (button type: "button", className: "btn btn-primary", onClick: @_onNewFunding,
          (i className: "button__icon fa fa-plus-circle")
          (span null, 'Add New') ))
        
  _renderListings: ->
    editCancelBtn = if @props.canEditCompany
      @_editCancelBtn()
        
    (span null,
      editCancelBtn

      (div className: 'section__body section__body_view funding_view',
        (div className: "view-body",
          (div className: "view-body__form row",
            (div className: "edit-body__btn-group edit-body__btn-group_left",
              @_newBtn()
              @_fundings()
            )))))
          
  _parse_hostname: (url)->
    parser = document.createElement('a')
    parser.href = url
    parser.hostname
    
  _fundings: ->
    _.map @state.company.fundings, (el)=>
      investors = _.map el.investor_list.split(','), (inv, i)=>
        (div key: "investor_#{@state.company.id}_#{i}", inv)
        
      proofLink = if _.isEmpty(el.link)
          (span className: 'links__not_confirmed', 'Not confirmed by press')
        else
          (span null,
            (div className: 'company__name', el.link_desc)
            (a href: el.link, _target: 'blank', className: 'text-uppercase', @_parse_hostname(el.link)))
        
      editBtn = if @state.edit_mode
        (button type: "button", className: "btn_edit btn btn-primary", onClick: @_onEditFunding.bind(this, el), 'Edit')

      (div className: "col-xs-12 col-sm-12 col-md-12 col-lg-12", key: "funding_#{el.id}",
        (div className: "row",
          (div className: "col-xs-2 col-sm-2 col-md-2 col-lg-2 funding__timeline", 
            el.funded_on
            editBtn
            (span className: 'timeline__point'))

          (div className: "col-xs-5 col-sm-4 col-md-4 col-lg-4 funding__details", 
            (div className: 'details',
              
              (div className: 'row',
                (div className: "col-xs-4 col-sm-4 col-md-4 col-lg-4 funding__round", el.humanized_round)
                (div className: "col-xs-7 col-sm-7 col-md-7 col-lg-7", 
                  (h4 className: 'media-heading funding__amount', "$#{el.amount}")
                  (p className: "media-heading funding__investors_title", 'Investors:')
                  (div className: "funding__investors", investors) ))))

          (div className: "col-xs-5 col-sm-6 col-md-6 col-lg-6 funding__investor", 
            (div className: 'row',
              (div className: "col-xs-4 col-sm-3 col-md-2 col-lg-2", 
                (i className: 'funding__press_icon empty-body__icon fa fa-newspaper-o'))
              
              (div className: "col-xs-8 col-sm-9 col-md-10 col-lg-10 investor__links", 
                proofLink )))))
