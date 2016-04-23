class HomeController < ShopifyApp::AuthenticatedController
  def index
    @page_title = "Conversation"
  end

  def callback
    binding.pry
    redirect_to '/products'
  end

  def products
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    render json: @products
  end

end
