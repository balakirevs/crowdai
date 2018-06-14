class DatasetFilePolicy < ApplicationPolicy

  def index?
    participant
  end

  def new?
    participant && (participant.admin? || @record.challenge.organizer_id == participant.organizer_id)
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end

  def destroy?
    new?
  end

  class Scope
    attr_reader :participant, :scope

    def initialize(participant, scope)
      @participant = participant
      @scope = scope
    end

    def sql(participant_id:)
      %Q[
        dataset_files.visible IS TRUE
        AND dataset_files.evaluation IS FALSE
        AND EXISTS (
          SELECT 'X'
          FROM participant_registrations p
          WHERE p.participant_id = #{participant_id}
          AND p.challenge_id = dataset_files.challenge_id
        )
      ]
    end

    def resolve
      if participant && (participant.admin? || participant.organizer_id.present?)
        scope.all
      else
        scope.where(sql(participant_id: participant.id))
      end
    end
  end

end
