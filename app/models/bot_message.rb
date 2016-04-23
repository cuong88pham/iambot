class BotMessage < ActiveRecord::Base
  has_many :bot_buttons
  belongs_to :bot_shop, , foreign_key: :shop_id
end
