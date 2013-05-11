class CreateLrs < ActiveRecord::Migration
  def change
    create_table :lrs do |t|
      t.integer :lrno
      t.string :party
      t.string :truckno
      t.string :loadweight
      t.integer :advance

      t.timestamps
    end
  end
end
