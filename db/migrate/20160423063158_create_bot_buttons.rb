class CreateBotButtons < ActiveRecord::Migration
  def change
    create_table :bot_buttons do |t|
      t.string :title
      t.string :payload
      t.string :filter
      t.integer :shop_id

      t.timestamps null: false
    end
  end
end
