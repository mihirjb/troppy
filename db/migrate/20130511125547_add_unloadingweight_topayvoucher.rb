class AddUnloadingweightTopayvoucher < ActiveRecord::Migration
  def up
    add_column :payvouchers, :unloadingweight, :string
    
  end

  def down
  end
end
