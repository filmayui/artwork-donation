class CreateSaleLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :sale_logs do |t|
      t.string     :artist_name
      t.string     :artwork_title
      t.integer    :donation_price
      t.references :donation_project_room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
