require 'rails_helper'

RSpec.describe "participant_registrations/edit", type: :view do
  before(:each) do
    @participant_registration = assign(:participant_registration, ParticipantRegistration.create!(
      :participant => nil,
      :challenge => nil
    ))
  end

  it "renders the edit participant_registration form" do
    render

    assert_select "form[action=?][method=?]", participant_registration_path(@participant_registration), "post" do

      assert_select "input[name=?]", "participant_registration[participant_id]"

      assert_select "input[name=?]", "participant_registration[challenge_id]"
    end
  end
end
