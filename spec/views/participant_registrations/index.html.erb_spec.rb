require 'rails_helper'

RSpec.describe "participant_registrations/index", type: :view do
  before(:each) do
    assign(:participant_registrations, [
      ParticipantRegistration.create!(
        :participant => nil,
        :challenge => nil
      ),
      ParticipantRegistration.create!(
        :participant => nil,
        :challenge => nil
      )
    ])
  end

  it "renders a list of participant_registrations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
