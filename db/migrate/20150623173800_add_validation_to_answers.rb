class AddValidationToAnswers < ActiveRecord::Migration
  def up
    change_column :answers, :answer, :text, null: false
    change_column :answers, :question_id, :integer, null: false
  end

  def down
    change_column :answers, :answer, :text, null: true
    change_column :answers, :question_id, :integer, null: true
  end
end
