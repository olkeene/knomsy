#= require_directory ./header

@CompanyProfile_Header = React.createFactory React.createClass
  mixins: [CompanyProfile_Base]
    
  onEdit: ->
    @setState edit_mode: true
    
  onCancel: (company)->
    options = edit_mode: false
    options.company = company if company
    
    @setState options
    
  render: ->
    if @state.edit_mode && @props.canEditUser
      CompanyProfile_Header_Form(company: @state.company, saveProfile: @props.saveProfile, onCancel: @onCancel)
    else
      CompanyProfile_Header_View(company: @state.company, onEdit: @onEdit, canEditUser: @props.canEditUser)
