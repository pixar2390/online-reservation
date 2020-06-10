class ReservationsController < ApplicationController

  def index
    #userのID番号が１の時管理者専用ページに行くように設定する
    if current_user.id < 2 then
      redirect_to  edit_reservation_path(current_user.id)
    end
    @current_num = Reservation.first.examination
    @next_num = Reservation.count + 1
  end

  def show
    
  end

  def new
  end

  def create
    exam_num = Reservation.count + 1
    reservation = Reservation.new do |r|
      r.examination = exam_num
      r.user_id = current_user.id
    end
    if reservation.save
      redirect_to root_path, notice: '受付が完了しました'
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
