class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @myrooms = Room.where(user_id: current_user.id)
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
      flash.now[:notice] = "入力エラーです"
      render 'new'
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @host = User.find_by(id: @room.user_id)
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if current_user.id == @room.user_id
      if @room.update(room_params)
        flash[:notice] = "編集内容を保存しました"
        redirect_to rooms_edit_select_path
      else
        flash.now[:notice] = "入力エラーです"
        render 'edit'
      end
    else
      flash.now[:notice] = "自分がホストのルーム以外は編集できません"
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @reservations = Reservation.find_by(room_id: @room.id)
    if @reservations.blank?
      if current_user.id == @room.user_id
        @room.destroy
        flash[:notice] = "ホストルームを削除しました"
        redirect_to rooms_edit_select_path
      else
        flash.now[:notice] = "自分がホストのルーム以外は削除できません"
        render 'edit'
      end
    else
      flash.now[:notice] = "予約が1件以上あるため削除できません"
        render 'edit'
    end
  end

  def edit_select
    @myrooms = Room.where(user_id: current_user.id)
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :room_address, :room_price, :image, :user_id)
  end
end
