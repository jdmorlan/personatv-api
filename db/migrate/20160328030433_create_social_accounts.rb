class CreateSocialAccounts < ActiveRecord::Migration
  def change
    create_table :social_accounts do |t|
      t.integer :user_id, null: false
      t.string :provider, null: false
      t.string :account_id, null: false
      t.timestamps null: false
    end
  end
end
