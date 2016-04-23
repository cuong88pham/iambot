class BotShop < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bot_buttons
  has_many :bot_messages

  belongs_to :shopping_message, class_name: 'Message'
  belongs_to :welcome_message, class_name: 'Message'

  def self.find_for_oauth(auth, signed_in_resource = nil)

    binding.pry
  end

end
