@CompanyProfile_FormBaseMixin = 
  propTypes: 
    company:     React.PropTypes.object.isRequired,
    saveProfile: React.PropTypes.func.isRequired,
    onClose:     React.PropTypes.func.isRequired
    
  getInitialState: ->
    @props.company
    
  cancel: ->
    @props.onClose()