class ReservationsController < ApplicationController

  def index
    #userのID番号が１の時管理者専用ページに行くように設定する
    if current_user.id < 2 then
      redirect_to  edit_reservation_path(current_user.id)
    end

  end

  def show
    
  end

  def new
  end

  def create
    @reservation = Reservation.new(group_params)
    if @reservation .save
      redirect_to root_path, notice: '予約を作成しました'
    else
      render :new
    end
  end

  def edit
    #病院関係者専用ページとする。ここで受付を完了した患者データ一覧をみながら、レコードを操作できるようにする
    
  end

  def update
    
  end

  def destroy
    
  end

  private



end
