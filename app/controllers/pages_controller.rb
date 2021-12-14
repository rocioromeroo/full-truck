class PagesController < ApplicationController
  def home
    @freights = Freight.all
  end

  def about
  end

  def contact
  end
end
