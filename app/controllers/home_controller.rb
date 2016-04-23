class HomeController < ShopifyApp::AuthenticatedController
  layout 'application'
  def index
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    if @products.present? 
      redirect_to step2_path
    end     
    render 'index'
  end

  def login
    render layout: 'login'
  end

  def wellcome
    render layout: 'login'
  end

  def step2
    render 'text'      
  end
end
