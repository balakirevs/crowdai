ActiveAdmin.register Leaderboard do
  belongs_to :challenge, parent_class: Challenge
  navigation_menu :challenge

  actions :index, :show

  filter :id
  filter :participant_id
  filter :name
  filter :media_content_type
  filter :submission_id

  index do
    selectable_column
    column :id
    column :participant_id
    column :name
    column :score
    column :score_secondary
    column :grading_status_cd
    column :post_challenge
    column :media_content_type
    column :updated_at
    actions
  end
end
