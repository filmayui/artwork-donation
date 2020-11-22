class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.string      :title,                   null: false
      t.text        :text,                    null: false
      t.string      :size,                    null: false
      t.integer     :price,                   null: false
      t.integer     :category_id,             null: false
      t.integer     :main_color_id,           null: false
      t.integer     :motif_id,                null: false
      t.integer     :feeling_id,              null: false
      t.integer     :prefecture_id,           null: false
      t.integer     :scheduled_delivery_id,   null: false
      t.references  :artist,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
