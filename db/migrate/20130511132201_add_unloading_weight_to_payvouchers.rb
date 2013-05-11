class AddUnloadingToPayvouchers < ActiveRecord::Migration
  def change
    add_column :payvouchers, :unlaodingweight, :string
  end
end
