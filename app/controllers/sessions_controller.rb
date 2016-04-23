class SessionsController < ApplicationController

  def create
    @shop = Shop.find_or_create_from_auth_hash(auth_hash)
    self.current_shop = @shop
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end


end