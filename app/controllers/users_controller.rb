class UsersController < ApplicationController
  before_action :search

  def search
    @q = Room.ransack(params[:q])
  end
end
