require 'rails_helper'

RSpec.describe "ParticipantRegistrations", type: :request do
  describe "GET /participant_registrations" do
    it "works! (now write some real specs)" do
      get participant_registrations_path
      expect(response).to have_http_status(200)
    end
  end
end
