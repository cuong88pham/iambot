class AddShoppingMessageIdWelcomeMessageIdToBotShop < ActiveRecord::Migration
  def change
    add_column :bot_shops, :shopping_message_id, :integer
    add_column :bot_shops, :welcome_message_id, :integer
  end
end
