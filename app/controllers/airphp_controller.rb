class AirphpController < ApplicationController
  before_action :search
  def index
    @rooms = Room.all
    @rooms = @q.result
  end

  def search
    @q = Room.ransack(params[:q])
  end
end
