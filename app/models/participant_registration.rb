class ParticipantRegistration < ApplicationRecord
  belongs_to :participant
  belongs_to :challenge
end
