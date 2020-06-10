class ReservationsController < ApplicationController

  def index
    #userのID番号が1~5までは管理者専用ページに行くように設定する
    if current_user.id < 6 then
      redirect_to  edit_reservation_path(current_user.id)
    end
    #テーブルの中身がからだと正しい診察番号が表示されないため条件分岐
    if Reservation.count == 0 then
      @current_num = "現在、診察中の方はいません。"
      @next_num = "待ち時間はございません、御来院ください。"
    else
      @current_num = Reservation.first.examination
      @next_num = Reservation.count + 1
    end
  end

  def show
    
  end

  def new
  end

  def create
    #もし受付件数が０ならばダミーデータを作成する
    if Reservation.count == 0 then
      (1..5).each{ |n|
        dummy = Reservation.new(examination: n, user_id: n)
        dummy.save
      }
    end
    #ユーザーの情報をレコードに記録
    exam_num = Reservation.last.examination + 1
    reservation = Reservation.new do |r|
      r.examination = exam_num
      r.user_id = current_user.id
    end
    #受付済みのユーザーが再度受付すると一意性制約のせいでエラーが起こるので、ここでエスケープ
    if Reservation.where(user_id: current_user.id).empty? then
      reservation.save
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
