require 'rails_helper'

RSpec.describe "participant_registrations/new", type: :view do
  before(:each) do
    assign(:participant_registration, ParticipantRegistration.new(
      :participant => nil,
      :challenge => nil
    ))
  end

  it "renders new participant_registration form" do
    render

    assert_select "form[action=?][method=?]", participant_registrations_path, "post" do

      assert_select "input[name=?]", "participant_registration[participant_id]"

      assert_select "input[name=?]", "participant_registration[challenge_id]"
    end
  end
end
