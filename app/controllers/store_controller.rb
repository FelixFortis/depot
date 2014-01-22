class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @counter = increment_counter
    @time = current_time
  end

  def current_time
    t = Time.now
    t.strftime("%H:%M on %A %d/%m/%y")
  end

  def increment_counter
    session[:counter] ||= 0
    session[:counter] += 1
  end
end
