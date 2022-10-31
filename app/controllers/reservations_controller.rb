class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(id: @reservation.room_id)
    if @reservation.user_id.blank?
      flash.now[:notice] = "予約するにはログインが必要です"
      render template: 'rooms/show'
    elsif @reservation.user_id == @room.user_id
      flash.now[:notice] = "自分がホストのルームは予約できません"
      render template: 'rooms/show'
    elsif @reservation.people.blank? || @reservation.check_in.blank? || @reservation.check_out.blank?
      flash.now[:notice] = "予約フォームは全て入力して下さい"
      render template: 'rooms/show'
    elsif @reservation.check_in < Date.current
      flash.now[:notice] = "チェックインは本日以降を選択して下さい"
      render template: 'rooms/show'
    elsif @reservation.check_in >= @reservation.check_out
      flash.now[:notice] = "チェックアウトはチェックインの翌日以降を選択して下さい"
      render template: 'rooms/show'
    elsif @reservation.people < 1
      flash.now[:notice] = "人数は1人以上を選択して下さい"
      render template: 'rooms/show'
    else
      @stay_days = (@reservation.check_out - @reservation.check_in).to_i
      @total_price = @room.room_price * @stay_days * @reservation.people
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "正常に予約されました"
      redirect_to airphp_index_path
    else
      flash[:notice] = "入力エラーです"
      render 'new'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if current_user.present?
      if current_user.id == @reservation.user_id
        @reservation.destroy
        flash[:notice] = "予約取消しました"
        redirect_to reservations_path
      else
        flash[:notice] = "予約取消できるのは自分の予約のみです"
        redirect_to reservations_path
      end
    else
      redirect_to rooms_nonlogin_path
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :room_id, :check_in, :check_out, :people, :total_price)
  end
end
