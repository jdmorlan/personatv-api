class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :owner_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.timestamps null: false
    end
  end
end
