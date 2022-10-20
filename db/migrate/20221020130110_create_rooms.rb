class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_introduction
      t.string :room_address
      t.integer :room_price
      t.string :image

      t.timestamps
    end
  end
end
