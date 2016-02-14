class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.string :q,      null: false
      t.string :target, null: false
    end
    
    add_index :survey_questions, :q
  end
end
