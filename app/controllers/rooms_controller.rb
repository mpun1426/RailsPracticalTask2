class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "ホストルームが正常に登録されました"
      redirect_to rooms_path
    else
      render 'new'
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "編集内容を保存しました"
      redirect_to rooms_edit_select_path
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ホストルームを削除しました"
    redirect_to rooms_path
  end

  def edit_select
    @rooms = Room.all
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :room_address, :room_price, :image)
  end
end
