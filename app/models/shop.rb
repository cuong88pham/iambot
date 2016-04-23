class Shop < ActiveRecord::Base
  has_many :bot_buttons
  has_many :bot_messages

  belongs_to :shopping_message, class_name: 'Message'
  belongs_to :welcome_message, class_name: 'Message'

end
