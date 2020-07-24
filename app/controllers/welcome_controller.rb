class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails"
    session[:curso] = 'Curso de Ruby on Rails'
  end
end
