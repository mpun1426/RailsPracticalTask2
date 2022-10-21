class AirphpController < ApplicationController
  def index
    @rooms = Room.all
  end
end
