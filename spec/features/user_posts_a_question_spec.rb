

require 'rails_helper'

feature 'user posts a question', %Q{
  As a user
  I want to post a question
  So that I can receive help from others

  Acceptance Criteria

  [X] I must provide a title that is at least 40 characters long
  [X] I must provide a description that is at least 150 characters long
  [X] I must be presented with errors if I fill out the form incorrectly
} do

  scenario 'user posts a valid question' do
    visit '/questions/new'
    fill_in "Title", with: "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
    fill_in "Description", with: "Now, how the hell do we defeat an enemy that knows us better than we know ourselves? Mr. Crusher, ready a collision course with the Borg ship. I think you've let your personal feelings cloud your judgement. We have a saboteur aboard. Earl Grey tea, watercress sandwiches... and Bularian canapés? Are you up for promotion? Did you come here for something in particular or just general Riker-bashing? Now we know what they mean by 'advanced' tactical training. I recommend you don't fire until you're within 40,000 kilometers. But the probability of making a six is no greater than that of rolling a seven. Congratulations - you just destroyed the Enterprise."
    click_button "Submit"

    expect(page).to have_content("Question submitted")
  end

  scenario 'user posts a invalid question' do
    visit '/questions/new'
    fill_in "Title", with: "abcdefghijkl"
    fill_in "Description", with: "Now, how the hell do we defeat an enemy that knows us better than we know ourselves?"
    click_button "Submit"

    expect(page).to have_content("Title is too short (minimum is 40 characters)")
    expect(page).to have_content("Description is too short (minimum is 150 characters)")
  end
end
