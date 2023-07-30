class ToppagesController < ApplicationController
  def index
    if logged_in?
      @schedule = current_user.schedules.build
      @pagy, @schedules = pagy(current_user.schedules.order(id: :desc), item: 30)
    end
  end
end
