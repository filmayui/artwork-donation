class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string      :artist_name,                    null: false, unique: true
      t.string      :affiliation
      t.text        :personal_history
      t.text        :reason_for_support_activities
      t.text        :artist_message
      t.references  :user,                           null: false, foreign_key: true
      t.references  :donation_project,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
