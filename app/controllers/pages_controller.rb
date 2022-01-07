class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @freights = Freight.all
  end

  def about
  end

  def contact
  end
end
