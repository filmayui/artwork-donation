class CreateArtworkOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :artwork_orders do |t|

      t.timestamps
    end
  end
end
