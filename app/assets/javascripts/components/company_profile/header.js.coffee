#= require_directory ./header

@CompanyProfile_Header = React.createFactory React.createClass
  mixins: [CompanyProfile_Base]
    
  onEdit: ->
    @setState edit_mode: true
    
  onCancel: (company)->
    options = edit_mode: false
    options.company = company if company
    
    @setState options
  
  onUpdate: (company) ->
    @setState company: company
    
  render: ->
    if @state.edit_mode
      CompanyProfile_Header_Form(company: @state.company, saveProfile: @props.saveProfile, onCancel: @onCancel)
    else
      CompanyProfile_Header_View(company: @state.company, onEdit: @onEdit, onUpdate: @onUpdate, canEditCompany: @props.canEditCompany)
