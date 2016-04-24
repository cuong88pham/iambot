class AjaxController < ActionController::Base
  layout :false
  respond_to :js

  def add_definition
    respond_to do |format|
      format.js
    end
  end

  def add_button
    respond_to do |format|
      format.js
    end
  end
end
