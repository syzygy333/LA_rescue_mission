require 'rails_helper'

feature 'user signs in', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question

  Acceptance Criteria

  [X] I must be able to get to this page from the questions index
  [X] I must see the question's title
  [X] I must see the question's description
} do



  scenario 'user visits question show page and sees questions details' do
    question = Question.create(title: "Some question", description: "The first question", user_id: 1)

    visit '/questions'

    click_link question.title

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
