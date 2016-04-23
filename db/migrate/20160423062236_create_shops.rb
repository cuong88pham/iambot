class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :shop_domain
      t.string :shop_token
      t.string :name
      t.string :command
      t.integer :shopping_message_id
      t.integer :wellcome_message_id
      t.integer :status
      t.integer :subscription_type

      t.timestamps null: false
    end
  end
end
