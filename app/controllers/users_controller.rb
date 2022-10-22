class UsersController < ApplicationController
  before_action :search

  def index
    # @user = User.all
    @rooms = @q.result
  end

  def new
    # @user = User.new
  end

  def create
    # @user.save(params_user)
    # if 
    #   flash[:notice] = "Object successfully created"
    #   redirect_to users_path
    # else
    #   render 'new'
    # end
  end

  def show
    # @user = User.find(params[:id])
  end
  
  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    # if @user.update(params_user)
    #   flash[:notice] = "Object was successfully updated"
    #   redirect_to users_path
    # else
    #   render 'edit'
    # end
  end

  def destroy
    # @user = User.find(params[:id])
    # if @user.delete
    #   flash[:success] = 'Object was successfully deleted.'
    #   redirect_to users_path
    # else
    #   render 'edit'
    # end
  end

  def search
    @q = Room.ransack(params[:q])
  end
end
