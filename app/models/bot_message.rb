class BotMessage < ActiveRecord::Base
  has_many :bot_buttons
  belongs_to :shop
end
