class WelcomeController < ShopifyApp::AuthenticatedController
  layout 'welcome'

  def index
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
  end
  
  def step1
    @foods = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
  end

  def step2
    @foods = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
  end

  def step3
    @foods = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
  end
  
end
