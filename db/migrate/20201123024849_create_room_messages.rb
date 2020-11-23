class CreateRoomMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :room_messages do |t|
      t.string      :text,                  null: false
      t.references  :artist,                null: false, foreign_key: true
      t.references  :donation_project_room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
