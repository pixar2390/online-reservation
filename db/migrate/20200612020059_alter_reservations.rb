class AlterReservations < ActiveRecord::Migration[5.2]
  def up
    #ブーリアン型を扱う時はデフォルト値を設定しておかないとNILLが入ってしまうためエラーの原因となる
    add_column :reservations, :flag, :boolean, null: false, default: false
  end

  def down
    remove_column :reservations, :flag
  end


end
