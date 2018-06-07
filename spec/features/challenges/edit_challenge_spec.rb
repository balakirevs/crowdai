require 'rails_helper'

feature "unauthorized" do
  let!(:organizer) { create :organizer }
  let!(:participant) { create :participant }
  let!(:challenge) { create :challenge, organizer: organizer }

  scenario 'not logged in' do
    visit edit_organizer_challenge_path(organizer,challenge)
    expect_sign_in
  end

  scenario 'user logged in' do
    log_in participant
    visit edit_organizer_challenge_path(organizer,challenge)
    expect_unauthorized
  end
end


feature 'An organizer updates a challenge' do
  let!(:organizer) { create :organizer }
  let!(:participant) { create :participant, organizer: organizer }
  let!(:challenge) { create :challenge, organizer: organizer }

  scenario 'update challenge', js: true do
    log_in participant
    visit edit_organizer_challenge_path(organizer,challenge)
    expect(page).to have_text 'Edit Challenge'

    check 'Show leaderboard?'
    click_button 'UPDATE CHALLENGE'

    expect(page).to have_text 'Challenge updated'
  end
end
