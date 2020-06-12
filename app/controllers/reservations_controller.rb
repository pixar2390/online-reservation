class ReservationsController < ApplicationController

  def index
    #userのID番号が1~5までは管理者専用ページに行くように設定する
    if current_user.id < 6 then
      redirect_to  edit_reservation_path(current_user.id)
    end
    #テーブルの中身が空だと正しい診察番号が表示されないため条件分岐
    if Reservation.count == 0 then
      @current_num = "現在、休診中です。"
      @next_num = "現在、ネットでの受付は受理出来かねます。"
    else  #受付表に患者がいる場合
      @current_num = Reservation.first.examination
      @next_num = Reservation.count + 1
    end
  end

  def show
  end

  def new
  end

  def create
    #受付済みのユーザーが再度受付すると一意性制約のせいでエラーが起こるので、ここでエスケープ,且レコードが0の時は休診中と判断し受付をさせない
    if Reservation.where(user_id: current_user.id).empty? && Reservation.count != 0 then
      #ユーザーの情報をレコードに記録
      exam_num = Reservation.last.examination + 1
      reservation = Reservation.new do |r|
        r.examination = exam_num
        r.user_id = current_user.id
        r.flag = false
      end
      reservation.save
    else
      #renderメソッドの引数にアクション名指定すると、そのアクション名のテンプレートが呼ばれるだけで、アクションは読まれないのでインスタンス変数などを使っている場合は注意が必要。
      render :new
    end
  end

  def edit
    #病院関係者専用ページとする。ここで受付を完了した患者データ一覧をみながら、レコードを操作できるようにする
    
  end

  def update
  end

  def destroy
    binding.pry
    #reservationsテーブルの中身をリセットする。
    Reservation.all.destroy_all
    #ダミーデータの作成（管理者アカウントが５人、登録されている事を利用する）
    (1..5).each{ |n|
      dummy = Reservation.new(examination: n, user_id: n, flag: false)
      dummy.save
    }
    # UserMailer.notice_email(current_user).deliver_now
    #メールを送ったら、flagの値を編集
    
    #redirect_toにすることにより、editアクションを実行
    redirect_to action: "edit"
  end

  private


end
