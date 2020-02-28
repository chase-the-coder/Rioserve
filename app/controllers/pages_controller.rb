class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'homepage', only: :home

  def home
    @restaurants = Restaurant.all
  end

  def contact
  end

  def about
  end
end
