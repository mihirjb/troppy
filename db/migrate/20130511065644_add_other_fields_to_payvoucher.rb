class AddOtherFieldsToPayvoucher < ActiveRecord::Migration
  def change
    add_column :payvouchers, :creation_location, :string
    add_column :payvouchers, :lr_id, :integer
    add_column :payvouchers, :lrno, :integer
    add_column :payvouchers, :party, :string
    add_column :payvouchers, :unloadingweight, :string
  end
end
