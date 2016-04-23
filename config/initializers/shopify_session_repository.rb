if Rails.configuration.cache_classes
  ShopifyApp::SessionRepository.storage = BotShop
else
  ActionDispatch::Reloader.to_prepare do
    ShopifyApp::SessionRepository.storage = BotShop
  end
end
