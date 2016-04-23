class BotShop < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  has_many :bot_buttons
  has_many :bot_messages

  belongs_to :shopping_message, class_name: 'Message'
  belongs_to :welcome_message, class_name: 'Message'

  def self.find_for_oauth(auth, signed_in_resource = nil)
  end

  def self.store(session)
    binding.pry
    shop = BotShop.new(shop_domain: session.url, shop_token: session.token)
    shop.save!
    shop.idh
  end

  def self.retrieve(id)
    binding.pry
    shop = BotShop.find(id)
    ShopifyAPI::Session.new(shop.shop_domain, shop.shop_token)
  end
end
