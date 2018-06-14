class ParticipantRegistrationsController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_challenge

  def create
    @participant_registration = @challenge.participant_registrations.create!(
      participant_id: current_participant.id)
    redirect_to challenge_path(@challenge)
  end

  private
  def set_challenge
    @challenge = Challenge.friendly.find(params[:challenge_id])
  end

end
