{span, div, button} = React.DOM

@CompanyProfile_Survey = React.createFactory React.createClass
  propTypes: 
    company: React.PropTypes.object.isRequired
    onDone:  React.PropTypes.func.isRequired
  
  getInitialState: ->
    currentQ: @_nextQuestion()
  
  answerTypes:
    gon.answerTypes
  
  _nextQuestion: ()->
    out = null
    
    $.ajax 
      url: Routes.next_company_questions_path(@props.company.id, format: 'json')
      method: 'get'
      async:  false
      success: (r)-> out = r
    
    out
  
  _next: ()->
    @setState currentQ: @_nextQuestion()
    
  _save: (question, answerType)->
    $.ajax 
      url: Routes.company_question_answers_path(@props.company.id, question.id, format: 'json')
      method: 'post'
      async:  false
      data:   {answer: {answer_type: answerType}}
      success: (r)=>
        @_next()
      error: (r)=>
        @_next()
  
  _renderQuestion: (question)->
    (span null,
      question.q
      
      (div null,
        (button className: 'btn btn-primary', type: 'button', onClick: @_save.bind(this, question, 'yes'), 'Yes')
        (button className: 'btn btn-primary', type: 'button', onClick: @_save.bind(this, question, 'no'),  'No')
        (button className: 'btn btn-primary', type: 'button', onClick: @_save.bind(this, question, 'partly'), 'Partly')
        (button className: 'btn btn-primary', type: 'button', onClick: @_save.bind(this, question, 'dont_know'), "I don't know") )
    )
    
  _render_done: ->
    setTimeout(
      ()=> @props.onDone(true),
      5000) # 5 seconds
    
    'Survey has been completed!'
    
  render: ->
    content = if @state.currentQ
      @_renderQuestion(@state.currentQ)
    else
      @_render_done()
    
    (div className: 'profile-survey',
      (div className: "container",
        (div className: "col-md-offset-3 col-md-6",
          content )))
