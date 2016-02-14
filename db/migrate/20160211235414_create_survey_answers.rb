class CreateSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :survey_answers do |t|
      t.integer :survey_question_id,    null: false
      t.integer :company_id,            null: false
      t.integer :user_id,               null: false
      t.integer :status,      limit: 2, null: false, default: SurveyAnswer.statuses[:not_completed]
      t.integer :answer_type, limit: 2, null: false
    
      t.datetime :created_at, null: false
    end
    
    add_index :survey_answers, [:company_id, :status]
    add_index :survey_answers, [:survey_question_id, :company_id, :user_id, :status], name: 'question_company_user_status'
    add_index :survey_answers, [:survey_question_id, :company_id, :user_id, :status, :created_at], name: 'question_company_user_status_created_at'
  end
end
