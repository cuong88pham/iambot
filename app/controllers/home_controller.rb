class HomeController < ApplicationController
  def index
    @page_title = "Conversation"
  end

  def login
    render layout: 'login'
  end

  def wellcome
    render layout: 'login'
  end
end
