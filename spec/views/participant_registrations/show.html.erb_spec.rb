require 'rails_helper'

RSpec.describe "participant_registrations/show", type: :view do
  before(:each) do
    @participant_registration = assign(:participant_registration, ParticipantRegistration.create!(
      :participant => nil,
      :challenge => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
