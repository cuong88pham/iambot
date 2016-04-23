class HomeController < ShopifyApp::AuthenticatedController
  layout 'application'
  def index
<<<<<<< HEAD
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})

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
=======
  end  
>>>>>>> 0ef63667c06562c2bf4bce1a555626701e5abb5e
end
