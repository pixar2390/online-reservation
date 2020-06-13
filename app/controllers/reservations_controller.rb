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
    #受付表テーブルを表示させるために、インスタンス変数に格納
    @users = User.all
    @reservations = Reservation.all 
  end

  def update
    @reservations = Reservation.all
    #診療が終わった患者を受付表から削除
    Reservation.find_by(user_id: params[:id]).destroy
    #受付表の上位５人にメールを送る
    @reservations.each.with_index(1) do |reservation, index|
      break if index > 5 
      #flagを目印にメールを送信する。flagが立ってるものは送信済みであるから省く。
      if reservation.flag == false then
        #通知メールを送信
        UserMailer.notice_email(User.find(reservation.user_id)).deliver_later
        #メールを送信した事を記録し変更を保存
        reservation.flag = true
        reservation.save
      end
    end
    redirect_to action: "edit"
  end

  def destroy
    #reservationsテーブルの中身をリセットする。
    Reservation.all.destroy_all
    #ダミーデータの作成（管理者アカウントが５人、登録されている事を利用する）
    #メールが送られないようにflagはデフォルトでtrueにしておく
    (1..5).each{ |n|
      dummy = Reservation.new(examination: n, user_id: n, flag: true)
      dummy.save
    }
    #redirect_toにすることにより、editアクションを実行
    redirect_to action: "edit"
  end

  private


end
