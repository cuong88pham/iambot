class HomeController < ShopifyApp::AuthenticatedController
  layout 'application'
  def index
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    render 'index'
  end

end
