class BotButton < ActiveRecord::Base
  belongs_to :bot_message
  belongs_to :shop
end
