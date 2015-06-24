

require 'rails_helper'

feature 'user views all the answers to a question', %Q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions

  Acceptance Criteria

  [ ] I must be able delete a question from the question edit page
  [ ] I must be able delete a question from the question details page
  [ ] All answers associated with the question must also be deleted
} do

  let (:question) { Question.create(
    title: "The best question ever to be asked in the history of the universe",
    description: "How much wood would a woodchuck chuck if a woodchuck could chuck wood? Please tell me...I have a serious woodchuck-chucking-wood at me problem. dhofdshjlfhvldfbjgdofgjodfgjdfljvldfvjo.",
    user_id: 1) }

  let (:answer1) { Answer.create(answer: "I have an answer for you, but before I tell you, let me tell you all the ways in which you are a terrible human being.", question_id: question.id, user_id: 88) }
  let (:answer2) { Answer.create(answer: "I have an answer for you, but before I tell you, let me tell you all the ways in which you are a terrible human being.", question_id: question.id, user_id: 88) }
  let (:answer3) { Answer.create(answer: "I have an answer for you, but before I tell you, let me tell you all the ways in which you are a terrible human being.", question_id: question.id + 1, user_id: 88) }

  before :each do
    question
    answer1
    answer2
    answer3
    visit "/questions/#{question.id}"
  end

  scenario 'user deletes a question from the question details page and deletes associated answers' do
    expect(Answer.count).to eq(3)
    click_button 'Delete Question'

    expect(page).to have_content('Question deleted')
    expect(current_path).to eq('/questions')
    expect(page).not_to have_content(question.title)
    expect(Question.count).to eq(0)
    expect(Answer.count).to eq(1)
  end

  scenario 'user deletes a question from the question edit page and deletes associated answers' do
    click_button 'Edit Question'
    expect(page).to have_field('Title', with: question.title)

    expect(Answer.count).to eq(3)
    click_button 'Delete Question'

    expect(page).to have_content('Question deleted')
    expect(current_path).to eq('/questions')
    expect(page).not_to have_content(question.title)
    expect(Question.count).to eq(0)
    expect(Answer.count).to eq(1)
  end
end
