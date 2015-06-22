require 'rails_helper'

feature 'user signs in', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do

  before :each do
    Question.create(title: "Some questionSome questionSome questionThe first question", description: "The first questionThe first questionThe first questionThe first questionThe first questionThe first questionThe first questionThe first questionThe first question", user_id: 1)

    Question.create(title: "Another questionAnother questionAnother question", description: "The second questionThe second questionThe second questionThe second questionThe second questionThe second questionThe second questionThe second questionThe second question", user_id: 1)
  end

  scenario 'user views question index' do
    visit '/questions'

    expect(page).to have_content("Some question")
    expect(page).to have_selector("li:last-child", :text => "Some question")
  end
end
