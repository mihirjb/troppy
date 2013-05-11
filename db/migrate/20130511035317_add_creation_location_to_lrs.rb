class AddCreationLocationToLrs < ActiveRecord::Migration
  def change
    add_column :lrs, :creation_location, :string
  end
end
