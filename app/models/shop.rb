class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  def self.store(session)

    shop = Shop.new(shopify_domain: session.url, shopify_token: session.token)
    shop.save!
    shop.id
  end

  def self.retrieve(id)
    shop = Shop.find(id)
    ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
  end
end
