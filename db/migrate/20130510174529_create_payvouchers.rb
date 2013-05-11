class CreatePayvouchers < ActiveRecord::Migration
  def change
    create_table :payvouchers do |t|
      t.integer :balpaid
      t.integer :totalamnt
      t.date :paiddate
      t.string :payee

      t.timestamps
    end
  end
end
