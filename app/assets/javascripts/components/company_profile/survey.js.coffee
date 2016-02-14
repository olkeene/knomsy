{span, div, button} = React.DOM

@CompanyProfile_Survey = React.createFactory React.createClass
  propTypes: 
    company: React.PropTypes.object.isRequired
  
  getInitialState: ->
    currentQ: @_nextQuestion()
  
  answerTypes:
    gon.answerTypes
  
  _nextQuestion: (skip_id)->
    out = null
    
    $.ajax 
      url: Routes.next_company_questions_path(@props.company.id, format: 'json')
      method: 'get'
      async:  false
      data:   {skip_id: skip_id}
      success: (r)-> out = r
    
    out
  
  _next: (skip_id)->
    @setState currentQ: @_nextQuestion(skip_id)
    
  _save: (question, answerType)->
    $.ajax 
      url: Routes.company_question_answers_path(@props.company.id, question.id, format: 'json')
      method: 'post'
      async:  false
      data:   {answer: {answer_type: answerType}}
      success: (r)=>
        @_next()
  
  _renderQuestion: (question)->
    (span null,
      question.q
      
      (div null,
        (button className: 'btn btn-primary', type: 'button', onClick: @_save.bind(this, question, 'yes'), 'Yes')
        (button className: 'btn btn-primary', type: 'button', onClick: @_save.bind(this, question, 'no'),  'No')
        (button className: 'btn btn-primary', type: 'button', onClick: @_save.bind(this, question, 'partly'), 'Partly')
        (button className: 'btn btn-primary', type: 'button', onClick: @_save.bind(this, question, 'dont_know'), "I don't know") )
      (div null,
        (button className: 'btn_edit btn-next btn btn-primary', type: 'button', onClick: @_next.bind(this, question.id), 'Next') )
    )
    
  _render_done:
    'Survey has been completed!'
    
  render: ->
    content = if @state.currentQ
      @_renderQuestion(@state.currentQ)
    else
      @_render_done
    
    (div className: 'profile-survey',
      (div className: "container",
        (div className: "col-md-offset-3 col-md-6",
          content )))
