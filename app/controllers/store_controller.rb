class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @counter = increment_counter
    @date = current_date
    @time = current_time
  end

  def current_date
    Date.today
  end

  def current_time
    Time.now
  end

  def increment_counter
    session[:counter] ||= 0
    session[:counter] += 1
  end
end
