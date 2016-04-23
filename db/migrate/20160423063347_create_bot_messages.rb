class CreateBotMessages < ActiveRecord::Migration
  def change
    create_table :bot_messages do |t|
      t.string :message
      t.integer :button_id
      t.integer :shop_id

      t.timestamps null: false
    end
  end
end
