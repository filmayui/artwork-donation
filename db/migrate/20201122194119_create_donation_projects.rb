class CreateDonationProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :donation_projects do |t|
      t.string   :project_name,   null: false
      t.text     :text,           null: false
      t.integer  :target_amount,  null: false
      t.integer  :current_amount, null: false, default: 0
      t.timestamps
    end
  end
end
