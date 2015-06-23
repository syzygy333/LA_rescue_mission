class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates :answer, presence: true, length: { minimum: 50 }
  validates :question_id, presence: true
end
