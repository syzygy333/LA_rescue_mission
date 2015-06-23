require 'rails_helper'

feature 'user views all the answers to a question', %Q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates

  Acceptance Criteria

  [ ] I must provide valid information
  [ ] I must be presented with errors if I fill out the form incorrectly
  [ ] I must be able to get to the edit page from the question details page
} do

  let (:question) { Question.create(
    title: "The best question ever to be asked in the history of the universe",
    description: "How much wood would a woodchuck chuck if a woodchuck could chuck wood? Please tell me...I have a serious woodchuck-chucking-wood at me problem. dhofdshjlfhvldfbjgdofgjodfgjdfljvldfvjo.",
    user_id: 1) }

  let (:answer) { Answer.create(answer: "I have an answer for you, but before I tell you, let me tell you all the ways in which you are a terrible human being.", question_id: question.id, user_id: 88) }

  before :each do
    question
    answer
    visit "/questions/#{question.id}"
    click_button 'Edit'
  end

  scenario 'user edits a question and provides valid information' do
    old_description = question.description

    expect(page).to have_field('Title', with: question.title)
    expect(page).to have_field('Description', with: question.description)
    expect(page).not_to have_content(answer.answer)

    new_description = 'This is going to be the most unthemely ever rewrite for a description. Hey that almost sounds like "unseemly", which is pretty fitting isnt it and now it is also time for run on sentences that are hopefully hopefully hopefully hopefully hopefully hopefully hopefully hopefully hopefully hopefully hopefully hopefully long enough.'

    fill_in 'Description', with: new_description

    click_button 'Edit'

    expect(page).to have_content("Edit successful")
    expect(page).to have_content(new_description)
    expect(page).to have_content(question.title)
    expect(page).not_to have_content(old_description)
    expect(current_path).to have_content("/questions/#{question.id}")
  end

  scenario 'user edits a question and provides invalid information' do
    old_description = question.description

    expect(page).to have_field('Title', with: question.title)
    expect(page).to have_field('Description', with: question.description)
    expect(page).not_to have_content(answer.answer)

    new_description = 'This is ... hopefully long enough?'

    fill_in 'Description', with: new_description

    click_button 'Edit'

    expect(page).to have_content("Description is too short (minimum is 150 characters)")
    expect(page).to have_field('Title', with: question.title)
    expect(page).to have_field('Description', with: new_description)
    expect(page).not_to have_content(old_description)
  end
end
