require 'rails_helper'

feature 'user views all the answers to a question', %Q{
  As a user
  I want to view the answers for a question
  So that I can learn from the answer

  Acceptance Criteria

  [X] I must be on the question detail page
  [X] I must only see answers to the question I'm viewing
  [X] I must see all answers listed in order, most recent last
} do

  scenario 'user views question show page and sees all answers' do
    question1 = Question.create(title: "The best question ever to be asked in the history of the universe", description: "How much wood would a woodchuck chuck if a woodchuck could chuck wood? Please tell me...I have a serious woodchuck-chucking-wood at me problem. dhofdshjlfhvldfbjgdofgjodfgjdfljvldfvjo.", user_id: 1)

    answer1 = Answer.create(answer: "I have an answer for you, but before I tell you, let me tell you all the ways in which you are a terrible human being.", question_id: question1.id, user_id: 88)

    answer2 = Answer.create(answer: "Don't listen to that other guy. You're not a terrible human being. It's just a terrible terrible question and you should not be allowed to ask any more questions. Ever.", question_id: question1.id, user_id: 89)

    answer3 = Answer.create(answer: "Salamanders. Clams. Salamanders. Clams. Salamanders. Clams. Salamanders. Clams. Salamanders. Clams. Salamanders. Clams. Salamanders. Clams. Salamanders. Clams.", question_id: 17, user_id: 90)

    visit "/questions/#{question1.id}"

    expect(page).to have_content(question1.title)
    expect(page).to have_content(question1.description)
    expect(page).to have_content(answer1.answer)
    expect(page).to have_content(answer2.answer)
    expect(page).not_to have_content(answer3.answer)
  end
end
