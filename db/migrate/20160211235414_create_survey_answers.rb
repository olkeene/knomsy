class CreateSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :survey_answers do |t|
      t.integer :survey_question_id
      t.integer :user_id

      t.datetime :created_at, null: false
    end
    
    add_index :survey_answers, :survey_question_id
    add_index :survey_answers, :user_id
  end
end
