class AlterReservations < ActiveRecord::Migration[5.2]
  def up
    add_column :reservations, :flag, :boolean
  end

  def down
    remove_column :reservations, :flag
  end


end
