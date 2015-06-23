

require 'rails_helper'

feature 'user answers another users question', %Q{
  As a user
I want to answer another user's question
So that I can help them solve their problem

Acceptance Criteria

[X] I must be on the question detail page
[X] I must provide a description that is at least 50 characters long
[X] I must be presented with errors if I fill out the form incorrectly
} do

  scenario 'user visits a question page and submits a valid answer' do
    expect(Answer.count).to eq 0

    question = Question.create(
      title: "This is a ridiculously horrible question that I shouldn't have to ask, but what...?",
      description: "I'd like to think that I haven't changed those things, sir. I am your worst nightmare! We could cause a diplomatic crisis. Take the ship into the Neutral Zone and attack the Romulans. Wouldn't that bring about chaos? Could someone survive inside a transporter buffer for 75 years? Flair is what marks the difference between artistry and mere competence. Sorry, Data. Fate. It protects fools, little children, and ships named \"Enterprise.\" This is not about revenge. This is about justice. Fear is the true enemy, the only enemy. Smooth as an android's bottom, eh, Data? Some days you get the bear, and some days the bear gets you. Maybe if we felt any human loss as keenly as we feel one of those close to us, human history would be far less bloody.",
      user_id: 1
    )

    visit "/questions/#{question.id}"

    answer = "Whatever drinking vinegar tattooed migas cred chillwave. Paleo slow-carb chillwave, four dollar toast YOLO hoodie twee Etsy PBR&B skateboard Helvetica. Quinoa kale chips bespoke banjo High Life. Squid vinyl banh mi, occupy distillery chia next level plaid semiotics gentrify taxidermy trust fund pickled quinoa Marfa. Brooklyn cold-pressed keffiyeh, heirloom fanny pack distillery 90's meh Wes Anderson. Tote bag tattooed mustache Marfa fanny pack aesthetic. Polaroid taxidermy cornhole banh mi."

    fill_in "Answer", with: answer

    click_button "Answer"

    expect(Answer.count).to eq 1
    expect(page).to have_content(question.description)
    expect(page).to have_content("Answer submitted.")
    expect(page).to have_content(answer)
  end

  scenario 'user visits a question page and submits an invalid answer' do
    expect(Answer.count).to eq 0

    question = Question.create(
      title: "This is a ridiculously horrible question that I shouldn't have to ask, but what...?",
      description: "I'd like to think that I haven't changed those things, sir. I am your worst nightmare! We could cause a diplomatic crisis. Take the ship into the Neutral Zone and attack the Romulans. Wouldn't that bring about chaos? Could someone survive inside a transporter buffer for 75 years? Flair is what marks the difference between artistry and mere competence. Sorry, Data. Fate. It protects fools, little children, and ships named \"Enterprise.\" This is not about revenge. This is about justice. Fear is the true enemy, the only enemy. Smooth as an android's bottom, eh, Data? Some days you get the bear, and some days the bear gets you. Maybe if we felt any human loss as keenly as we feel one of those close to us, human history would be far less bloody.",
      user_id: 1
    )

    visit "/questions/#{question.id}"

    answer = "I'd like to think."

    fill_in "Answer", with: answer

    click_button "Answer"

    expect(Answer.count).to eq 0
    expect(page).to have_content(question.description)
    expect(page).to have_content("Answer is too short (minimum is 50 characters)")
  end
end
