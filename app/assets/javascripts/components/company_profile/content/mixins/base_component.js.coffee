@CompanyProfile_Content_BaseComponent = 
  propTypes: 
    company:     React.PropTypes.object.isRequired,
    saveProfile: React.PropTypes.func.isRequired

  getInitialState: ->
    edit_mode: false,
    company: @props.company
    
  onEdit: ->
    @setState edit_mode: true
    
  onCancel: (company)->
    options = edit_mode: false
    options.company = company if company
    
    @setState options