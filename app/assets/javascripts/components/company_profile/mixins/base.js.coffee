@CompanyProfile_Base = 
  propTypes: 
    company: React.PropTypes.object.isRequired,
    saveProfile: React.PropTypes.func.isRequired
    
  getInitialState: ->
    edit_mode: false
    company: @props.company