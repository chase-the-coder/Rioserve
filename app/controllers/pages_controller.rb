class PagesController < ApplicationController

  layout 'homepage', only: :home

  def home
    @restaurants = Restaurant.all
  end

  def contact
  end

  def about
  end
end
