class BotButton < ActiveRecord::Base
  belongs_to :bot_message
  belongs_to :bot_shop, foreign_key: :shop_id
end
