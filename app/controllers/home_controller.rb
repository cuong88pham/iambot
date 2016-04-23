class HomeController < ShopifyApp::AuthenticatedController
  layout 'application'
  def index

    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})

    render 'index'
  end

  def login
    render layout: 'login'
  end

  def products
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    render json: @products
  end

  def wellcome
    render layout: 'login'
  end

  def step2
    render 'text'
  end
end
