class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index]
  layout "home"
  def index; end
  
end