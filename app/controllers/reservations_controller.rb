class ReservationsController < ApplicationController

  def index
    #userのID番号が1~5までは管理者専用ページに行くように設定する
    if current_user.id < 6 then
      redirect_to  edit_reservation_path(current_user.id)
    end
    @current_num = Reservation.first
    @next_num = Reservation.count + 1
  end

  def show
    
  end

  def new
  end

  def create
    #もし受付件数が０ならばダミーデータを作成する
    binding.pry
    if Reservation.count == 0 then
      (1..5).each{ |n|
        dummy = Reservation.new(examination: n)
        dummy.save
      }
    end
    #ユーザーの情報をレコードに記録
    if Reservation.count == 0 then
      exam_num = 1
    else
      exam_num = Reservation.last.examination +1
    end
    reservation = Reservation.new do |r|
      r.examination = exam_num
      r.user_id = current_user.id
    end

    if reservation.save == true then
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
