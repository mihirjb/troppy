class AddUserIdToLr < ActiveRecord::Migration
  def change
    add_column :lrs, :user_id, :integer
  end
end
