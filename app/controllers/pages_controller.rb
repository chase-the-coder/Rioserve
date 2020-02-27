class PagesController < ApplicationController

  layout "homepage", only: :home

  def home
  end

  def contact
  end

  def about
  end
end
