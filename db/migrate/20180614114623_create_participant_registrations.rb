class CreateParticipantRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_registrations do |t|
      t.references :participant, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
