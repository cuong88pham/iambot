class OmniauthCallbacksController < ApplicationController

  def callback
    binding.pry
    redirect_to '/dashboard'
  end

  def dashboard
    render text: 'FU'
  end
end
