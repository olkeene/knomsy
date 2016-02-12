{span, div, button} = React.DOM

@CompanyProfile_Survey = React.createFactory React.createClass
  propTypes: 
    company: React.PropTypes.object.isRequired
  
  getInitialState: ->
    questions = @_questions()
    currentQ  = questions.shift()
    
    questions:   questions
    currentQ:    currentQ
  
  # initial data
  _questions: ->
    # ajax...
    [{id: 1, q: 'foo'}, {id: 2, q: 'foo2'}]
  
  answerTypes:
    gon.answerTypes
  
  _nextQuestion: ->
    questions = @state.questions
    currentQ  = questions.shift()
    
    @setState question: questions, currentQ: currentQ
  
  _renderQuestion: (question)->
    (span null,
      question.q
      (div null,
        (button className: 'btn btn-primary', type: 'button', onClick: @_save.bind(this, @answerTypes.yes), 'Yes')
        (button className: 'btn btn-primary', type: 'button', onClick: @_save.bind(this, @answerTypes.no),  'No')
        (button className: 'btn btn-primary', type: 'button', onClick: @_save.bind(this, @answerTypes.partly), 'Partly')
        (button className: 'btn btn-primary', type: 'button', onClick: @_save.bind(this, @answerTypes.dont_know), "I don't know") )
      (div null,
        (button className: 'btn_edit btn-next btn btn-primary', type: 'button', onClick: @_onEdit, 'Next') )
    )
    
  _render_done: ->
    'Survey has been completed!'
    
  _save: (answerType)->
    console.log answerType
    @_nextQuestion()
    # ajax save  
    
  render: ->
    content = if @state.currentQ
      @_renderQuestion(@state.currentQ)
    else
      @_render_done()
    
    (div className: 'profile-survey',
      (div className: "container",
        (div className: "col-md-offset-3 col-md-6",
          content )))
