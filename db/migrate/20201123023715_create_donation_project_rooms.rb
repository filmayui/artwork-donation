class CreateDonationProjectRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :donation_project_rooms do |t|
      t.references  :donation_project, null: false, foreign_key: true
      t.timestamps
    end
  end
end
