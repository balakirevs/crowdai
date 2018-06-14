require "rails_helper"

RSpec.describe ParticipantRegistrationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/participant_registrations").to route_to("participant_registrations#index")
    end

    it "routes to #new" do
      expect(:get => "/participant_registrations/new").to route_to("participant_registrations#new")
    end

    it "routes to #show" do
      expect(:get => "/participant_registrations/1").to route_to("participant_registrations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/participant_registrations/1/edit").to route_to("participant_registrations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/participant_registrations").to route_to("participant_registrations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/participant_registrations/1").to route_to("participant_registrations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/participant_registrations/1").to route_to("participant_registrations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/participant_registrations/1").to route_to("participant_registrations#destroy", :id => "1")
    end

  end
end
