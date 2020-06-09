class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :examination,null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
